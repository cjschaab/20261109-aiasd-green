---
ai_generated: true
model: "unknown/unknown@unknown"
operator: "jMM-at-CODETraining"
chat_id: "e9752f6f-5119-4a18-af86-2254b152ab42"
prompt: "create instruction files for the tech stack"
started: "2026-11-12T21:03:43-08:00"
ended: "2026-11-12T21:08:49-08:00"
task_durations:
  - task: "Creating stack instruction files and integration records"
    duration: "00:05:06"
total_duration: "00:05:06"
ai_log: "ai-logs/2026/11/12/e9752f6f-5119-4a18-af86-2254b152ab42/conversation.md"
source: "user request"
name: "react-typescript"
description: "Use when building or changing the task-manager React and TypeScript interface, including accessibility, API state, and refresh behavior."
applyTo: "**/*.{ts,tsx}"
revisions:
  - chat_id: "140da7f0-4588-44bf-96f8-6227aac3e0a8"
    model: "unknown/unknown@unknown"
    date: "2026-11-13"
    change: "Recorded pinned React/TypeScript/Vite tooling, Vitest/Playwright checks, and baseline verification."
    ai_log: "ai-logs/2026/11/13/140da7f0-4588-44bf-96f8-6227aac3e0a8/conversation.md"
version: "1.0.0"
author: "jMM-at-CODETraining"
tags: ["react", "typescript", "frontend", "task-manager"]
owner: "Development Team"
reviewedDate: "2026-11-12"
nextReview: "2027-02-12"
---

# React and TypeScript Instructions

## Overview

Apply these rules to the task-manager browser interface. The selected baseline uses React 19.3.1, TypeScript 7.0.2 with strict checking, Vite 8.3.8, and Node.js 26.13.1. Frontend unit/component checks use Vitest 5.1.0 and React Testing Library 16.3.3; browser smoke checks use Playwright 1.65.0. Follow the [architecture specification](../../task-manager-architecture.md) and do not treat these instructions as authorization to implement the application. Run `./scripts/verify.sh` for the reproducible baseline checks.

## Table of Contents

- [Component and Type Rules](#component-and-type-rules)
- [API, Refresh, and Mutation Behavior](#api-refresh-and-mutation-behavior)
- [Security and Accessibility](#security-and-accessibility)
- [Verification Checklist](#verification-checklist)
- [Summary](#summary)

## Component and Type Rules

- Keep components focused on a user workflow and separate reusable presentation from API and domain behavior.
- Enable and preserve strict TypeScript checking. Model API requests, responses, loading, saving, conflict, and error states explicitly; avoid `any` and unchecked casts.
- Treat server-confirmed data as authoritative. Keep unsaved drafts distinct from the last confirmed server state.
- Keep date-only task due dates as date-only values. Do not parse them as UTC timestamps or shift them through the browser's local time zone.
- Derive workspace scope and authorization on the server. Never trust a client-supplied workspace identifier as proof of access.

## API, Refresh, and Mutation Behavior

- Use the same-origin API where deployment supports it. Keep API calls behind a small typed boundary; do not couple components to raw transport details.
- Fetch current data when the app opens, when the user returns to it, and on an explicit refresh. Do not add polling, push updates, hidden offline queues, or automatic task-content persistence.
- Coalesce duplicate focus/visibility refresh triggers. Prevent older refresh or mutation responses from overwriting newer confirmed state.
- Preserve drafts during refresh. On refresh failure, retain the previous view and show a clear stale/error state; never replace it with an empty list that implies success.
- On save failure, preserve user input and explain the failure. Show “Saved” only after server confirmation; represent ambiguous outcomes as ambiguous, not as definite failure or success.
- Handle validation, unauthenticated access, unavailable resources, version conflicts, rate limits, and service failures as distinct user-visible states. Provide pairing or recovery guidance for authentication failure; do not silently create a new workspace.
- Make task deletion explicit and immediate after confirmation. Do not add undo, trash, list removal, workspace deletion, or other excluded product behavior.

## Security and Accessibility

- Treat all browser data and input as untrusted. Render task content as text; do not inject user-controlled HTML.
- Do not put device credentials, pairing grants, recovery secrets, or other secrets in JavaScript storage, URLs, logs, analytics, or screenshots. Let the server manage secure device cookies.
- Use semantic HTML, associated form labels, keyboard-operable controls, visible focus, and accessible names. Announce loading, save outcomes, validation errors, conflicts, and stale-data warnings to assistive technology without stealing focus.
- Preserve useful form values and provide actionable validation feedback; do not rely on color alone to communicate status.

## Verification Checklist

- [ ] Type-check and run the configured frontend unit, build, and browser smoke checks using `./scripts/verify.sh`.
- [ ] Verify keyboard and screen-reader access for task, list, pairing, and recovery flows.
- [ ] Verify refresh failure preserves the previous view and unsaved drafts.
- [ ] Verify stale responses cannot overwrite newer edits and conflicts retain the user's draft.
- [ ] Verify no polling, hidden offline writes, sensitive browser persistence, or unauthorized workspace access is introduced.
- [ ] Verify date-only due-date behavior across browser time zones and workspace-zone boundaries.
- [ ] Verify excluded product capabilities are not exposed.

## Summary

Keep the React/TypeScript client accessible and typed, with server-confirmed state, explicit refresh and error behavior, preserved drafts, and no client-side authority over workspace access.

**Related Instructions**: [ASP.NET Core](aspnet-core.instructions.md), [PostgreSQL](postgresql.instructions.md)
**Document Version**: 1.0.0
**Last Updated**: 2026-11-12
**Maintainer**: Development Team
