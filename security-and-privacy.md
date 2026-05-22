# Security and Privacy

## Public posture

Transcribble is designed around local media privacy. Public docs should not include transcript text, recording names, helper addresses, raw diagnostic logs, local paths, model cache paths, or support-report internals.

## Publishing controls

- Public docs are maintained in `docs-public/` in the private source repository.
- The publish workflow uses an allowlist-only sync.
- The workflow publishes Markdown documentation only.
- The workflow runs a leak check before publishing.
- Source folders, package files, lockfiles, env files, config files, API routes, database files, deployment files, tests, fixtures, and generated artifacts are never mirrored into the public docs repository.

## Do not publish

- Secrets, tokens, keys, provider credentials, or environment variable values.
- Internal architecture diagrams that expose private implementation or infrastructure.
- API implementation details, database schema, auth/session internals, or deployment runbooks.
- Customer, client, patient, user, recording, booking, portfolio, or operational data.
- Private prompts, proprietary algorithms, hidden routes, or unreleased business logic.

## Reporting concerns

If a public doc appears to expose private or sensitive information, treat it as a publishing issue and remove the content from the public docs repository while the private source docs are corrected.
