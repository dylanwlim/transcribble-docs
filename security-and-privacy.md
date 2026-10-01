# Security And Privacy

Audio, transcripts, titles, notes, and speaker information can identify people or contain confidential material. Process recordings only when you have the right to do so and keep sensitive examples out of public reports.

## Local processing is not the same as never using a server

Final browser transcription uses a local browser worker after the necessary model/runtime download, when supported. Account sign-in and optional account saving use online services. Provisional browser live dictation follows the browser's speech-recognition implementation and is not promised to be fully local or offline.

The account-scoped IndexedDB/OPFS library belongs to the current browser profile. Browser storage can be cleared, become unavailable, or run out of space. Signing in does not create an automatic cloud backup of every recording.

## Optional account saving

Production account saving uploads private copies only after explicit consent in that browser. Use the visible saving state, pause, and refresh controls, and check whether a source fits the account limits. A file that remains local-only is not recoverable from another device merely because you signed into the same account. Preview account saving remains disabled.

A paused or pending save is not a completed save. Preserve important work with a separately exported recording backup and confirm the source is readable before clearing local storage. Deleted or missing source media cannot be recovered from a transcript-only export.

## Disabled public features

Desktop Helper and YouTube/link import are disabled in public releases. Do not follow old Helper setup directions or install a purported public Helper package. Public/preview builds do not probe localhost while that gate is off. Source-development support is not public distribution approval.

## Reporting a concern

Email [dylan@wlim.work](mailto:dylan@wlim.work) with a redacted description, affected page, browser, and approximate time. Prefer the sanitized support report and a non-sensitive sample. Do not attach real recordings, transcripts, filenames, notes, local paths, account tokens, cookies, or credentials unless a private handling process has been agreed first.

The [product guide](product-guide.md) and [FAQ](faq.md) explain storage, exports, and recovery limits.
