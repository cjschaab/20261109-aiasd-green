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
---

# VS-01: Create a workspace and enter it on the first authorized device

- Status: Ready for review
- Implementation gate: G0 remains open until product/security approval authority is confirmed and the technical lead selects the supported runtime and reproducible build/test/migration baseline.
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

- Verified repository state: no application or test project manifests or application source were found at specification time; `specs/` did not exist. The requester selected this repository as the application target, but no build, test, migration, or local-run command is established.
- Architecture: the approved direction is one modular ASP.NET Core application serving React assets, with PostgreSQL authoritative for application data. The architecture records requester approval, but the organizational approval role is unspecified. Endpoint style, runtime/library versions, data-access and migration tools, and deployment provider remain unselected.
- Product status: the requester stated approval of PRD v0.8 as-is on 2026-11-13. The organizational product-approval role is not recorded, so this statement does not by itself verify the roadmap's authorized-product-owner gate.
- Recorded decisions: the requester selected this repository as the application target, stated that the technical lead confirmed architecture alignment with PRD v0.8, and stated security approval for allowing any visitor to create an isolated personal workspace without an existing account or invitation. The creating browser receives the initial device credential after successful creation. The requester's organizational product/security roles are not recorded.
- Prerequisites: G0 in the roadmap. The requester has stated product and security approval, the technical lead has confirmed architecture alignment, and this repository is selected as the application target. Confirm approval authority and select supported runtime and reproducible build/test/migration tooling before implementation.
- Assumptions: the server derives workspace access from a verified device credential, not a client-supplied workspace ID. The initial credential is issued only after the workspace/default-list transaction commits and is managed by the server through its secure device-cookie mechanism.
- Open questions/blockers: Do the requester's stated product and security approvals satisfy the authorized-owner gates? What credential expiry/revocation behavior and workspace-creation rate limits apply? Which runtime versions and data-access, migration, and test tools will be used? The technical lead must resolve the implementation baseline; security must settle credential lifecycle and abuse limits before the applicable launch gate. No endpoint, status code, or validation limit is selected here.
- Environment: implementation and test environment, safe fixture setup, local database configuration, and supported command set must be established with the application repository and tooling.

## Behavior and contracts

- Inputs and outputs: any visitor may request an isolated personal workspace without an existing account or invitation. Return a confirmed workspace and its `Tasks` list only after both records commit; then issue the initial device credential to the creating browser. The request/response schema, identifiers, and route are not specified.
- Validation, authorization, and errors: derive access from the verified device credential; never treat a route, query, or request-body workspace identifier as authorization. Reject requests that fail the approved eligibility and bootstrap checks without disclosing protected workspace existence. Return explicit outcomes without exposing secrets or internal errors. Exact validation rules and transport-level error mapping remain open.
- State and integrations: persist the workspace and exactly one default `Tasks` list in one PostgreSQL transaction. Enforce their association and workspace isolation in application logic and relational constraints. A persistence failure must roll back both records and must not be reported as a successful workspace or yield a usable credential. The default list is permanent and non-renamable under PRD v0.8, whose approval was stated by the requester but whose organizational approval authority is not recorded.
- Compatibility: no existing application behavior or API contract was found to preserve. Do not infer that the repository has no external consumers; confirm the target application and any existing contract before implementation.
- Security and privacy: issue an opaque device credential using the server-managed secure device-cookie mechanism; store only a verifier server-side. Never log or expose raw credentials, bootstrap secrets, or sensitive request bodies/URLs. Do not put credentials in URLs, analytics, or JavaScript-accessible persistent storage. Credential expiry, revocation behavior, and numeric creation rate limits remain to be defined.
- Migration, observability, and rollback: add only schema needed for workspace/default-list creation and its integrity constraints, using the migration mechanism selected for the target application. Keep schema rollout and rollback compatible with deployment; an application rollback must not be assumed to reverse a database migration. Record operational outcomes without credentials, bootstrap material, or task content. Analytics and numeric service targets are not part of this slice.

## Acceptance criteria

- AC-001: Given any visitor without an existing account or invitation, when workspace creation succeeds, then the server confirms one workspace and its associated default `Tasks` list and issues the initial device credential to the creating browser.
- AC-002: Given a persistence failure while creating either required record, when the request completes, then neither a partial workspace nor a success-shaped response is exposed, and no usable credential is issued for the failed attempt.
- AC-003: Given a verified device credential for workspace A, when a request attempts to access workspace B or its default list, then the response does not disclose B's content or whether the workspace/list exists.
- AC-004: Given a successfully created workspace, when its default list is inspected, then exactly one list named `Tasks` is associated with that workspace; no user-created list or task is implicitly added by this slice.
- AC-005: Given success, validation failure, or service failure in the creation flow, when logs, URLs, analytics, and JavaScript-accessible browser storage are inspected, then no device credential, bootstrap secret, or sensitive request content is present; the initial credential is managed only through the server-managed secure device cookie.
- AC-006: Given the implemented first-device flow, when a user completes it using keyboard-only navigation, then its controls have accessible names and labels, visible focus, and distinguishable success and failure feedback that is not conveyed by color alone.

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

## Showcase and completion

1. In the approved local test environment, create a workspace using the approved first-device flow and safe test data.
2. Observe the confirmed workspace and its `Tasks` list from the authorized device; verify a different workspace credential cannot discover the workspace or list.
3. Exercise an injected persistence failure and observe a non-success outcome with no partial workspace/list or usable failed-attempt credential.
4. Repeat the flow with keyboard-only navigation and inspect logs and browser-managed storage for prohibited values.

- Completion evidence: confirmed product/security approval authority; selected runtime and reproducible build/test/migration baseline; approved bootstrap policy; migration and application/test diffs; results mapped to AC-001 through AC-006; and no unresolved G0 blocker.
- Execution evidence: Not run; specification only.
- Risks: unrestricted workspace creation may be abused; security approval is stated by the requester but organizational authority, numeric rate limits, and credential lifecycle are not documented. The absence of an application/test baseline prevents repository-supported commands and test paths from being named yet.
- Next dependency/handoff: confirm approval authority and establish the runtime/tooling baseline, then approve this specification before implementation. After VS-01 is implemented and verified, prepare the dependent [VS-02 capture-and-view-tasks slice](../../task-manager-implementation-roadmap.md#4-dependency-driven-vertical-slices).
