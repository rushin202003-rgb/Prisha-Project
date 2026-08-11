# Bloom — Security, Privacy, Compliance & Production Hardening Master Specification

**Document ID:** BLOOM-SEC-MASTER-001  
**Version:** 1.0  
**Status:** Engineering Master Specification  
**Purpose:** Authoritative implementation and audit specification for Bloom's security, privacy, compliance, DevSecOps, AI safety, child/student safety, reliability, and production-release hardening.

---

## 0. IMPORTANT INSTRUCTION TO ANTIGRAVITY

This document is an **authoritative engineering specification** for hardening Bloom before real-user TestFlight, App Store, and Google Play release.

## FIRST ACTION — AUDIT ONLY; DO NOT MODIFY CODE

**Before implementing any security control, Antigravity MUST perform a read-only gap assessment of the existing Bloom repository against this entire specification.**

The first task is NOT to fix the issues.

The first task is to:

1. Read this entire document.
2. Inspect the complete repository and relevant project configuration.
3. Inspect the existing `docs/` and `HANDOVER.md`.
4. Inspect Flutter code, native iOS/Android configuration, Supabase configuration/migrations/RLS, AI integration, Isar models, offline sync, CI/CD, dependencies, and release configuration.
5. Compare the actual implementation against every applicable control in this document.
6. Produce a **BLOOM SECURITY GAP ASSESSMENT** before changing production code.
7. Identify dependencies between controls and propose an implementation order.
8. Identify files that are expected to change.
9. Identify database migrations, Supabase Edge Functions, configuration changes, tests, and documentation changes required.
10. Identify any ambiguity or architectural conflict that requires human approval.
11. Explicitly identify any security assumption that could not be verified from the repository.
12. Do not claim a control is PASS merely because code appears to support it; identify the evidence required to prove it.
13. Do not make destructive, broad, or speculative changes during this audit phase.

### Required first deliverable

Create or report a gap assessment with at least:

```text
CONTROL ID
CURRENT STATUS
CURRENT IMPLEMENTATION
GAP / FINDING
SEVERITY
DEPENDENCIES
FILES LIKELY TO CHANGE
DATABASE / INFRASTRUCTURE CHANGES
TESTS REQUIRED
EVIDENCE REQUIRED
RECOMMENDED IMPLEMENTATION PHASE
BLOCKERS / QUESTIONS
```

Use these statuses:

- PASS
- PARTIAL
- FAIL
- NOT STARTED
- NOT APPLICABLE
- UNVERIFIED

### Required audit summary

At the end of the read-only audit, provide:

1. Executive summary
2. Critical blockers
3. High-risk findings
4. Medium/Low findings
5. Proposed implementation phases
6. Dependency order
7. Expected files to change
8. Expected database migrations
9. Expected Edge Functions
10. Expected CI/CD changes
11. Required security tests
12. Required external penetration testing
13. Open questions requiring owner approval

**STOP after producing the gap assessment. Do not implement the remediation until the owner explicitly approves the proposed implementation plan.**

### Mandatory operating rules after approval

1. **Read this entire document before changing code.**
2. Treat this document as a **control specification and release gate**, not as a suggestion list.
3. Do not make broad architectural changes merely because they appear convenient.
4. Preserve Bloom's existing clean architecture and service/repository abstractions wherever practical.
5. Implement controls in the phases specified below.
6. For every control, produce evidence of implementation and testing.
7. A control is **PASS only when it is actually demonstrated**, not merely coded.
8. Never mark a control PASS based on visual inspection alone when a security test is required.
9. Never weaken a security control to make a test pass.
10. If an implementation requirement conflicts with existing Bloom documentation or code, stop and document the conflict before making a destructive change.
11. Do not expose, print, commit, or embed production secrets.
12. Do not use real children's personal data for initial security testing.
13. Do not perform destructive production operations during testing.
14. Do not introduce a new third-party SDK or service without documenting its purpose, data access, permissions, security implications, license, and privacy implications.
15. Prefer the smallest secure architectural change that satisfies the requirement.
16. Every security-relevant change must be reflected in the appropriate documentation.
17. Keep this document updated with status, evidence, decisions, and exceptions.

---

# 1. BLOOM CURRENT ARCHITECTURE

Bloom is a Flutter mobile-first application targeting students/parents across:

- iPhone
- iPad
- Android phones
- Android tablets

Web/desktop are not currently planned for release.

Backend:

- Supabase
- PostgreSQL
- Supabase Auth (planned; not yet live)
- Supabase Edge Functions (to be introduced for AI/backend security)

Local database:

- Isar
- Offline-first architecture
- Offline mutation queue

AI:

- Gemini
- Current implementation calls Gemini directly from Flutter
- This architecture MUST be replaced before real-user distribution
- Gemini credentials MUST NOT be embedded in the mobile client

Authentication:

- Current implementation is MockAuthService
- Live Supabase Auth is not yet connected

Cloud authorization:

- Current Supabase tables have NO RLS policies
- This is a critical blocker

Current sensitive/personal data includes:

- Student name
- Email
- Grade
- Tasks
- Goals
- Journal entries
- Mood entries
- Parent profile/settings
- AI-generated educational content
- Hobby/life-dashboard information

No current product requirement for:

- Location
- Voice
- Photos
- Uploaded files
- Behavioural tracking

Bloom is a mixed-age product and may be used by:

- Children under 13
- Teens 13–17
- Adults 18+

Therefore the architecture must support child-safe and privacy-by-design controls.

---

# 2. SECURITY PRINCIPLE

## The client is never trusted.

Assume an attacker can:

- reverse engineer the APK/IPA
- inspect application strings
- manipulate local Isar data
- modify network requests
- replay requests
- manipulate offline mutations
- extract client-side configuration
- attach debugging tools
- operate a compromised/rooted/jailbroken device

Bloom must remain secure even when the client is compromised.

Security must therefore be enforced primarily at:

- authentication
- backend authorization
- database RLS
- server-side validation
- server-side secrets
- rate limiting
- data minimization
- monitoring

Do NOT rely on Flutter UI logic as a security boundary.

---

# 3. AUTHORITATIVE STANDARDS BASELINE

Bloom security and compliance work should be mapped to:

## Mobile security

- OWASP MASVS
- OWASP MASTG

Use current versions.

Coverage includes:

- secure storage
- cryptography
- authentication/authorization
- network security
- platform interaction
- secure coding
- resilience
- privacy

## Backend/API

- OWASP ASVS
- OWASP API Security Top 10

## Governance

- NIST Cybersecurity Framework 2.0

Use the functions:

- Govern
- Identify
- Protect
- Detect
- Respond
- Recover

## Accessibility

- WCAG 2.2 AA

## Software supply chain

- OWASP SCVS concepts
- dependency vulnerability scanning
- SBOM

## Privacy/compliance

For India:

- Digital Personal Data Protection Act, 2023
- Digital Personal Data Protection Rules, 2025

For international launch where applicable, assess:

- GDPR/UK GDPR
- COPPA
- FERPA where institutional/education-record circumstances apply
- applicable children's privacy laws

## Platform requirements

- Apple App Review Guidelines
- Apple App Privacy requirements
- Google Play Developer Policies
- Google Play Families requirements
- Google Play Data Safety requirements

These standards are the baseline. They are not a claim that Bloom is formally certified.

---

# 4. RELEASE GATES

Bloom must have four release gates.

## Gate A — Security Architecture

Must PASS before real-user TestFlight.

## Gate B — Security Verification

Must PASS before public store submission.

## Gate C — Controlled Real-User Beta

Only after Gates A and B are substantially complete.

## Gate D — Public Release

No unresolved Critical or High security findings unless formally risk-accepted by the appropriate owner.

---

# 5. SEVERITY MODEL

## Critical

Examples:

- authentication bypass
- cross-user data access
- RLS bypass
- exposed production secrets
- Gemini production key embedded in client
- privilege escalation
- unauthorized journal/mood access
- production database exposure
- child-data compliance blocker

**Release:** NO-GO.

## High

Examples:

- significant authorization weakness
- insecure sensitive local storage
- exploitable API weakness
- missing deletion control
- serious AI safety vulnerability
- critical dependency vulnerability

**Release:** normally NO-GO until fixed and retested.

## Medium

Meaningful security weakness with limited exploitability or impact.

Track and remediate according to SLA.

## Low

Hardening or low-impact issue.

Track and fix where practical.

---

# 6. CONTROL STATUS

Every control must use one of:

- NOT STARTED
- IN PROGRESS
- PASS
- FAIL
- PARTIAL
- NOT APPLICABLE
- RISK ACCEPTED

Never use PASS without evidence.

For every FAIL/PARTIAL/RISK ACCEPTED item record:

- finding
- severity
- impact
- owner
- remediation
- due date
- retest status
- evidence

---

# 7. REQUIRED DOCUMENTATION STRUCTURE

Create the following folder:

```text
docs/security/
```

Create/update:

```text
SECURITY_MASTER.md
SEC-001_Threat_Model.md
SEC-002_Data_Classification.md
SEC-003_Data_Flow.md
SEC-004_Authorization_Matrix.md
SEC-005_RLS_Specification.md
SEC-006_Authentication_Specification.md
SEC-007_AI_Security_Specification.md
SEC-008_AI_Safety_Specification.md
SEC-009_Offline_Sync_Security.md
SEC-010_Local_Storage_Security.md
SEC-011_Secrets_Management.md
SEC-012_Dependency_Security.md
SEC-013_Logging_and_Monitoring.md
SEC-014_Incident_Response.md
SEC-015_Backup_and_Disaster_Recovery.md
SEC-016_Privacy_Requirements.md
SEC-017_Child_Safety_and_Parental_Consent.md
SEC-018_Third_Party_SDK_Inventory.md
SEC-019_Permission_Matrix.md
SEC-020_Penetration_Test_Plan.md
SEC-021_Release_Security_Gate.md
SEC-022_Vulnerability_Register.md
SEC-023_SBOM.md
SEC-024_AI_Model_and_Vendor_Register.md
SEC-025_Data_Retention_and_Deletion.md
SEC-026_Change_and_Exception_Register.md
```

Also update:

```text
HANDOVER.md
```

with material security decisions and implementation status.

Update relevant existing documents:

```text
ENG-002_Backend_Architecture.md
ENG-003_Authentication_Specification.md
ENG-004_Offline_Sync_Architecture.md
ENG-005_DevOps_and_Observability.md
UX-004_Accessibility_Spec.md
```

Do not create duplicate contradictory specifications.

If an existing document has a conflicting requirement, document the conflict and update the canonical document deliberately.

---

# 8. CANONICAL SECURITY RECORD

`docs/security/SECURITY_MASTER.md` is the canonical security continuity document.

Whenever a material security development occurs, update it with:

- date
- control ID
- decision
- implementation status
- test performed
- result
- evidence
- unresolved risk
- next action

This is required for future handover.

---

# 9. PHASE 1 — AUTHENTICATION

## SEC-AUTH-001 — Replace Mock Authentication

Current:

```text
MockAuthService
userId = "1"
```

Required:

- Supabase Auth
- real user identity
- real session
- real logout
- session refresh
- password reset/recovery
- account deletion

Mock authentication may remain for development tests but MUST NOT be active in production.

### PASS criteria

- production build cannot use MockAuthService
- authenticated user receives real Supabase identity
- signed-out user cannot access protected screens/data
- tests cover sign-in/sign-out/session expiry

---

## SEC-AUTH-002 — Authentication Methods

Implement only the methods actually required.

Potential methods:

- email/password
- Sign in with Apple
- Sign in with Google

Do not leave fake OAuth buttons connected to fake flows in production.

### PASS

Each enabled method has a real provider flow and tested failure handling.

---

## SEC-AUTH-003 — Session Security

Verify:

- token lifecycle
- refresh
- expiry
- logout
- revoked sessions
- password change behavior
- account deletion behavior
- concurrent sessions

Never log tokens.

---

## SEC-AUTH-004 — Authentication Enumeration

Test whether an attacker can determine whether an email/account exists through:

- login
- password reset
- registration
- OAuth errors

Use safe, non-enumerating responses where appropriate.

---

# 10. PHASE 2 — AUTHORIZATION AND RLS

## SEC-RLS-001 — Enable RLS

Enable RLS on every Supabase table exposed to client access.

Minimum current cloud tables:

- tasks
- goals
- journal_entries
- parent_profiles
- student_profiles after creation
- parent_student_relationships after creation

Also audit any additional tables/functions/storage created later.

---

## SEC-RLS-002 — Student Ownership

A student may access only records they are authorized to access.

Test:

- Student A → own data = PASS
- Student A → Student B data = DENY

---

## SEC-RLS-003 — Student Write Authorization

Test:

- own insert
- own update
- own delete
- other student's insert/update/delete = DENY

---

## SEC-RLS-004 — Parent Authorization

A parent may access only an explicitly authorized child.

Parent A must not access Child B.

Authorization must be based on a trusted parent/student relationship, not client-supplied fields.

---

## SEC-RLS-005 — Parent Relationship Revocation

If the parent-child relationship is revoked:

- previously available data becomes inaccessible
- queued operations are rejected
- cached access is handled safely

---

## SEC-RLS-006 — Journal Visibility

Journal access must require:

- authenticated parent
- verified relationship
- applicable parent visibility setting
- RLS authorization

Never rely solely on Flutter logic.

---

## SEC-RLS-007 — Mood Visibility

Apply equivalent controls to mood information.

---

## SEC-RLS-008 — No Client-Supplied Authorization

Never trust:

```text
student_id
role
parent_id
can_view_journal
```

from the client as the authorization source.

The server/database must establish authorization.

---

## SEC-RLS-009 — Service Role Isolation

Supabase service-role/secret keys must never be included in:

- Flutter
- `.env` bundled into Flutter
- APK
- IPA
- public repository
- logs

Service-role access belongs only in trusted server-side environments.

---

# 11. PHASE 3 — DATA MODEL

## SEC-DATA-001 — Student Profile

Create a cloud `student_profiles` table anchored to authenticated identity.

Recommended conceptual relationship:

```text
auth.users.id
      ↓
student_profiles.id/user_id
      ↓
tasks.student_id
goals.student_id
journal_entries.student_id
mood_entries.student_id
```

Use foreign keys and appropriate indexes.

---

## SEC-DATA-002 — Parent-Student Relationship

Create a formal relationship table.

Conceptual structure:

```text
parent_student_relationships

id
parent_user_id
student_user_id
relationship_type
status
verified_at
created_at
updated_at
```

Do not treat email matching as sufficient authorization.

---

## SEC-DATA-003 — Parent Preferences

Consider separating preferences from identity:

```text
parent_preferences

parent_user_id
notify_on_task_completion
notify_on_mood_drop
can_view_journal
```

Final schema may differ if existing architecture provides equivalent protection.

---

# 12. PHASE 4 — DATA CLASSIFICATION

Classify Bloom data.

## Tier 1 — Low sensitivity

- static curriculum metadata
- generic worksheets
- generic quizzes

## Tier 2 — Personal

- display name
- email
- grade
- profile information
- tasks
- goals
- hobbies

## Tier 3 — Sensitive/Potentially Highly Sensitive

- journal content
- mood entries
- free-form AI interactions that may contain personal information
- any future mental-health/safety information

For each field document:

- purpose
- collection
- storage location
- recipients
- retention
- deletion
- encryption
- access roles

---

# 13. PHASE 5 — PRIVACY BY DESIGN

## SEC-PRIV-001 — Data Minimization

Do not collect data merely because it may be useful later.

Current non-required data should remain absent:

- location
- voice
- photos
- contacts
- school identity
- behavioral tracking

unless separately approved.

---

## SEC-PRIV-002 — AI Data Minimization

Send Gemini only the minimum information required for the task.

Do not send:

- email
- parent information
- authentication tokens
- unrelated journal entries
- unrelated mood history
- internal secrets
- unnecessary internal identifiers

---

## SEC-PRIV-003 — Journal Privacy

Journal content must:

- never appear in normal logs
- not be included in analytics
- not be sent to AI unless explicitly necessary and authorized by product design
- be protected by RLS
- have documented retention/deletion behavior

---

## SEC-PRIV-004 — Mood Privacy

Same principle as journal.

---

## SEC-PRIV-005 — Privacy Policy

Do not finalize privacy policy until:

1. data inventory is complete
2. SDK inventory is complete
3. AI data flow is complete
4. retention/deletion rules are complete

---

# 14. PHASE 6 — CHILD SAFETY AND PARENTAL CONSENT

Bloom is a mixed-age application.

Treat child safety as a first-class architectural concern.

## SEC-CHILD-001 — Age/Eligibility Architecture

Implement an intentional age/eligibility flow.

Do not silently assume all users are adults.

Exact legal thresholds and consent requirements must be validated for each launch jurisdiction.

---

## SEC-CHILD-002 — Parental Consent

Where required, support appropriate verifiable parental consent.

Document:

- who consents
- what they consent to
- timestamp
- consent version
- withdrawal
- revocation
- evidence

Do not implement parental consent as a cosmetic checkbox.

---

## SEC-CHILD-003 — Parent-Child Relationship

A child account must be associated with an authorized parent/guardian only through a secure relationship model.

---

## SEC-CHILD-004 — Child Data Deletion

Parent/guardian and user deletion flows must follow applicable legal/product requirements.

---

## SEC-CHILD-005 — No Behavioral Advertising/Tracking by Default

Do not introduce advertising or behavioral tracking without a separate legal/privacy review.

---

# 15. PHASE 7 — AI SECURITY

## SEC-AI-001 — Remove Client Gemini Secret

The Gemini API key MUST NOT be bundled into Flutter.

Remove:

```text
GEMINI_API_KEY
```

from client production assets.

Rotate any key previously used client-side.

---

## SEC-AI-002 — Server-Side Gemini Gateway

Implement:

```text
Flutter
  ↓
Authenticated Supabase Edge Function
  ↓
Gemini
```

The Edge Function stores the Gemini secret in server-side secret storage.

---

## SEC-AI-003 — Authenticated AI Requests

AI endpoints require an authenticated Bloom session unless a documented public operation is intentionally designed.

---

## SEC-AI-004 — AI Authorization

AI must never decide whether a user is authorized to access another user's data.

Authorization occurs before AI context is constructed.

---

## SEC-AI-005 — AI Input Validation

Validate:

- authentication
- user ownership
- prompt length
- request schema
- topic/operation
- rate limits
- quotas

---

## SEC-AI-006 — AI Output Validation

Pipeline:

```text
Gemini
 ↓
schema validation
 ↓
business-rule validation
 ↓
content/safety validation
 ↓
length limits
 ↓
sanitization
 ↓
UI
```

Structured JSON is not itself a security guarantee.

---

## SEC-AI-007 — Prompt Injection Tests

Test prompts attempting to:

- reveal system instructions
- reveal secrets
- reveal another user's data
- bypass restrictions
- alter protected records
- impersonate administrators
- manipulate Bloom's internal rules

---

## SEC-AI-008 — AI Cost Controls

Implement appropriate:

- per-user rate limits
- request limits
- prompt-size limits
- output-size limits
- daily/monthly quotas
- provider billing alerts
- abnormal usage monitoring

---

## SEC-AI-009 — AI Model Register

Maintain:

```text
model name
provider
version
release status
deprecation date
purpose
data sent
retention behavior
security review
replacement plan
```

Do not depend on deprecated models without an explicit exception.

---

# 16. PHASE 8 — AI COMPANION SAFETY

`CompanionConfig` is a high-risk product surface because Bloom serves children.

Create an explicit AI Safety Specification covering:

- age-appropriate behavior
- no sexual content
- no grooming-like behavior
- no emotional dependency
- no manipulation
- no secrecy from trusted adults
- no encouragement to isolate from family/friends
- no unsafe medical/mental-health claims
- self-harm/suicidal-content handling
- bullying
- abuse
- dangerous activities
- illegal activities
- crisis escalation policy

The AI must never say or imply:

- "I'm the only one who understands you."
- "Don't tell your parents."
- "Keep this secret from adults."

---

# 17. PHASE 9 — MOOD SAFETY

`notifyOnMoodDrop` requires a documented risk assessment.

Define:

- what "mood drop" means
- how it is calculated
- false positives
- false negatives
- user transparency
- parent notification wording
- child privacy
- escalation behavior
- whether the feature is enabled for all age groups

Bloom must not imply medical diagnosis unless the product is separately designed, validated, and regulated for that purpose.

---

# 18. PHASE 10 — OFFLINE SECURITY

The offline-first architecture is a major security surface.

## SEC-OFFLINE-001 — Isar Data Classification

Audit every local collection.

## SEC-OFFLINE-002 — Sensitive Local Data

Determine appropriate encryption-at-rest requirements for:

- journal
- mood
- student profile
- parent data
- tasks
- goals

Use platform-secure key storage where encryption is required.

## SEC-OFFLINE-003 — Logout

Define exactly what local data remains after logout.

## SEC-OFFLINE-004 — Account Deletion

Delete appropriate local data after account deletion.

## SEC-OFFLINE-005 — Shared Device

Test:

```text
Parent A logs out
Student/Parent B logs in
```

No prior user's protected data may appear.

---

# 19. PHASE 11 — SyncMutation SECURITY

`SyncMutation` is a critical attack surface.

Every queued mutation must be:

- authenticated
- authorized
- schema validated
- ownership checked
- idempotency/replay protected where appropriate
- size limited
- rejected if stale authorization no longer applies

Test:

```text
OFFLINE-001 replay
OFFLINE-002 tampering
OFFLINE-003 cross-user mutation
OFFLINE-004 duplicate mutation
OFFLINE-005 out-of-order mutation
OFFLINE-006 deleted-account mutation
OFFLINE-007 revoked-parent mutation
OFFLINE-008 malformed payload
OFFLINE-009 oversized payload
OFFLINE-010 unauthorized operation
```

---

# 20. PHASE 12 — ACCOUNT DELETION

Account deletion must cover the entire Bloom data lifecycle.

Conceptual sequence:

```text
Delete Account
 ↓
Invalidate session
 ↓
Cloud account/data deletion
 ↓
Local Isar deletion
 ↓
SyncMutation deletion
 ↓
Scheduled notification cancellation
 ↓
Caches cleared
 ↓
Temporary AI state cleared
 ↓
Return to signed-out state
```

Test deletion and subsequent login/re-registration behavior.

---

# 21. PHASE 13 — SECRETS MANAGEMENT

## SEC-SECRET-001

No production secrets in:

- Dart source
- `.env` bundled as an asset
- Git
- Git history
- APK
- IPA
- logs
- screenshots
- CI output

## SEC-SECRET-002

Use server-side secret storage for Gemini.

## SEC-SECRET-003

Never expose Supabase service-role/secret keys to the client.

## SEC-SECRET-004

Rotate keys after architectural migration.

## SEC-SECRET-005

Scan current repository AND history.

---

# 22. PHASE 14 — DEVELOPMENT/STAGING/PRODUCTION

Maintain separate environments:

```text
Development
Staging
Production
```

Separate:

- Supabase projects or equivalent isolation
- database
- secrets
- Gemini credentials
- test data
- crash reporting
- analytics
- release credentials

Production must never use development seed data.

---

# 23. PHASE 15 — REMOVE PRODUCTION TEST DATA

Current first-run behavior creates a dummy "Prisha" profile.

Required:

- seed data allowed only in development/test
- production builds must not silently create test identities/data
- automated test must verify production configuration cannot seed test data

---

# 24. PHASE 16 — DATABASE SECURITY

Audit:

- RLS
- foreign keys
- constraints
- indexes
- migrations
- functions
- triggers
- views
- storage buckets
- database roles
- service-role usage
- backups
- audit logs

Default-deny access wherever practical.

---

# 25. PHASE 17 — API SECURITY

Apply OWASP API Security Top 10 principles.

Test:

- broken authentication
- broken object-level authorization
- broken function-level authorization
- property-level authorization
- unrestricted resource consumption
- SSRF where applicable
- security misconfiguration
- improper API inventory
- unsafe third-party API consumption
- injection

Every endpoint must have documented:

```text
authentication requirement
authorization requirement
input schema
output schema
rate limit
data classification
logging behavior
```

---

# 26. PHASE 18 — INPUT VALIDATION

Validate all untrusted input.

Sources include:

- Flutter forms
- deep links
- local database
- SyncMutation payloads
- network responses
- Gemini output
- Supabase responses
- notifications
- URL parameters

Never assume data is trustworthy because it came from Bloom itself.

---

# 27. PHASE 19 — NETWORK SECURITY

Verify:

- HTTPS only
- TLS
- certificate validation
- no plaintext production HTTP
- secure API endpoints
- secure error handling
- no credentials in URLs
- no tokens in query strings

Test using an interception proxy in an authorized test environment.

---

# 28. PHASE 20 — PLATFORM SECURITY

Audit iOS and Android:

- Info.plist
- AndroidManifest.xml
- permissions
- deep links
- URL schemes
- universal links/app links
- notification permissions
- clipboard
- local backups
- screenshots/app-switcher privacy where appropriate
- platform secure storage

Only request permissions that are actually needed.

---

# 29. PHASE 21 — NOTIFICATION SECURITY

Local notifications must:

- avoid sensitive content on lock screens
- be cancellable
- respect quiet hours
- handle timezone changes
- handle task deletion
- handle task rescheduling
- avoid duplicates
- be cancelled appropriately after logout/account deletion

Do not include journal/mood content in notifications.

---

# 30. PHASE 22 — LOGGING

Create a logging policy.

NEVER log:

- passwords
- tokens
- API keys
- journal content
- mood content
- private AI conversations
- sensitive student information
- parent credentials

Log only what is necessary for debugging/security.

---

# 31. PHASE 23 — CRASH REPORTING

Production crash monitoring should be implemented with privacy controls.

Verify:

- PII scrubbing
- journal/mood exclusion
- token exclusion
- user identifiers minimized/pseudonymized where appropriate
- retention period
- access control
- deletion behavior

---

# 32. PHASE 24 — DEPENDENCY SECURITY

For every direct and transitive dependency:

- identify version
- identify maintainer
- check known vulnerabilities
- check maintenance status
- check native permissions/code
- check license
- document data access
- document reason for use

Do not add packages without review.

---

# 33. PHASE 25 — SAST

Add static application security testing.

`flutter analyze` is useful but is NOT sufficient as a security scanner.

Use an appropriate SAST capability such as CodeQL or equivalent.

Scan for:

- secrets
- insecure code patterns
- injection
- unsafe crypto
- unsafe platform calls
- authorization mistakes
- dangerous data handling

---

# 34. PHASE 26 — SCA / DEPENDENCY SCANNING

Add automated dependency security scanning to CI.

Build should fail or block release according to defined severity thresholds.

Document accepted exceptions.

---

# 35. PHASE 27 — SECRET SCANNING

Add secret scanning to:

- pull requests
- main branch
- repository
- history where supported
- release process

Any discovered production secret must be treated as compromised and rotated.

---

# 36. PHASE 28 — SBOM

Generate an SBOM for release builds.

Record:

- Flutter version
- Dart version
- packages
- native dependencies
- versions
- licenses
- security status

Store the SBOM as release evidence.

---

# 37. PHASE 29 — CI/CD

Extend current CI from:

```text
flutter analyze
flutter test
flutter build apk --debug
```

toward:

```text
secret scan
dependency scan
SAST
flutter analyze
unit tests
integration tests
build
SBOM
security gate
```

Do not place production secrets in ordinary GitHub Actions logs.

---

# 38. PHASE 30 — GITHUB SECURITY

Implement:

- protected `main`
- pull requests
- required CI checks
- code review
- secret scanning
- dependency alerts
- least-privilege Actions permissions
- protected production deployment
- separate deployment credentials

Avoid direct production deployment from unreviewed commits.

---

# 39. PHASE 31 — BACKUP AND DISASTER RECOVERY

Document:

## RPO

Maximum acceptable data loss.

## RTO

Maximum acceptable downtime.

Test:

- backup creation
- backup integrity
- restoration
- database recovery
- application recovery
- credential recovery

A backup is not considered verified until restoration has been tested.

---

# 40. PHASE 32 — INCIDENT RESPONSE

Create an incident response plan.

Minimum lifecycle:

```text
Detect
 ↓
Contain
 ↓
Investigate
 ↓
Preserve evidence
 ↓
Revoke/rotate credentials
 ↓
Remediate
 ↓
Assess impact
 ↓
Notify required parties
 ↓
Recover
 ↓
Post-mortem
```

Include security contacts and responsibilities.

Do not invent legal notification periods. Determine them based on the applicable jurisdiction, contracts, and legal advice.

---

# 41. PHASE 33 — VULNERABILITY MANAGEMENT

Maintain a vulnerability register.

Each finding must contain:

- ID
- date discovered
- severity
- description
- affected component
- exploitability
- impact
- owner
- remediation
- target date
- retest
- evidence
- status

---

# 42. PHASE 34 — PENETRATION TESTING

Before public release, conduct authorized security testing.

## Mobile

Test:

- APK/IPA inspection
- local storage
- authentication
- authorization
- network
- deep links
- notifications
- tampering
- reverse engineering
- platform permissions

## API/backend

Test:

- authentication
- authorization
- IDOR/BOLA
- injection
- rate limits
- privilege escalation
- business logic

## Offline sync

Test:

- mutation replay
- mutation tampering
- cross-user mutations
- stale authorization
- deleted-user mutations

## AI

Test:

- prompt injection
- system-prompt extraction
- data exfiltration
- unsafe output
- excessive usage
- abuse
- inappropriate child interactions

Use authorized testing only. Never attack production or third-party systems without permission.

---

# 43. PHASE 35 — BUSINESS LOGIC SECURITY

Security testing must not be limited to technical vulnerabilities.

Test:

- task completion manipulation
- score manipulation
- quiz manipulation
- unauthorized achievement unlocking
- unauthorized parent settings
- unauthorized journal visibility
- repeated submissions
- replay
- race conditions
- privilege escalation

---

# 44. PHASE 36 — ACCESSIBILITY

Target WCAG 2.2 AA principles.

Audit:

- contrast
- semantic labels
- VoiceOver
- TalkBack
- keyboard/focus where applicable
- dynamic text
- touch target size
- error announcements
- reduced motion
- screen magnification
- color independence

The existing:

```text
WCAG_AA_CONTRAST_RATIO = 4.5
```

is useful but not sufficient for the complete audit.

---

# 45. PHASE 37 — RELIABILITY / FAILURE TESTING

Test:

- no internet
- slow internet
- API 500
- Gemini timeout
- malformed Gemini response
- database unavailable
- expired session
- token refresh failure
- app killed during save
- device storage full
- timezone change
- notification permission denied
- corrupted/stale offline mutation

Every failure must produce a safe, understandable outcome.

---

# 46. PHASE 38 — DATA RETENTION

For every data type document:

```text
purpose
retention period
deletion trigger
storage location
third-party recipient
backup behavior
legal requirement
```

Do not retain data indefinitely by default.

---

# 47. PHASE 39 — THIRD-PARTY SDK INVENTORY

Create a complete inventory.

For each SDK:

```text
name
version
purpose
data collected
permissions
network destinations
native code
license
privacy impact
security risk
child-safety impact
approved?
```

No unapproved analytics/advertising SDKs.

---

# 48. PHASE 40 — PERMISSION AUDIT

Review:

- iOS Info.plist
- AndroidManifest.xml
- runtime permissions

Bloom should request only necessary permissions.

Currently expected:

- notifications

Potentially unnecessary unless features are added:

- location
- camera
- microphone
- contacts
- photos

Remove unused permissions.

---

# 49. PHASE 41 — APP STORE COMPLIANCE

Before submission verify that actual implementation matches:

- Apple privacy disclosures
- App Review requirements
- Google Data Safety
- Google Families requirements
- privacy policy
- terms
- account deletion
- age/target-audience declarations

Never declare "no data collection" merely because the app itself does not contain an analytics SDK; include relevant cloud providers and SDK behavior.

---

# 50. PHASE 42 — RELEASE SIGNING

Secure:

- Apple certificates
- provisioning profiles
- App Store Connect roles
- Android signing key
- Google Play credentials
- CI signing secrets

Document who can publish.

Use least privilege.

---

# 51. PHASE 43 — SECURITY TEST DATA

Use synthetic data for security testing.

Do not use real children's:

- names
- emails
- journals
- moods
- school information
- private conversations

during initial security testing.

Create reusable fixtures:

```text
Student A
Student B
Parent A
Parent B
Unauthorized Parent
Revoked Parent
Expired User
Deleted User
```

---

# 52. PHASE 44 — TEST MATRIX

At minimum test these identities:

```text
Anonymous
Student A
Student B
Parent A
Parent B
Parent A of Student A
Parent A NOT of Student B
Revoked Parent
Deleted User
Expired Session
```

For every protected resource test:

- read
- create
- update
- delete

---

# 53. PHASE 45 — RELEASE SECURITY GATE

A release is NO-GO if:

- Critical vulnerability exists
- High vulnerability exists without documented approved exception
- Gemini secret is in client
- Supabase service-role key is in client
- Mock Auth is enabled
- RLS is incomplete
- cross-user access test fails
- account deletion fails
- sensitive data is logged
- child-safety architecture is incomplete for the intended audience
- required privacy disclosure is inaccurate
- production environment contains test seed data
- required security testing has not been completed

---

# 54. TESTFLIGHT STRATEGY

## TestFlight Phase 1 — Security/QA

Synthetic data only.

Participants:

- developer
- QA
- security tester
- owner

## TestFlight Phase 2 — Controlled Beta

Small real-user group.

Only after Gate A/B controls pass.

## Public release

Only after:

- penetration testing
- remediation
- retesting
- privacy review
- store compliance review
- release gate approval

---

# 55. REQUIRED EVIDENCE

For important security controls, retain evidence such as:

- CI logs
- test results
- screenshots where useful
- SQL migration files
- RLS policy tests
- security scan reports
- dependency scan reports
- SBOM
- penetration test report
- remediation report
- privacy/data inventory
- consent-flow evidence
- deletion test evidence
- backup restoration evidence

Evidence must not contain production secrets or unnecessary personal data.

---

# 56. DEVELOPER AGENT EXECUTION PROTOCOL

Antigravity should work in phases.

For each phase:

1. Read the applicable requirements.
2. Inspect current implementation.
3. Identify gaps.
4. Propose minimal secure changes.
5. Implement changes.
6. Run automated tests.
7. Run security-specific tests.
8. Update documentation.
9. Record evidence.
10. Report PASS/FAIL/PARTIAL.
11. Stop if a dependency/blocker prevents safe continuation.

Do not silently skip controls.

If a control cannot be implemented because another control is incomplete, record:

```text
BLOCKED BY: SEC-XXX
```

---

# 57. REQUIRED AGENT REPORT FORMAT

At the end of each implementation phase, produce:

```text
PHASE:
DATE:

CONTROLS IMPLEMENTED:
- SEC-XXX
- SEC-XXX

PASS:
- SEC-XXX

FAIL:
- SEC-XXX

PARTIAL:
- SEC-XXX

BLOCKED:
- SEC-XXX

FILES CHANGED:
- path/file.dart
- path/file.sql

DATABASE CHANGES:
- migration name

SECURITY TESTS RUN:
- test name
- result

EVIDENCE:
- file/report/path

RISKS REMAINING:
- ...

NEXT PHASE:
- ...
```

---

# 58. DO NOT CLAIM SECURITY THAT HAS NOT BEEN VERIFIED

The agent must never write statements such as:

- "Bloom is secure"
- "Bloom is hack-proof"
- "Bloom is fully compliant"
- "Bloom is OWASP certified"

unless such a statement has an actual external basis.

Use precise language:

- "Control implemented"
- "Control tested"
- "Assessment completed"
- "Finding remains"
- "Risk accepted"
- "External verification pending"

---

# 59. REQUIRED SECURITY PRINCIPLES

Bloom should follow:

### Least privilege

Give every user/service only the access required.

### Defense in depth

Do not rely on a single security control.

### Secure by default

Unsafe functionality must not be the default.

### Fail securely

Errors must not bypass authorization.

### Data minimization

Do not collect unnecessary information.

### Privacy by design

Privacy requirements belong in architecture, not only policy documents.

### Zero trust

Never trust the client.

### Separation of environments

Development/staging/production must be isolated.

### Secure supply chain

Every dependency is part of the attack surface.

### Evidence-based security

A control is not complete until tested.

---

# 60. INITIAL IMPLEMENTATION ORDER

Antigravity MUST prioritize:

## Phase A — STOP-SHIP SECURITY

1. Move Gemini server-side.
2. Rotate current Gemini key.
3. Remove Gemini key from client assets.
4. Upgrade Gemini integration/model as appropriate.
5. Implement Supabase Auth.
6. Remove MockAuth from production.
7. Establish real user IDs.
8. Create student profile cloud model.
9. Create parent/student relationship model.
10. Enable RLS.
11. Test cross-user access.

## Phase B — DATA SECURITY

12. Audit Isar.
13. Audit SyncMutation.
14. Implement secure offline authorization.
15. Implement logout.
16. Implement complete account deletion.
17. Remove production seed data.
18. Establish retention rules.
19. Establish privacy data flow.

## Phase C — CHILD + AI SAFETY

20. Age/eligibility architecture.
21. Parental consent architecture.
22. Parent visibility controls.
23. Journal/mood security.
24. AI safety specification.
25. AI companion safety.
26. AI prompt injection testing.
27. AI rate limiting/cost controls.

## Phase D — DEVSECOPS

28. Secret scanning.
29. SAST.
30. Dependency scanning.
31. SBOM.
32. CI security gates.
33. environment separation.
34. signing security.

## Phase E — VERIFICATION

35. MASVS assessment.
36. API security assessment.
37. offline-sync testing.
38. accessibility testing.
39. reliability testing.
40. independent penetration test.
41. remediation.
42. retest.

## Phase F — RELEASE

43. Privacy review.
44. Child-safety review.
45. Apple review.
46. Google Play review.
47. Final release security gate.
48. Controlled TestFlight.
49. Public release.

---

# 61. IMPORTANT: DO NOT IMPLEMENT EVERYTHING IN ONE UNREVIEWED CHANGE

This specification is intentionally large.

Antigravity should NOT:

- rewrite the entire app in one pass
- replace architecture unnecessarily
- delete existing functionality merely to simplify security
- introduce a new backend framework without justification
- introduce Firebase if Supabase can satisfy the requirement
- introduce Node.js merely because an API proxy is required
- disable offline mode to avoid sync complexity
- remove journal/mood functionality merely because it requires additional controls

Instead, preserve the existing architecture and harden it.

---

# 62. EXISTING BLOOM DOCUMENTS TO UPDATE

After implementation, ensure consistency across:

```text
docs/ENG-002_Backend_Architecture.md
docs/ENG-003_Authentication_Specification.md
docs/ENG-004_Offline_Sync_Architecture.md
docs/ENG-005_DevOps_and_Observability.md
docs/UX-004_Accessibility_Spec.md
docs/security/SECURITY_MASTER.md
HANDOVER.md
```

Material security decisions must be recorded in `HANDOVER.md`.

---

# 63. FINAL DEFINITION OF DONE

Bloom security hardening is complete only when:

```text
Authentication                PASS
Authorization                 PASS
RLS                           PASS
Cross-user isolation          PASS
Gemini secret protection      PASS
AI gateway                    PASS
AI safety                     PASS
Child/privacy architecture   PASS
Journal protection            PASS
Mood protection               PASS
Offline security              PASS
SyncMutation security         PASS
Account deletion              PASS
Secret scanning               PASS
SAST                          PASS
Dependency scanning           PASS
SBOM                          PASS
CI security gate              PASS
Logging/privacy               PASS
Backup/recovery               PASS
Accessibility                 PASS
Mobile security assessment    PASS
API security assessment       PASS
Penetration test              PASS
Remediation/retest            PASS
App-store privacy review      PASS
Release gate                  PASS
```

No single test proves security. The combination of architecture, controls, automated tests, manual tests, independent assessment, and operational procedures is the security posture.

---

# 64. MASTER PRINCIPLE

The ultimate objective is not:

> "Make Bloom impossible to hack."

That is not a realistic security claim.

The objective is:

> **If Bloom's client is compromised, the attacker still cannot obtain or manipulate another user's protected information, cannot obtain Bloom's production secrets, cannot freely consume the AI service, cannot bypass authorization, and cannot silently compromise the system without detection.**

That is the security architecture Bloom should be built toward.

---

# 65. END OF MASTER SPECIFICATION


---

# 66. ANTIGRAVITY FIRST-RUN PROMPT

Use the following prompt when first giving this document to Antigravity.

**COPY/PASTE THIS PROMPT:**

> Read `BLOOM_SECURITY_MASTER_SPECIFICATION.md` completely before taking any implementation action.
>
> This document is the authoritative security, privacy, compliance, AI-safety, DevSecOps, reliability, and production-release hardening specification for Bloom.
>
> **Do NOT modify the codebase yet.**
>
> Your first task is a READ-ONLY SECURITY GAP ASSESSMENT.
>
> Inspect the complete Bloom repository, including:
>
> - Flutter source code
> - `pubspec.yaml` and lockfile
> - Isar models and database initialization
> - offline/sync architecture
> - `SyncMutation`
> - authentication implementation
> - Supabase initialization and configuration
> - Supabase SQL/migrations/RLS policies
> - Gemini/AI gateway implementation
> - AI prompts and structured output handling
> - notification implementation
> - iOS configuration
> - Android configuration
> - GitHub Actions
> - dependency configuration
> - environment/secrets handling
> - existing documentation
> - `HANDOVER.md`
>
> Compare the actual implementation against EVERY APPLICABLE CONTROL in `BLOOM_SECURITY_MASTER_SPECIFICATION.md`.
>
> For every control, report:
>
> `CONTROL ID | STATUS | CURRENT IMPLEMENTATION | GAP/FINDING | SEVERITY | DEPENDENCIES | FILES LIKELY TO CHANGE | DATABASE/INFRA CHANGES | TESTS REQUIRED | EVIDENCE REQUIRED | PROPOSED PHASE`
>
> Use only these statuses:
>
> - PASS
> - PARTIAL
> - FAIL
> - NOT STARTED
> - NOT APPLICABLE
> - UNVERIFIED
>
> Be conservative. If you cannot verify a control from the repository, mark it `UNVERIFIED`; do not assume it is secure.
>
> Pay particular attention to these current known blockers:
>
> 1. Mock authentication
> 2. Missing Supabase RLS
> 3. Direct Gemini API access from Flutter
> 4. Gemini API key bundled through `.env`
> 5. No formal parent-student authorization model
> 6. Sensitive journal and mood data
> 7. Offline `SyncMutation` security
> 8. Production dummy/test data seeding
> 9. Local Isar security
> 10. Child/mixed-age privacy and safety
>
> Do not create fake evidence, fake tests, or fake security claims.
>
> After the control-by-control assessment, provide:
>
> ### A. Executive Risk Summary
> List Critical, High, Medium and Low findings.
>
> ### B. Stop-Ship Findings
> Identify everything that must be fixed before real-user TestFlight.
>
> ### C. Proposed Architecture
> Show the recommended target architecture, particularly for:
>
> - Supabase Auth
> - PostgreSQL/RLS
> - parent-student authorization
> - Gemini through Supabase Edge Functions
> - Isar/offline sync
> - AI safety
>
> ### D. Implementation Roadmap
> Propose dependency-ordered phases. Do not implement them yet.
>
> ### E. Files and Migrations
> List expected source files, SQL migrations, Edge Functions, CI files and documentation that would need to change.
>
> ### F. Testing Strategy
> List automated, manual, security, adversarial and penetration tests required.
>
> ### G. Open Decisions
> Identify decisions that require Rushin's approval before implementation.
>
> ### H. Documentation Plan
> Identify which files under `docs/security/`, existing `docs/`, and `HANDOVER.md` should be created or updated.
>
> **STOP after delivering the gap assessment.**
>
> Do not implement remediation, do not modify production code, do not run destructive database migrations, do not rotate credentials, and do not change deployment configuration during this first audit-only pass.
>
> Wait for explicit approval of the proposed implementation plan before proceeding.

---

# 67. DOCUMENT OWNERSHIP MODEL

There are intentionally two related but different documents.

## `BLOOM_SECURITY_MASTER_SPECIFICATION.md`

Location:

```text
/BLOOM_SECURITY_MASTER_SPECIFICATION.md
```

Purpose:

**The authoritative requirements and instructions.**

It answers:

> What security/compliance controls must Bloom have?

This document should change relatively slowly and only when the security requirements themselves change.

---

## `docs/security/SECURITY_MASTER.md`

Location:

```text
/docs/security/SECURITY_MASTER.md
```

Purpose:

**The living implementation and audit record.**

It answers:

> What has Bloom actually implemented, tested, accepted, deferred, or failed?

Antigravity should create this file if it does not already exist.

It should contain:

- current overall security status
- control status
- implementation dates
- evidence references
- test results
- open findings
- accepted risks
- remediation status
- security decisions
- links/references to detailed security documents

### Important

Do NOT create `docs/security/SECURITY_MASTER.md` manually right now if Antigravity has not yet audited the repository.

During the first audit-only pass, Antigravity should:

1. Inspect whether it already exists.
2. If absent, report that it needs to be created.
3. Create/populate it only if that is part of the approved audit-documentation work, without modifying application security behavior.

After implementation begins, this becomes the canonical living security register.

---

# 68. HOW TO USE THIS DOCUMENT

### Step 1

Put this file at:

```text
Bloom/
└── BLOOM_SECURITY_MASTER_SPECIFICATION.md
```

### Step 2

Give Antigravity the First-Run Prompt from Section 66.

### Step 3

Antigravity performs a **read-only audit**.

### Step 4

It produces the gap assessment.

### Step 5

Bring that report back for independent review.

### Step 6

Only after approval, let Antigravity implement Phase 1.

### Step 7

After each phase:

- run tests
- collect evidence
- update `docs/security/SECURITY_MASTER.md`
- update relevant technical documents
- update `HANDOVER.md`
- review the result before moving to the next phase

---

# 69. DO NOT CONFUSE THE TWO DOCUMENTS

The simplest mental model is:

```text
BLOOM_SECURITY_MASTER_SPECIFICATION.md
            │
            │ defines requirements
            ▼
      Antigravity audit
            │
            ▼
docs/security/SECURITY_MASTER.md
            │
            │ records actual status/evidence
            ▼
     Release Security Gate
```

One is the **rulebook**.

The other is the **audit ledger**.

You need both eventually, but you only need to download and place the master specification now.
