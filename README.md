---
ai_generated: true
model: "unknown/unknown@unknown"
operator: "jMM-at-CODETraining"
chat_id: "818a53e0-e8ca-4b1a-8eb0-db1fcb654c70"
prompt: |
  create a product requirement specification for a task manager
started: "2026-11-13T11:12:13.8724367-05:00"
ended: "2026-11-13T11:14:07.6955558-05:00"
task_durations: [{task: "Create and validate task manager product requirements specification", duration: "00:01:53"}]
total_duration: "00:01:53"
ai_log: "ai-logs/2026/11/13/818a53e0-e8ca-4b1a-8eb0-db1fcb654c70/conversation.md"
source: "user request"
revisions:
  - chat_id: "b860c9ec-84f4-4f84-b686-8fa34bf8ff6e"
    model: "unknown/unknown@unknown"
    date: "2026-11-13"
    change: "Added a conditional vertical-slice implementation roadmap; PRD and cross-functional approvals remain pending."
    ai_log: "ai-logs/2026/11/13/b860c9ec-84f4-4f84-b686-8fa34bf8ff6e/conversation.md"
  - chat_id: "40889748-90ba-4e66-aa9a-b8c8df7800b0"
    model: "unknown/unknown@unknown"
    date: "2026-11-13"
    change: "Recorded requester approval statements, the selected first-device bootstrap policy, and remaining VS-01 blockers."
    ai_log: "ai-logs/2026/11/13/40889748-90ba-4e66-aa9a-b8c8df7800b0/conversation.md"
  - chat_id: "e2a33dc9-d9fb-45d7-8e09-bb2d21c63c00"
    model: "unknown/unknown@unknown"
    date: "2026-11-13"
    change: "Updated the VS-01 readiness summary to reflect approved owner decisions and remaining G0 prerequisites."
    ai_log: "ai-logs/2026/11/13/e2a33dc9-d9fb-45d7-8e09-bb2d21c63c00/conversation.md"
  - chat_id: "140da7f0-4588-44bf-96f8-6227aac3e0a8"
    model: "unknown/unknown@unknown"
    date: "2026-11-13"
    change: "Recorded completed G0 baseline evidence and the approved VS-01 handoff."
    ai_log: "ai-logs/2026/11/13/140da7f0-4588-44bf-96f8-6227aac3e0a8/conversation.md"
---

# Task Manager

The [Task Manager Product Requirements Specification](task-manager-requirements.md) records @cjschaab's approval of v0.8 as-is as product owner on 2026-11-13.

The [Task Manager Architecture](task-manager-architecture.md) records @cjschaab's approval dated 2026-11-13; @cjschaab confirmed the technical-lead role and architecture alignment with PRD v0.8. The implementation toolchain and reproducible baseline are established.

The [Task Manager Implementation Roadmap](task-manager-implementation-roadmap.md) sequences the proposed work into conditional, testable vertical slices. It does not authorize implementation.

The [VS-01 workspace creation specification](specs/task-manager/vs-01-create-workspace.spec.md) has recorded decisions and baseline evidence but still needs explicit approval for implementation. G0 remains open until that approval is recorded; no VS-01 workspace behavior, schema, or migration has been implemented.

## Reproducible baseline

The repository pins .NET SDK 10.0.403, Node.js 26.13.1, the frontend dependency tree in `web/package-lock.json`, the .NET package trees in `packages.lock.json`, and `dotnet-ef` 10.0.15. PostgreSQL smoke tests use PostgreSQL 18.7 pinned by image digest in `compose.yaml`.

Install the exact Node.js and .NET SDK versions, Docker Compose, and Chromium for Playwright, then run:

```sh
./scripts/verify.sh
```

The script performs clean restores, frontend type/unit checks and production build, .NET build and API tests, PostgreSQL 18 connectivity verification, and a Playwright browser check against the ASP.NET Core host. It starts and removes a disposable database container. This baseline includes only a health endpoint and placeholder UI; it does not implement workspace creation, application schema, or migrations.
