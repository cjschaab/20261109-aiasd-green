---
ai_generated: true
model: "unknown/unknown@unknown"
operator: "jMM-at-CODETraining"
chat_id: "818a53e0-e8ca-4b1a-8eb0-db1fcb654c70"
prompt: "create a product requirement specification for a task manager"
started: "2026-11-13T11:12:13.8724367-05:00"
ended: "2026-11-13T11:14:07.6955558-05:00"
task_durations: [{task: "Create and validate task manager product requirements specification", duration: "00:01:53"}]
total_duration: "00:01:53"
ai_log: "ai-logs/2026/11/13/818a53e0-e8ca-4b1a-8eb0-db1fcb654c70/conversation.md"
source: "user request"
revisions:
  - chat_id: "05756309-6540-444f-a125-23ca22810623"
    model: "unknown/unknown@unknown"
    date: "2026-11-13"
    change: "Added proposed answers to open product questions and candidate pilot targets; no proposals approved."
    ai_log: "ai-logs/2026/11/13/05756309-6540-444f-a125-23ca22810623/conversation.md"
  - chat_id: "49503b4a-bb7f-44e4-ab20-903df5f77a78"
    model: "unknown/unknown@unknown"
    date: "2026-11-13"
    change: "Added source-traceable candidate business rules, actor flows, evidence classifications, and unresolved tensions; no policy approved."
    ai_log: "ai-logs/2026/11/13/49503b4a-bb7f-44e4-ab20-903df5f77a78/conversation.md"
  - chat_id: "8615363a-07c1-46ef-a01b-537963b329e0"
    model: "unknown/unknown@unknown"
    date: "2026-11-13"
    change: "Added proposed resolutions for remaining product questions; architecture authority and evidence-dependent limits remain open."
    ai_log: "ai-logs/2026/11/13/8615363a-07c1-46ef-a01b-537963b329e0/conversation.md"
  - chat_id: "f601af09-634d-4903-8f58-f443765dd157"
    model: "unknown/unknown@unknown"
    date: "2026-11-13"
    change: "Applied the user's baseline-first metric recommendations; no numeric activation or task-capture targets approved."
    ai_log: "ai-logs/2026/11/13/f601af09-634d-4903-8f58-f443765dd157/conversation.md"
  - chat_id: "3e395daa-60a4-4008-a435-0ac545673b01"
    model: "unknown/unknown@unknown"
    date: "2026-11-13"
    change: "Recorded requester-selected v1 product defaults in the draft; formal and cross-functional approvals remain pending."
    ai_log: "ai-logs/2026/11/13/3e395daa-60a4-4008-a435-0ac545673b01/conversation.md"
  - chat_id: "9e2e0d9b-5417-4f1b-bc08-cef55d768ed0"
    model: "unknown/unknown@unknown"
    date: "2026-11-13"
    change: "Recorded requester-selected timezone and pairing interaction defaults, deletion/restore guarantee, provider-neutral hosting, and baseline-first pilot targets; approvals remain pending."
    ai_log: "ai-logs/2026/11/13/9e2e0d9b-5417-4f1b-bc08-cef55d768ed0/conversation.md"
  - chat_id: "55f7f458-0ae1-4ce1-ad18-0e307945667d"
    model: "unknown/unknown@unknown"
    date: "2026-11-13"
    change: "Recorded requester approval of the architecture specification; this PRD remains unapproved."
    ai_log: "ai-logs/2026/11/13/55f7f458-0ae1-4ce1-ad18-0e307945667d/conversation.md"
  - chat_id: "40889748-90ba-4e66-aa9a-b8c8df7800b0"
    model: "unknown/unknown@unknown"
    date: "2026-11-13"
    change: "Recorded requester approval of PRD v0.8 as-is; organizational approval authority remains unspecified."
    ai_log: "ai-logs/2026/11/13/40889748-90ba-4e66-aa9a-b8c8df7800b0/conversation.md"
  - chat_id: "140da7f0-4588-44bf-96f8-6227aac3e0a8"
    model: "unknown/unknown@unknown"
    date: "2026-11-13"
    change: "Recorded @cjschaab's confirmed product-owner authority and PRD v0.8 approval; clarified current approval status and baseline evidence."
    ai_log: "ai-logs/2026/11/13/140da7f0-4588-44bf-96f8-6227aac3e0a8/conversation.md"
---

# Task Manager Product Requirements Specification

**Status:** Approved by product owner @cjschaab on 2026-11-13  
**Version:** 0.8
**Date:** 2026-11-13  
**Product owner / approver:** @cjschaab (confirmed product-owner authority on 2026-11-13)  
**Source:** User request to create a product requirement specification; repository task-manager instructions.  
**Evidence note:** No user research, stakeholder interview, or existing product behavior was available when v0.6 was prepared. On 2026-11-13, @cjschaab confirmed product-owner authority and approved PRD v0.8 as-is. The technical lead separately confirmed architecture alignment with v0.8.

## 1. Summary

Define a browser-based task manager that lets people organize tasks in a workspace, group them into lists, set optional due dates, and track completion. Users access their workspace from authorized devices. The first release is proposed as a focused task-and-list workflow, with clear handling of access, refresh, validation, and concurrent edits.

PRD v0.8 is approved by product owner @cjschaab. The v1 individual-owner workspace model and product defaults are approved; launch context, user research, and success targets still need validation or owner decisions as described below.

## 2. Problem and Opportunity

**Problem hypothesis:** People need a dependable place to capture and organize work, see what is due, and mark work complete. The request supplies no research or specific pain points, so this hypothesis must be validated with intended users before it is treated as established need.

**Desired outcome:** A user can reliably create, find, organize, update, and complete tasks without losing confirmed changes or exposing another workspace's data.

## 3. Goals and Success Measures

The definitions below are proposed for pilot measurement. Collect baseline data during the pilot; defer numeric activation and task-capture targets until that evidence is reviewed. Instrumentation and analytics handling require owner approval.

| Measure | Definition | Target status |
| --- | --- | --- |
| Activation | Share of new workspaces that create at least one task within 24 hours | Establish baseline during pilot; set a numeric target after review |
| Task capture reliability | Successful task creations divided by valid task creation requests received by the service | Establish baseline during pilot; set a numeric target after review |
| Task completion | Share of tasks in a cohort marked complete during the agreed period | Report descriptively; do not use as a launch gate until user behavior is understood |
| Data isolation | Confirmed unauthorized cross-workspace task/list disclosures | Security acceptance gate: 0 confirmed disclosures; not a product KPI |
| Core-flow accessibility | Core task and list flows operable by keyboard and assistive technology | Candidate target: WCAG 2.2 AA; confirm conformance scope and test plan |

## 4. Users and Primary Scenarios

### Proposed user groups

- **Workspace creator:** creates a workspace and its initial task list.
- **Workspace user:** captures, organizes, reviews, and completes tasks from an authorized browser/device.
- **Paired-device user:** authorizes another device to access an existing workspace and can recover access when needed.

These roles describe the approved v1 product model, not an authorization implementation. PRD v0.8 approves one owner per workspace and same-owner paired devices, with cross-person sharing excluded from v1. VS-01 bootstrap and credential policy are security-approved; pairing and recovery implementation details remain gated.

### Primary scenarios

1. A person creates a workspace, then records a task in the default list.
2. A person creates and renames lists to organize tasks, and moves a task between lists.
3. A person reviews open or completed tasks, searches by title, sets or changes a due date, and marks a task complete or incomplete.
4. A person opens the app again or returns to it and sees current server-confirmed data; an explicit refresh is available.
5. A person pairs another device with the workspace, or follows a recovery flow when access is lost.
6. Two devices edit the same task; the app preserves the user's draft and reports a conflict rather than silently replacing newer data.

## 5. Scope

### Proposed first-release scope

- Workspace creation and access from authorized devices.
- A default `Tasks` list created with each workspace.
- Task creation, viewing, editing, completion-state changes, and explicit deletion.
- Additional named lists, task organization, list renaming, and task movement.
- Optional date-only due dates and title search.
- Device pairing and access recovery, subject to security review and approved flow details.
- Explicit loading, empty, stale-data, validation, conflict, and service-error states.

### Non-goals for this draft

- Team collaboration, roles, sharing, comments, attachments, or activity feeds.
- Notifications, recurring tasks, priorities, tags, subtasks, calendar integrations, or reporting.
- Offline writes, background synchronization, or automatic polling.
- Trash, undo, list deletion, whole-workspace deletion, or automatic inactivity cleanup.
- Native mobile applications or a specific hosting, component, authentication-library, or database-access product.

Non-goals follow the current repository guidance where specified; the remaining exclusions are proposed scope limits and require product confirmation.

## 6. Functional Requirements

Each acceptance statement is intended to be observable in a product test. “Repository constraint” identifies existing workspace guidance, not proof that the behavior is implemented.

| ID | Requirement | Acceptance criteria | Source / rationale |
| --- | --- | --- | --- |
| FR-01 | The system shall create an isolated workspace for a user and create its default `Tasks` list with it. | Given a valid workspace-creation request, when creation succeeds, then the user can access the new workspace and its `Tasks` list; if either record cannot be created, neither is exposed as a successful partial workspace. | Repository constraint: ASP.NET Core and PostgreSQL instructions; behavior and user eligibility need confirmation. |
| FR-02 | The system shall require an authorized workspace context for every task and list read or change. | Given a credential for workspace A, when a request targets workspace B data, then the request returns a non-disclosing denial/unavailable outcome and does not reveal whether the resource exists. | Repository constraint: workspace isolation guidance. |
| FR-03 | An authorized user shall be able to create a task in a list in the same workspace. | Given a valid task and list, when saved, then the task appears in that list after server confirmation; invalid or cross-workspace list references are rejected without creating a task. | Proposed core capability; required task fields and validation limits TBD. |
| FR-04 | An authorized user shall be able to view tasks in a list and distinguish completed from incomplete tasks. | Given a list with tasks in both states, when opened, then each task and its completion state are displayed; an empty list is distinguishable from a failed load. | Proposed core capability. |
| FR-05 | An authorized user shall be able to update a task and change its completion state. | Given the current task version, when a valid change is saved, then the server-confirmed value is displayed; on validation or save failure, the user's entered values remain available. | Proposed core capability; version-conflict behavior is a repository constraint. |
| FR-06 | An authorized user shall be able to explicitly delete a task. | Given a task in the authorized workspace, when the user confirms deletion, then it is no longer returned in normal task views; a stale deletion cannot remove a newer task state. | Repository constraint: explicit deletion; no trash or undo. Confirmation interaction is proposed. |
| FR-07 | An authorized user shall be able to create and rename named lists and move tasks between lists in the same workspace. | Given a valid list name or move request, when saved, then the list/task association is reflected after server confirmation; cross-workspace moves are rejected. | Proposed organization capability; list naming rules and list deletion policy need confirmation. |
| FR-08 | A user shall be able to assign or clear an optional due date on a task. | Given a valid calendar date, when saved, then the same date is displayed regardless of browser time zone; an absent due date remains absent. | Repository constraint: due dates are date-only; product semantics and date bounds TBD. |
| FR-09 | A user shall be able to search tasks by title within the authorized workspace. | Given a title query, when submitted, then results contain only matching tasks in the authorized workspace; matching is case-insensitive and treats search characters literally. | Repository constraint: PostgreSQL guidance specifies literal, case-insensitive substring matching. Search scope/filter controls TBD. |
| FR-10 | The app shall refresh server-confirmed workspace data when opened, when the user returns to it, and on explicit user request. | Given successful refresh, then current confirmed data is shown; given a refresh failure, then the last view and unsaved drafts remain and a stale/error state is shown rather than an empty success state. | Repository constraint: React/TypeScript guidance; no polling or hidden offline queue. |
| FR-11 | The system shall detect stale task changes instead of silently overwriting newer data. | Given two devices editing the same task version, when the older version is submitted after a newer change, then the stale request is reported as a conflict, the newer confirmed data remains intact, and the user's draft is retained for resolution. | Repository constraint: version-aware mutations and explicit conflict state. |
| FR-12 | A user shall be able to authorize another device and recover workspace access through approved flows. | Given a valid, unexpired, unused pairing grant, when an authorized issuer completes pairing, then the new device can access only that workspace; expired or reused grants fail safely. Given a recovery flow, then completion rotates or revokes prior access as defined by the approved security policy. | The same-owner model and code-entry interaction are selected; security approval of issuer eligibility, grant expiry, recovery proof, and recovery policy remains required before VS-03. |
| FR-13 | The app shall report loading, validation, access, unavailable-resource, conflict, rate-limit, and service-failure outcomes distinctly and accessibly. | Given each outcome, then the user receives a clear, actionable status; status is not communicated by color alone and is announced to assistive technology without unexpected focus movement. | Repository constraint: React and ASP.NET Core instructions. |

## 7. Quality and Operational Requirements

| ID | Requirement | Verification |
| --- | --- | --- |
| QR-01 | The browser experience shall support semantic controls, keyboard operation, visible focus, associated form labels, and accessible names. | Keyboard-only walkthrough and automated accessibility checks on task, list, pairing, and recovery flows; detailed conformance target TBD. |
| QR-02 | The system shall prevent access to tasks and lists outside the authenticated workspace. | Authorization and integration tests attempt cross-workspace reads and writes; no task content or existence is disclosed. |
| QR-03 | The system shall not expose credentials, pairing grants, recovery secrets, or task content in logs, URLs, analytics, or client-side persistent storage. | Inspect telemetry, logs, network URLs, and browser persistence in security testing. |
| QR-04 | The system shall preserve confirmed writes across retries and concurrent edits without silent duplication or lost updates. | Integration tests cover ambiguous responses, retry behavior, version conflicts, and atomic state changes. Exact latency/availability targets are TBD. |
| QR-05 | The system shall keep date-only due-date behavior stable across browser and workspace time zones. | Boundary tests cover date display and workspace-zone calendar behavior. Approved default: capture the browser's IANA time zone at workspace creation, show it to the user, and allow changes. |
| QR-06 | The system shall not report a task deletion complete until the primary deletion state and independent recovery evidence are durable, and shall not expose restored task data until all acknowledged deletions and access-state safeguards have been reconciled. | Deletion/recovery tests prove that every acknowledged deletion is applied before restored data is served; if the ledger is unavailable or reconciliation is incomplete, the restored service remains unavailable. Define and test the cross-store write protocol. Backup retention is limited to the repository-guided 30-day window; responsible owner to confirm operational policy. |

### Candidate pilot service targets (not approved)

These are starting recommendations for a small, non-critical pilot, not commitments or established service capabilities. Operations and security owners must validate them against hosting, capacity, threat, restore, and support plans before pilot launch.

- **Performance:** 95th-percentile response time below 500 ms for task-list reads and task create/update requests under the agreed pilot load.
- **Availability:** 99.5% monthly availability, excluding only explicitly agreed maintenance windows.
- **Recovery:** recovery point objective and recovery time objective of 24 hours each; validate through restore exercises, including deletion-ledger reapplication.
- **Rate limits:** the security owner approved workspace creation limits of 5 attempts per source IP per hour and 20 per IP per day; return retry guidance and challenge repeated abuse. Pairing, recovery, and task read/write limits remain unset until abuse-case review and load testing, and must be documented and tested before pilot.
- **Support:** staffed business-hours pilot support with an initial response by the next business day. Confirm channel, support coverage, and time zone with the operations owner.
- **Accessibility:** target WCAG 2.2 AA for the in-scope browser flows, subject to product and accessibility-owner confirmation.

The numeric targets above are proposals because no approved targets or operating context were supplied.

## 8. Constraints and Dependencies

- **Selected technology constraints:** .NET SDK 10.0.403 / ASP.NET Core 10, EF Core 10.0.15 with Npgsql provider 10.0.3, PostgreSQL 18, React 19.3.1, strict TypeScript 7.0.2, Vite 8.3.8, and Node.js 26.13.1. Tests use xUnit, `WebApplicationFactory`, PostgreSQL-backed integration checks, Vitest/React Testing Library, and Playwright.
- **Remaining technical choices:** API endpoint style, hosting provider, and deployment topology.
- **Related policy:** workspace-scoped authorization, secure device credentials, pairing/recovery safeguards, atomic version-aware updates, safe retry behavior, date-only due dates, sanitized logging, and restore-time deletion reconciliation are detailed in [ASP.NET Core instructions](.github/instructions/aspnet-core.instructions.md), [React/TypeScript instructions](.github/instructions/react-typescript.instructions.md), and [PostgreSQL instructions](.github/instructions/postgresql.instructions.md).
- **Architecture status:** [Task Manager Architecture](task-manager-architecture.md) records approval by @cjschaab as technical lead on 2026-11-13 and confirms alignment with approved PRD v0.8. It specifies one ASP.NET Core modular app serving the React client, with PostgreSQL authoritative, and keeps hosting provider-neutral.
- **Delivery dependency:** VS-01 bootstrap, credential lifecycle, and workspace-creation limits are approved; security approval of device pairing and recovery remains required before VS-03.

## 9. Assumptions, Risks, and Open Questions

### Assumptions to validate

- The initial product is a browser-based task manager used through one or more authorized devices.
- PRD v0.8 approves a personal workspace for one owner, with support for multiple workspaces per owner.
- A minimal launch should prioritize reliable capture, list organization, due dates, search, completion, and explicit deletion over advanced planning features.
- Users benefit from list-based organization; required task fields beyond title, completion state, list, and optional due date are unknown.

### Risks

- Without target-user discovery, the proposed user problem, task model, and scope may not match the product's intended audience.
- Device pairing and recovery have security and usability trade-offs that cannot be settled by this PRD alone.
- PRD v0.8 and architecture are approved by @cjschaab as product owner and technical lead; the deletion-ledger protocol, recovery details, hosting context, and later cross-functional policies still need owner decisions.
- Missing measurable service targets prevent objective performance and reliability readiness decisions.

### Selected Product Defaults and Cross-Functional Recommendations

The product defaults below are approved in PRD v0.8 by product owner @cjschaab. Recommendations owned by security, operations, analytics/privacy, accessibility, and the technical lead remain pending their owners' review.

| Question | Recommended answer | Rationale and confirmation needed |
| --- | --- | --- |
| Who is the primary user, and is a workspace personal, shared, or both? | Approved in PRD v0.8: one owner per personal workspace; an owner may have multiple workspaces; paired devices represent that owner; no cross-person sharing, roles, or team collaboration in v1. | Product approval recorded from @cjschaab on 2026-11-13. Security approval of the later pairing/recovery implementation remains separately gated. |
| What is the minimum task data model? | Approved in PRD v0.8: plain-text title of 1-200 characters after trimming whitespace; required list; incomplete by default; optional, clearable date-only due date; past due dates allowed; no notes or extra fields in v1. | Product approval recorded from @cjschaab on 2026-11-13. The 200-character limit is not a repository constraint. |
| Can users create, rename, or reorder lists? Is list deletion out of scope? | Approved in PRD v0.8: keep the default `Tasks` list permanent and non-renamable; allow creating and renaming user lists; no deletion or manual reordering; show `Tasks` first and user lists in creation order; moving tasks is explicit. | Product approval recorded from @cjschaab on 2026-11-13. List deletion is excluded by current frontend/database guidance unless product policy changes. |
| What are the pairing, recovery, revocation, and multi-user rules? | Retain same-owner paired devices and no multi-user access in v1. Draft interaction: show a single-use pairing code on an authorized device and enter it on the new device; propose a 10-minute expiry. For full device loss, establish a recovery secret at setup, rotate it on recovery, and revoke existing device credentials. | Requester selected the code-entry interaction for the draft. Security approval remains required for issuer eligibility, expiry, recovery proof/secret handling, rate limits, and revocation scope. Never place grants in URLs or logs. |
| What workspace time zone should be used? | Approved default: capture the browser's IANA time zone at workspace creation, show it to the user, and allow changes. | Approved in PRD v0.8 by product owner @cjschaab. |
| What are the activation, success, measurement, and analytics targets? | Selected for this draft: track first task within 24 hours and valid task-create success; collect pilot baselines before setting numeric targets; keep zero cross-workspace disclosures as a security gate; report completion descriptively; use aggregate counts without task content, credentials, or stable identifiers. | Product direction selected per requester instruction. Product/analytics/privacy owners must approve measurement methods, pilot duration, data retention, and event handling. |
| What service, accessibility, and support targets apply? | Keep the Section 7 performance, availability, recovery, accessibility, and support numbers provisional. Measure pilot baselines before setting numeric service targets. | Operations, security, and accessibility owners must validate feasibility, scope, and support coverage before pilot. Workspace-creation limits are approved; other endpoint limits remain gated. |
| What architecture and hosting direction should be used? | Approved direction: one modular ASP.NET Core deployment serving React assets, with PostgreSQL as authoritative; remain provider-neutral until hosting constraints are known. | Architecture approval by technical lead @cjschaab is recorded for 2026-11-13. Hosting implementation details remain TBD; later operations/security choices remain separately gated. |

### Decisions Still Requiring Confirmation

- Security owner: approve pairing issuer eligibility, grant expiry, recovery-secret issuance/rotation and proof, and pairing/recovery rate limits before VS-03. VS-01 bootstrap, credential expiry/revocation, and workspace-creation limits are approved.
- Product and analytics owners: approve candidate metric targets, measurement window, and privacy-preserving event collection.
- Operations and accessibility owners: validate hosting constraints, restore objectives and deletion-ledger protocol, pilot support coverage, and accessibility conformance scope. Keep service targets baseline-first until pilot evidence is reviewed.
- Technical lead: define the deletion-ledger consistency protocol. Architecture/PRD alignment and the initial reproducible baseline are recorded in the roadmap.

## 10. Acceptance and Approval

On 2026-11-13, @cjschaab confirmed product-owner authority and approved PRD v0.8 as-is. The technical lead confirmed architecture alignment; security separately approved the VS-01 bootstrap, credential lifecycle, and workspace-creation limits. Pairing/recovery, deletion-ledger, operations, analytics/privacy, accessibility, and pilot decisions remain gated with their accountable owners. Numeric activation and task-capture targets should be considered only after pilot baselines are reviewed.

Implementation should not begin from this document alone. After review, approved requirements should be traced into design and delivery slices with verification evidence.

## 11. Decision History

| Date | Status / decision | Rationale |
| --- | --- | --- |
| 2026-11-13 | Draft v0.1 created; no product decisions approved. | Based on the user request and available repository guidance; assumptions and unresolved decisions are called out above. |
| 2026-11-13 | Draft v0.2 adds recommendations for the former open questions; no recommendations approved. | Recommendations are grounded in repository constraints where available; unverified limits and targets are explicitly provisional. |
| 2026-11-13 | Draft v0.3 adds source-traceable business-rule and actor analysis; no policy approved. | Separates source statements from interpretations, open decisions, and documentary gaps. |
| 2026-11-13 | Draft v0.4 adds proposed dispositions for remaining open questions; no recommendations approved. | Makes product defaults reviewable while preserving owner decisions for security, operations, analytics, accessibility, and architecture. |
| 2026-11-13 | Draft v0.5 defers numeric activation and task-capture targets until pilot baselines are reviewed. | Applies the user's metric recommendation; zero cross-workspace disclosure remains a security acceptance gate. |
| 2026-11-13 | Draft v0.6 records the user's selected v1 product defaults. | Formal product approval and cross-functional owner decisions remain pending. |
| 2026-11-13 | Draft v0.7 records requester-selected timezone and pairing interaction defaults, deletion/restore guarantee, provider-neutral hosting, and baseline-first service targets. | These are draft dispositions only. Product, security, operations, accessibility, privacy, and technical approvals remain pending. |
| 2026-11-13 | Draft v0.8 records the requester's approval of the architecture specification. | Approval was recorded as stated by the requester; organizational approval role is unspecified. |
| 2026-11-13 | @cjschaab confirmed product-owner authority and approved PRD v0.8 as-is. | Recorded as the accountable product approval for G0. |

## 12. Business Rule Analysis (Draft)

This analysis is based only on the PRD and the linked repository instructions. “Repository constraint” means a rule stated by those instructions; it does not prove that the behavior is implemented. Candidate rules distinguish approved product decisions from unresolved implementation and later-gate policies.

### 12.1 Candidate Business Rules

| ID | Candidate rule | Evidence and status |
| --- | --- | --- |
| BR-01 | Workspace creation and creation of its default `Tasks` list succeed or fail together. | Repository constraint: [PostgreSQL instructions](.github/instructions/postgresql.instructions.md), Workspace Isolation and Data Integrity; FR-01. |
| BR-02 | Task and list access is scoped to the authenticated workspace. A resource identifier or client-supplied workspace ID alone does not grant access. | Repository constraint: [ASP.NET Core instructions](.github/instructions/aspnet-core.instructions.md), Application Structure and Contracts; [PostgreSQL instructions](.github/instructions/postgresql.instructions.md), Workspace Isolation and Data Integrity; FR-02. |
| BR-03 | Every task belongs to a list in the same workspace. | Repository constraint: [PostgreSQL instructions](.github/instructions/postgresql.instructions.md), Workspace Isolation and Data Integrity; FR-03 and FR-07. |
| BR-04 | Task updates and removals use version checks and commit atomically; stale changes are reported as conflicts rather than silently overwriting newer state. | Repository constraint: [ASP.NET Core instructions](.github/instructions/aspnet-core.instructions.md), Persistence and Concurrency; [PostgreSQL instructions](.github/instructions/postgresql.instructions.md), Types, Queries, and Transactions; FR-05, FR-06, FR-11. |
| BR-05 | Creates and other non-idempotent operations are safe against ambiguous responses and retries. | Repository constraint: [ASP.NET Core instructions](.github/instructions/aspnet-core.instructions.md), Persistence and Concurrency; QR-04. The retry mechanism is not specified. |
| BR-06 | Task deletion is explicit. Trash/undo, list deletion, whole-workspace deletion, and automatic inactivity cleanup are excluded unless approved by a product decision. | Repository constraint: [React/TypeScript instructions](.github/instructions/react-typescript.instructions.md), API, Refresh, and Mutation Behavior; [PostgreSQL instructions](.github/instructions/postgresql.instructions.md), Deletion, Backups, and Migrations; FR-06 and Section 5. |
| BR-07 | A task due date is date-only, distinct from a timestamp; calendar behavior uses the configured workspace time zone. | Repository constraint: [PostgreSQL instructions](.github/instructions/postgresql.instructions.md), Types, Queries, and Transactions; [React/TypeScript instructions](.github/instructions/react-typescript.instructions.md), Component and Type Rules; FR-08 and QR-05. |
| BR-08 | Task-title search is a literal, case-insensitive substring search scoped to the authorized workspace. | Repository constraint: [PostgreSQL instructions](.github/instructions/postgresql.instructions.md), Types, Queries, and Transactions; FR-09. |
| BR-09 | Refresh occurs when the app opens, when the user returns, or on explicit request. Polling, push updates, and hidden offline queues are excluded; refresh failure preserves the previous view and drafts. | Repository constraint: [React/TypeScript instructions](.github/instructions/react-typescript.instructions.md), API, Refresh, and Mutation Behavior; FR-10. |
| BR-10 | Each device uses an opaque credential with expiry and revocation checks. Pairing grants are short-lived and single-use, issuer-authorized, and consumed atomically with device issuance. | Repository constraint: [ASP.NET Core instructions](.github/instructions/aspnet-core.instructions.md), Access and Security; FR-12. Draft pairing UX is a manually entered code with a proposed 10-minute expiry; security approval of issuer and recovery details remains open. |
| BR-11 | Credentials, recovery material, pairing payloads, and task content are excluded from logs and other exposed client surfaces described in the instructions. | Repository constraint: [ASP.NET Core instructions](.github/instructions/aspnet-core.instructions.md), Access and Security; [React/TypeScript instructions](.github/instructions/react-typescript.instructions.md), Security and Accessibility; QR-03. |
| BR-12 | Restored data is not exposed until deletion-ledger reapplication and access-state reconciliation succeed. Backups are protected and expire within the stated 30-day window. | Repository constraint: [PostgreSQL instructions](.github/instructions/postgresql.instructions.md), Deletion, Backups, and Migrations; QR-06. |
| BR-13 | User-facing forms and statuses support keyboard operation, accessible names and labels, visible focus, and clear announcements for errors and save states. | Repository constraint: [React/TypeScript instructions](.github/instructions/react-typescript.instructions.md), Security and Accessibility; FR-13 and QR-01. |

### 12.2 Actors, Triggers, Outcomes, and Exceptions

| Actor | Trigger | Expected outcome | Exceptions / unresolved behavior | Evidence |
| --- | --- | --- | --- | --- |
| Workspace creator | Requests workspace creation. | Any visitor may create an isolated workspace; the committed workspace and default `Tasks` list are available together. | If either creation fails, neither is presented as a successful partial result. Approved abuse limits are 5 attempts per source IP per hour and 20 per day; they do not grant authorization. | BR-01; [PostgreSQL instructions](.github/instructions/postgresql.instructions.md), Workspace Isolation and Data Integrity; FR-01. |
| Authorized workspace user | Reads or changes a task or list. | Request is evaluated within the authenticated workspace. | Expired/revoked credential or cross-workspace request is denied without revealing resource existence. | BR-02; [ASP.NET Core instructions](.github/instructions/aspnet-core.instructions.md), Access and Security; FR-02. |
| Authorized workspace user | Creates, edits, completes, deletes, or moves a task. | Valid change is shown after server confirmation. | Validation errors preserve user input; stale versions produce a conflict and preserve the draft. | BR-03-BR-06; FR-03-FR-07, FR-11. |
| Authorized workspace user | Searches by title. | Matching tasks in the authorized workspace are returned. | Empty-query behavior, maximum query length, and result ordering are [NEEDS DECISION]. | BR-08; [PostgreSQL instructions](.github/instructions/postgresql.instructions.md), Types, Queries, and Transactions; FR-09. |
| User returning to the app | Opens, returns to, or explicitly refreshes the app. | Server-confirmed data is fetched. | On failure, retain the previous view and drafts and show stale/error status; do not imply an empty successful result. | BR-09; [React/TypeScript instructions](.github/instructions/react-typescript.instructions.md), API, Refresh, and Mutation Behavior; FR-10. |
| Authorized pairing issuer and new device | Issuer displays a one-time code and the new device submits it for redemption. | New device receives access only to the intended workspace. | Expired or reused grants fail; the proposed 10-minute expiry and issuer eligibility need security approval. | BR-10; [ASP.NET Core instructions](.github/instructions/aspnet-core.instructions.md), Access and Security; FR-12. |
| User who lost access | Starts workspace recovery. | Access is restored under an approved recovery policy. | Proof of ownership, recovery-secret lifecycle, and effect on other devices are [NEEDS DECISION]. | [ASP.NET Core instructions](.github/instructions/aspnet-core.instructions.md), Access and Security and Operations and Verification; FR-12. |
| Operations/recovery process | Restores a database backup. | Data is not served until deletion and access safeguards are reconciled. | If the ledger is unavailable or reconciliation fails, the service remains unavailable. | BR-12; [PostgreSQL instructions](.github/instructions/postgresql.instructions.md), Deletion, Backups, and Migrations; QR-06. |

### 12.3 Facts, Interpretations, and Open Questions

**Facts stated in the supplied documents**

- The approved baseline selects .NET SDK 10.0.403 / ASP.NET Core 10, EF Core 10.0.15 with Npgsql provider 10.0.3, PostgreSQL 18, React 19.3.1, strict TypeScript 7.0.2, Vite 8.3.8, and Node.js 26.13.1. This records verified build/test tooling, not deployed product behavior.
- The instructions state workspace scoping, a default `Tasks` list, date-only due dates, atomic version checks, retry safety, pairing/revocation safeguards, and restore-time deletion-ledger handling.
- PRD v0.8 is approved by product owner @cjschaab. Candidate pilot targets remain provisional; the technical lead confirmed the architecture aligns with v0.8.

**Analyst interpretations**

- Pairing multiple devices is selected in PRD v0.8 as same-owner access with a manually entered one-time code. Security approval is still needed for issuer eligibility, grant expiry, and recovery policy.
- Explicit deletion and backup retention are paired with a draft guarantee: acknowledged deletions must be durable and applied before restored data is served. The technical write/reconciliation protocol remains open.
- The individual-workspace model, task fields, due-date semantics, and list behavior are approved in PRD v0.8. Recovery details, later-slice security policies, and numeric service targets remain gated or provisional.

### Selected Product Defaults and Cross-Functional Recommendations

Product defaults below were approved in PRD v0.8 by product owner @cjschaab. Recommendations assigned to other owners remain unapproved decisions.

| Topic | Recommended v1 answer | Owner / remaining decision |
| --- | --- | --- |
| Workspace model | Make each workspace personal to one owner. Allow an owner to create more than one workspace. Paired devices represent that same owner; do not support cross-person sharing, invitations, or roles in v1. | Approved in PRD v0.8. Security approval of the later pairing/recovery implementation remains gated. |
| Task fields and validation | Use a required plain-text title of 1-200 characters after trimming whitespace, a required list, a complete/incomplete state defaulting to incomplete, and an optional date-only due date. Exclude descriptions and other fields in v1. Accept past due dates. | Approved in PRD v0.8; the 200-character limit is a product rule, not a repository constraint. |
| Due-date meaning | A task is overdue only when it is incomplete and its due date is earlier than the current calendar date in the workspace time zone. A completed task is not overdue; changing completion does not clear its due date. Do not infer a time-of-day or notification from a date-only value. Default time zone: capture the browser's IANA zone at workspace creation, show it, and allow changes. | Approved in PRD v0.8. |
| Lists | Keep the default `Tasks` list permanent and not renameable. Allow creating and renaming user lists; do not allow deletion or manual reordering in v1. Show `Tasks` first and user lists in creation order. Renaming preserves task membership; moving a task requires an explicit user action. | Approved in PRD v0.8. List deletion remains excluded by repository guidance unless product policy changes. |
| Pairing and recovery | Show a single-use pairing code on an authorized device and enter it on a new device; propose a 10-minute expiry. For full device loss, issue a high-entropy recovery secret at setup, show it once, store only a verifier, and on successful use rotate the secret and revoke existing device credentials. Do not place grants in URLs or logs. | Pairing/recovery is a later gate: security owner must approve issuer eligibility, grant expiry, recovery proof, secret handling, and revocation scope before VS-03. VS-01 credential expiry/revocation and workspace-creation limits are approved. |
| Metrics and analytics | Track first task created within 24 hours as activation and successful valid task-create requests as capture reliability. Collect baselines during the pilot; do not set numeric activation or capture targets until those baselines are reviewed. Keep zero cross-workspace disclosures as a security acceptance gate, not a product KPI; report completion rate descriptively. Use aggregate workflow counts only; do not collect task content, credentials, or stable user identifiers for analytics. | Product/analytics/privacy owners: [NEEDS DECISION] approve definitions, denominator, cohort method, pilot duration, data retention, and analytics handling. Numeric activation and capture targets require pilot evidence. |
| Service and support targets | Keep Section 7's performance, availability, recovery, accessibility, and support values provisional. Measure pilot baselines before setting numeric service targets. | Operations/security/accessibility owners: [NEEDS DECISION] validate feasibility, load assumptions, recovery tests, coverage hours/time zone, and conformance scope. VS-01 workspace-creation limits are approved; other endpoint limits remain before their applicable gates. |
| Architecture and hosting | Approved direction: one modular ASP.NET Core application serving React assets, with PostgreSQL authoritative and provider-neutral hosting. See [Task Manager Architecture](task-manager-architecture.md). | Approved by product owner and technical lead @cjschaab. Hosting implementation details remain TBD; later security/operations decisions remain gated. |

### 12.4 Contradictions and Gaps

No direct business-rule contradiction is established by the supplied context. The following tensions and gaps need reconciliation:

- PRD v0.8 establishes that workspaces belong to one owner and paired devices represent that same owner. Pairing issuer, recovery, and grant details remain open for VS-03.
- The PRD proposes task deletion while the instructions require deletion-ledger and backup handling. The draft now requires durable acknowledgement and restore reconciliation; the technical protocol and backup policy still need operations review.
- Due dates are date-only and the approved PRD selects the browser-zone default and date boundaries.
- The PRD proposes numeric pilot service targets. These are not repository constraints; only VS-01 workspace-creation thresholds are approved, and no operating evidence validates the other targets.
- The product owner approved PRD v0.8 and the technical lead confirmed architecture alignment. VS-01 bootstrap, credential lifecycle, and workspace-creation limits are approved; pairing/recovery, deletion-ledger, pilot service, and other cross-functional decisions remain gated.
