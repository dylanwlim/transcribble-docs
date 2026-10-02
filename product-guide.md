# Product Guide

Transcribble is a DWL Account-backed, local-first voice workspace for recording or importing audio/video, browser transcription, transcript review, and export. The public homepage is [transcribble.dylanwlim.com](https://transcribble.dylanwlim.com); the signed-in workspace is `/workspace`.

## Record, review, and export

1. Open the workspace and sign in through DWL Accounts. Choose **New > Record audio** or **New > Import audio**, or use Record/Import in an empty library.
2. For an import, review the file type, storage fit, and available transcription path before starting. Microphone recording asks for browser microphone permission.
3. Let the app save the source and transcribe when the browser/device path is supported. For long, large, or memory-risk media, preserve the recording and use source download or a backup rather than repeatedly forcing an unsupported browser job.
4. Review playback and transcript text, make corrections, and use the Notes, Details, Export, and Tuning panels. Organize recordings into folders when needed.
5. Export the transcript or a recording backup. Verify an exported copy before deleting the only local source or clearing browser storage.

## Local storage and account saving

Recordings and folders are saved in this browser for your account. Clearing browser data, running out of space, or losing the device can make local recordings unavailable.

Production account saving is an optional, private cross-device copy. It requires explicit upload consent in each browser. Sign-in alone is not permission to upload recordings. Use the visible saving status, pause, and refresh controls; pending changes, a paused service, or a failed upload must not be described as fully saved to the account.

The documented free limits are **250 MiB per account**, **50 MiB per source file**, and a separate metadata limit. Shared service capacity can also constrain new uploads. A file that does not fit account saving must remain a local-only source rather than be presented as cloud-saved. Keep a separate exported backup of important work. Conflicting edits are preserved as conflict copies instead of silently treating one device as authoritative.

## Public availability and limits

| Capability | Public product boundary |
| --- | --- |
| Browser transcription | Transcribe on your device when the file and browser are supported; initial setup requires internet access. |
| Account saving | Enabled for production with explicit per-browser consent; previews remain disabled. |
| Desktop Helper | Unavailable in the public release. |
| YouTube/link import | Unavailable in the public release. Import a local media file you are entitled to process. |
| Long or memory-risk recordings | Preserve local source and use source-download/backup recovery when transcription is unavailable. |
| Automatic speaker diarization | Unavailable; you can add speaker labels manually. |

Mobile browsers can preserve recordings locally even when transcription cannot finish. **Share backup** opens the Export tools for recovery or a later desktop import.

Browser-provided live dictation is provisional and can behave differently from the final local browser transcription. It is not proof that all speech-recognition activity stays on the device.

## Supported media and exports

Supported import extensions include `.mp3`, `.mp4`, `.m4a`, `.wav`, `.mov`, `.ogg`, `.webm`, `.flac`, and `.aac`. A supported extension does not guarantee that every codec, duration, or size is processable on every device. Images and documents are not audio/video imports.

Transcript exports include `.txt`, `.md`, `.srt`, and `.vtt`. Recording backups use `.transcribble.tar`. A backup can contain source media only when that media is still readable; a transcript-only recovery cannot provide missing playback audio.

See [setup and access](setup.md), [FAQ](faq.md), and [security and privacy](security-and-privacy.md).
