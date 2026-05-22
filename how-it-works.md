# How It Works

## High-level product structure

- Single-route app centered on the recording library and selected transcript workspace.
- Local browser storage keeps projects and media private to the user's browser/device.
- Browser transcription and Desktop Helper are presented as user-level processing routes.
- Settings separates general preferences, shortcuts, recording behavior, storage, and advanced support tools.

## Technology at a safe public level

- Next.js App Router, React, TypeScript, and Tailwind CSS.
- Browser media APIs, local browser storage, and web worker processing.
- Local transcription technology using browser-capable model/runtime assets at a high level.
- A same-computer Desktop Helper path for longer or memory-risk media.
- Node.js 24 validation, focused tests, and browser smoke checks in the private repo.

## What is intentionally not documented here

- Source-code layout beyond broad product areas.
- API implementation details.
- Database schemas or migrations.
- Auth, session, token, or authorization internals.
- Deployment secrets, provider credentials, or private infrastructure.
- Hidden routes, internal prompts, proprietary algorithms, or client-sensitive data.
