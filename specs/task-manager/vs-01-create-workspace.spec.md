---
ai_generated: true
model: "unknown/unknown@unknown"
operator: "@cjschaab"
chat_id: "40889748-90ba-4e66-aa9a-b8c8df7800b0"
prompt: |
  create implementation spec for slice 1
started: "2026-11-13T14:07:00.423-05:00"
ended: "2026-11-13T14:44:37.967-05:00"
task_durations:
  - task: "Drafting and validating the initial VS-01 specification"
    duration: "00:10:22"
  - task: "Recording unblock decisions and updating related documents"
    duration: "00:13:40"
total_duration: "00:24:02"
ai_log: "ai-logs/2026/11/13/40889748-90ba-4e66-aa9a-b8c8df7800b0/conversation.md"
source: "user request; task-manager-implementation-roadmap.md, task-manager-requirements.md, task-manager-architecture.md"
revisions:
  - chat_id: "40889748-90ba-4e66-aa9a-b8c8df7800b0"
    model: "unknown/unknown@unknown"
    date: "2026-11-13"
    change: "Recorded requester approval statements, the any-visitor bootstrap policy, selected target repository, and remaining authority, tooling, and credential-lifecycle decisions."
    ai_log: "ai-logs/2026/11/13/40889748-90ba-4e66-aa9a-b8c8df7800b0/conversation.md"
  - chat_id: "e2a33dc9-d9fb-45d7-8e09-bb2d21c63c00"
    model: "unknown/unknown@unknown"
    date: "2026-11-13"
    change: "Recorded the accountable owner's approval of the product/security decisions, credential lifecycle, creation limits, and recommended runtime and test tooling."
    ai_log: "ai-logs/2026/11/13/e2a33dc9-d9fb-45d7-8e09-bb2d21c63c00/conversation.md"
---

# VS-01: Create a workspace and enter it on the first authorized device

- Status: Ready for review
- Implementation gate: G0 remains open until the selected runtime/tooling has a reproducible repository build/test baseline and this specification is approved for implementation.
- Owner/reviewer: Product owner (scope), security owner (initial-device authorization), and technical lead (architecture and tooling); named reviewers are TBD.
- Sources: [Implementation roadmap](../../task-manager-implementation-roadmap.md), [Product requirements](../../task-manager-requirements.md), [Architecture](../../task-manager-architecture.md), [specification-authoring instructions](../../.github/instructions/implementation-specifications.instructions.md), [AI output instructions](../../.github/instructions/ai-assisted-output.instructions.md), [business-rule guidance](../../.github/instructions/business-rules-to-vertical-slices.instructions.md), [ASP.NET Core instructions](../../.github/instructions/aspnet-core.instructions.md), [PostgreSQL instructions](../../.github/instructions/postgresql.instructions.md), and [React/TypeScript instructions](../../.github/instructions/react-typescript.instructions.md).
- Related use cases: None found in the repository; this slice traces to FR-01 and FR-02 and candidate rules BR-01 and BR-02.

## Goal

A person can use the selected first-device flow to create a personal workspace, reach it from that authorized device, and find its default `Tasks` list. Workspace creation and default-list creation succeed or fail together.

## Scope and exclusions

- In scope: the approved first-device workspace creation workflow; server-side authorization context for that workspace; creation of the workspace and its permanent default `Tasks` list; explicit success and failure outcomes; required persistence migration; and focused client, API, persistence, security, and accessibility verification.
- Out of scope: task capture or task CRUD, user-created lists, account creation, pairing additional devices, recovery flows, workspace deletion, workspace sharing, roles, and provider-specific deployment work.
- Allow any visitor to create an isolated personal workspace without an existing account or invitation, as selected by the requester. Do not allow that visitor to access any other workspace; the server must derive scope from the verified initial device credential.

## Context and dependencies

- Verified repository state: no application or test project manifests or application source are present; no build, test, migration, or local-run command is established. The requester selected this repository as the application target.
- Architecture: the approved direction is one modular ASP.NET Core application serving React assets, with PostgreSQL authoritative for application data. On 2026-11-13, @cjschaab confirmed they are the product owner, security owner, and technical lead and approved the recorded PRD and bootstrap policy. The technical lead also confirmed architecture alignment with PRD v0.8.
- Product and security approvals: @cjschaab, identifying as the accountable product and security owner, confirmed PRD v0.8 approval and approved account-free creation of an isolated personal workspace, with the initial device credential issued to the creating browser only after successful workspace/default-list commit.
- Selected implementation tooling: .NET 10 LTS / ASP.NET Core 10; PostgreSQL 18; EF Core 10 with Npgsql for data access and migrations; React 19 with strict TypeScript and Vite, using Node.js 26 LTS; xUnit and `WebApplicationFactory` for backend tests, PostgreSQL-backed integration tests using a disposable database/test container, Vitest with React Testing Library for frontend tests, and Playwright for browser tests. Pin exact SDK, runtime patch, package, and tool versions in the repository baseline.
- Prerequisites: G0 in the roadmap. Product/security approval authority, credential lifecycle and per-IP creation limits, and primary runtime/tool selections are recorded. G0 remains open until a reproducible build/test baseline is established in the repository and this specification is approved for implementation.
- Assumptions: the server derives workspace access from a verified device credential, not a client-supplied workspace ID. The initial credential is issued only after the workspace/default-list transaction commits and is managed by the server through its secure device-cookie mechanism.
- Open questions/blockers: Establish a reproducible baseline and its actual commands, working directories, configuration, and safe PostgreSQL test setup; pin exact supported patch/package versions. Obtain implementation review and approval of this specification. Before pilot, set a numeric service-wide capacity limit from measured capacity. No endpoint or request/response schema is selected here.
- Environment: .NET 10, Node.js 26 LTS, PostgreSQL 18, and the data-access, migration, and test tools listed above are selected. Exact versions, manifests, build/test commands, safe fixture setup, and local database configuration remain to be established as the repository baseline.

## Behavior and contracts

- Inputs and outputs: any visitor may request an isolated personal workspace without an existing account or invitation. Return a confirmed workspace and its `Tasks` list only after both records commit; then issue the initial device credential to the creating browser. The request/response schema, identifiers, and route are not specified.
- Validation, authorization, and errors: derive access from the verified device credential; never treat a route, query, or request-body workspace identifier as authorization. Reject requests that fail the approved eligibility and bootstrap checks without disclosing protected workspace existence. Return explicit outcomes without exposing secrets or internal errors. Exact validation rules and transport-level error mapping remain open.
- State and integrations: persist the workspace and exactly one default `Tasks` list in one PostgreSQL transaction. Enforce their association and workspace isolation in application logic and relational constraints. A persistence failure must roll back both records and must not be reported as a successful workspace or yield a usable credential. The default list is permanent and non-renamable under approved PRD v0.8.
- Compatibility: no existing application behavior or API contract was found to preserve. Do not infer that the repository has no external consumers; confirm the target application and any existing contract before implementation.
- Security and privacy: issue an opaque device credential using the server-managed secure device-cookie mechanism; store only a verifier server-side. Expire it after 30 days of inactivity or 180 days after issuance, whichever comes first; successful authenticated activity extends the inactivity period, not the absolute lifetime. Revoke it immediately on logout or reported compromise, independently per device. Require the approved recovery flow before enforcing expiry in a way that could permanently strand a workspace. Limit creation to 5 attempts per source IP per hour and 20 per source IP per day; return a rate-limit response with retry guidance and use a challenge for repeated abuse. Treat IP limits as abuse controls, not authorization, and derive client IPs only through trusted proxy configuration. Never log or expose raw credentials, bootstrap secrets, or sensitive request bodies/URLs. Do not put credentials in URLs, analytics, or JavaScript-accessible persistent storage.
- Migration, observability, and rollback: add only schema needed for workspace/default-list creation and its integrity constraints, using the migration mechanism selected for the target application. Keep schema rollout and rollback compatible with deployment; an application rollback must not be assumed to reverse a database migration. Record operational outcomes without credentials, bootstrap material, or task content. Analytics and numeric service targets are not part of this slice.

## Acceptance criteria

- AC-001: Given any visitor without an existing account or invitation, when workspace creation succeeds, then the server confirms one workspace and its associated default `Tasks` list and issues the initial device credential to the creating browser.
- AC-002: Given a persistence failure while creating either required record, when the request completes, then neither a partial workspace nor a success-shaped response is exposed, and no usable credential is issued for the failed attempt.
- AC-003: Given a verified device credential for workspace A, when a request attempts to access workspace B or its default list, then the response does not disclose B's content or whether the workspace/list exists.
- AC-004: Given a successfully created workspace, when its default list is inspected, then exactly one list named `Tasks` is associated with that workspace; no user-created list or task is implicitly added by this slice.
- AC-005: Given success, validation failure, or service failure in the creation flow, when logs, URLs, analytics, and JavaScript-accessible browser storage are inspected, then no device credential, bootstrap secret, or sensitive request content is present; the initial credential is managed only through the server-managed secure device cookie.
- AC-006: Given the implemented first-device flow, when a user completes it using keyboard-only navigation, then its controls have accessible names and labels, visible focus, and distinguishable success and failure feedback that is not conveyed by color alone.
- AC-007: Given an issued device credential, when 30 days pass without authenticated activity or 180 days pass after issuance, then the credential expires, whichever limit is reached first; logout or reported compromise revokes only that device immediately. Expiry enforcement must not strand a workspace before an approved recovery flow is available.
- AC-008: Given workspace-creation attempts from one source IP, when the fifth attempt in an hour or twentieth attempt in a day has been reached, then further attempts are rate-limited with retry guidance; repeated abuse may trigger a challenge.

## Verification

The repository has no verified test project or runnable application at specification time. The checks below are proposed; the technical lead must identify actual test paths, commands, working directories, and prerequisites after the target repository and tooling are established. Do not treat this table as execution evidence.

| Criterion | Planned test/check | Command and working directory | Expected result |
|-----------|--------------------|-------------------------------|-----------------|
| AC-001 | Proposed API/browser integration test for account-free workspace creation, committed workspace/default-list state, and initial cookie credential. | Not established; select after G0 and repository/tooling confirmation. | One workspace and its default list are committed; the creating browser can access only that workspace using its issued credential. |
| AC-002 | Proposed PostgreSQL integration test injects failure at each write/commit boundary and inspects persisted state and credential issuance. | Not established; requires the selected test framework and disposable PostgreSQL fixture. | Transaction leaves no partial workspace/list; response is not successful and no usable credential is issued. |
| AC-003 | Proposed authorization integration test uses separate workspace fixtures and compares outcomes for existing and absent foreign resources. | Not established; requires API test host and isolated fixtures. | No cross-workspace content or existence disclosure; no foreign state is changed. |
| AC-004 | Proposed persistence integration test verifies list count, name, and workspace association after creation. | Not established; requires the selected PostgreSQL migration/test setup. | Exactly one `Tasks` list exists for the created workspace; no task or extra list is created. |
| AC-005 | Proposed security check inspects server logs, URLs, analytics payloads, and JavaScript-accessible browser storage across success and failure paths. | Manual/security test; tools and environment are not selected. | No credential, bootstrap secret, or sensitive request content is exposed outside the server-managed secure device cookie. |
| AC-006 | Proposed keyboard-only walkthrough and automated accessibility check of the approved creation flow. | Manual plus a repository-selected accessibility test; no runner is established. | All flow controls and outcome states meet the stated criterion. |
| AC-007 | Proposed credential lifecycle integration tests cover inactivity expiry, absolute expiry, activity extension, logout, compromise revocation, per-device scope, and recovery availability. | Not established; requires the selected API test host, persistence fixture, and recovery-flow dependency. | Expiry and revocation follow the approved policy and do not strand a workspace. |
| AC-008 | Proposed rate-limit integration tests exercise hourly and daily per-source-IP thresholds, trusted-proxy IP derivation, retry guidance, and repeated-abuse challenge behavior. | Not established; requires the selected API test host and controlled clock/client-IP fixtures. | The stated thresholds are enforced without treating source IP as authorization. |

## Showcase and completion

1. In the approved local test environment, create a workspace using the approved first-device flow and safe test data.
2. Observe the confirmed workspace and its `Tasks` list from the authorized device; verify a different workspace credential cannot discover the workspace or list.
3. Exercise an injected persistence failure and observe a non-success outcome with no partial workspace/list or usable failed-attempt credential.
4. Repeat the flow with keyboard-only navigation and inspect logs and browser-managed storage for prohibited values.

- Completion evidence: confirmed product/security approval authority; selected runtime and reproducible build/test/migration baseline; approved bootstrap, credential-lifecycle, and rate-limit policies; migration and application/test diffs; results mapped to AC-001 through AC-008; and no unresolved G0 blocker.
- Execution evidence: Not run; specification only.
- Risks: per-IP rate limits can affect users behind shared networks and do not replace service-wide capacity controls; a numeric service-wide capacity limit remains a pilot-readiness decision. Recovery must be available before expiry is enforced in a way that could strand a workspace. The absence of an application/test baseline prevents repository-supported commands and test paths from being named yet.
- Next dependency/handoff: establish the selected runtime/tooling baseline and its reproducible commands, then approve this specification before implementation. After VS-01 is implemented and verified, prepare the dependent [VS-02 capture-and-view-tasks slice](../../task-manager-implementation-roadmap.md#4-dependency-driven-vertical-slices).
