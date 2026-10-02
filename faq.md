# FAQ

## Do I need a DWL Account?

Yes, workspace access requires DWL Accounts. The public homepage is separate from the signed-in workspace.

## Does signing in automatically upload my recordings?

No. The account-scoped browser library is local. Production account saving requires explicit upload consent in each browser. Preview account saving remains disabled.

## Why is a recording missing on my other device?

It may exist only in the first browser, exceed account-saving limits, or still have a pending/failed upload. Check the original browser's saving state and whether source media is readable. A signed-in account or a saved transcript is not proof that every audio file uploaded. Use a recording backup when needed.

## Why does a long recording stay saved without a finished transcript?

Browser transcription is deliberately bounded by file, duration, memory, and runtime support. Unsupported work stays available for source-download/backup recovery when the local source is readable. Repeatedly forcing an unsafe browser job is not a supported workaround.

## Where do I install Desktop Helper or import a YouTube link?

Those features are disabled in the public release. Import a local media file you are entitled to process instead.

## Is live dictation the final local transcript?

No. Live dictation is provisional and may use online speech recognition provided by your browser. Review the finished transcript before relying on it.

## Can a transcript-only export recover missing audio?

No. A recording backup includes media only when that media is readable during export. Keep an independently verified backup before deleting the only source or clearing browser storage.

## What should I send with a bug report?

Use a non-sensitive sample, the affected action, browser, and a redacted error description. Do not send real confidential recordings, transcripts, credentials, or identifying screenshots. Email [dylan@wlim.work](mailto:dylan@wlim.work). See [security and privacy](security-and-privacy.md).
