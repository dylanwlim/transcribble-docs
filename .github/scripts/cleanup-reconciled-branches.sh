#!/usr/bin/env bash
set -euo pipefail

readonly cleanup_repository="dylanwlim/transcribble-docs"
readonly integration_pr="2"

if [[ "${GITHUB_REPOSITORY:-}" != "$cleanup_repository" || "${GITHUB_REF:-}" != "refs/heads/main" ]]; then
  echo "Cleanup is restricted to this repository's protected main."
  exit 1
fi

metadata=$(mktemp)
trap 'rm -f "$metadata"' EXIT
integration=$(gh api "repos/${GITHUB_REPOSITORY}/pulls/${integration_pr}" \
  --jq '{merged, merge_sha: .merge_commit_sha, head_sha: .head.sha, base_ref: .base.ref, base_repository: .base.repo.full_name, head_repository: .head.repo.full_name}')
[[ "$(jq -r '.merged' <<< "$integration")" == true ]] || { echo "Reconciliation PR ${integration_pr} is not merged."; exit 1; }
[[ "$(jq -r '.base_ref' <<< "$integration")" == main && "$(jq -r '.base_repository' <<< "$integration")" == "$cleanup_repository" && "$(jq -r '.head_repository' <<< "$integration")" == "$cleanup_repository" ]] || { echo 'Reconciliation repository or base does not match.'; exit 1; }
integration_head=$(jq -r '.head_sha' <<< "$integration")
merge_sha=$(jq -r '.merge_sha' <<< "$integration")
[[ "$integration_head" =~ ^[0-9a-f]{40}$ && "$merge_sha" =~ ^[0-9a-f]{40}$ ]] || exit 1

# A squash can preserve the complete tree without making the original heads main ancestors.
# GitHub retains the PR head ref, so prove the merged tree against that preserved history.
git fetch --no-tags origin "refs/pull/${integration_pr}/head"
[[ "$(git rev-parse FETCH_HEAD)" == "$integration_head" ]] || { echo 'Retained PR head does not match the merged PR.'; exit 1; }
git fetch --no-tags origin "$merge_sha"
git fetch --no-tags origin refs/heads/main:refs/remotes/origin/main
main_sha=$(git rev-parse refs/remotes/origin/main)
git merge-base --is-ancestor "$merge_sha" "$main_sha" || { echo 'Merge commit is not included in main.'; exit 1; }
[[ "$(git rev-parse "${integration_head}^{tree}")" == "$(git rev-parse "${merge_sha}^{tree}")" ]] || { echo 'Merged tree differs from the reviewed integration.'; exit 1; }

gh api --paginate "repos/${GITHUB_REPOSITORY}/branches?per_page=100" \
  --jq '.[] | {name, protected, sha: .commit.sha}' > "$metadata"

leases=()
deletions=()
inspected=()

# This list is limited to the October 1 reconciliation. New work is not a target.
while IFS= read -r branch; do
  [[ "$branch" != main ]] || exit 1
  record=$(jq -cs --arg branch "$branch" 'map(select(.name == $branch)) | first // empty' "$metadata")
  if [[ -z "$record" ]]; then
    printf 'Already absent: %s\n' "$branch"
    continue
  fi
  if [[ "$(jq -r '.protected' <<< "$record")" != false ]]; then
    printf 'Preserving protected branch: %s\n' "$branch"
    continue
  fi
  expected=$(jq -r '.sha' <<< "$record")
  [[ "$expected" =~ ^[0-9a-f]{40}$ ]] || exit 1
  git fetch --no-tags origin "$expected"
  if ! git merge-base --is-ancestor "$expected" "$integration_head"; then
    printf 'Preserving unmerged work: %s at %s\n' "$branch" "$expected"
    continue
  fi
  leases+=("--force-with-lease=refs/heads/${branch}:${expected}")
  deletions+=(":refs/heads/${branch}")
  inspected+=("${branch} at ${expected}")
done <<'BRANCHES'
docs/reconcile-source-20261001
BRANCHES

if [[ ${#deletions[@]} == 0 ]]; then
  echo 'No eligible reconciliation branches remain.'
  exit 0
fi
if [[ "${BRANCH_CLEANUP_WRITE:-}" != 1 ]]; then
  printf 'Dry run: merged branch %s\n' "${inspected[@]}"
  exit 0
fi
# Inspect every target first. One atomic push refuses the whole batch if any tip changed.
git push --atomic "${leases[@]}" origin "${deletions[@]}"
printf 'Deleted merged branch: %s\n' "${inspected[@]}"
