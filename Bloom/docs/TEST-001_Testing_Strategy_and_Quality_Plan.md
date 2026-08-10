# TEST-001 — Testing Strategy & Quality Plan

**Project:** Project Bloom
**Version:** 1.0.0
**Status:** Draft

## 1. Purpose

Define the testing strategy required to validate Project Bloom before release.

## 2. Testing Layers

### Unit Tests
Test:
- Scheduling calculations
- Revision boundary calculations
- Task prioritisation
- Date/time handling
- Progress calculations
- Reward calculations
- Permission rules
- Data validation

### Integration Tests
Test:
- API client ↔ backend
- Local persistence ↔ sync
- Authentication ↔ authorization
- File upload ↔ worksheet metadata
- AI gateway ↔ application services
- Notifications ↔ scheduling events

### UI Tests
Test critical student flows:
- Onboarding
- Dashboard
- Add homework
- Add syllabus
- Generate schedule
- Revise schedule
- Select hobby
- Complete task
- Ask AI
- Upload worksheet
- View progress

### Accessibility Tests
Validate:
- VoiceOver
- Dynamic Type
- Reduced Motion
- Touch targets
- Labels
- Contrast
- Non-colour status indicators

## 3. Critical Business Test Cases

### TC-001 — Partial Syllabus
Given only some subjects/chapters are known:
- The app must not assume the syllabus is complete.
- New syllabus can be added later.
- Existing completed work is preserved.

### TC-002 — Final Revision Period
Given an exam date:
- The scheduling engine calculates the revision boundary.
- The final 12 days are protected according to the planning rules.
- New work must not silently consume protected revision capacity.

### TC-003 — Sleepy/Busi​y Student
Given the student reports reduced availability:
- Existing commitments are identified.
- Lower-priority work may be moved/reduced.
- 2–3 options can be generated.
- The student's selection determines the final schedule.

### TC-004 — Homework
A homework item:
- Has a subject.
- Can have a due date.
- Has an estimated duration.
- Appears in planning.
- Can be completed.
- Can be rescheduled.

### TC-005 — Hobby
A selected hobby session:
- Appears in the schedule.
- Has a duration.
- Does not silently disappear because academic work was added.
- Can be moved with user approval.

### TC-006 — Parent Privacy
A parent account:
- Can see authorised progress.
- Cannot automatically see private journal entries.
- Cannot automatically see private AI conversations.
- Cannot access another student's data.

### TC-007 — AI Uncertainty
When syllabus information is unavailable:
- AI must state that it does not know.
- It must request the relevant information.
- It must not invent chapter names.

## 4. Regression Testing

Every release must rerun tests covering:
- Authentication
- Student/parent permissions
- Scheduling
- Exam planning
- Task persistence
- Local sync
- AI gateway
- File handling
- Notifications

## 5. Performance Testing

Measure:
- Dashboard load time
- Schedule generation time
- Sync time
- File upload behaviour
- AI response latency

The product should feel responsive during ordinary student use.

## 6. Security Testing

Test:
- Unauthorized API access
- Broken object-level authorization
- Parent/student permission bypass
- Token handling
- File access control
- Rate limits
- Sensitive data exposure
- Logging exposure

## 7. Test Data

Use synthetic test accounts and school data.

Do not use real student personal information in development or automated tests unless explicitly approved and protected.

## 8. Release Gates

A release must not proceed if:
- Critical security issues remain.
- Student data can be accessed across accounts.
- Core scheduling logic fails.
- Major data-loss bugs remain.
- Accessibility failures block core navigation.
- AI safety failures remain unresolved.

## 9. Bug Severity

### Critical
Security breach, data loss, unusable core app.

### High
Major feature broken or incorrect schedule affecting core use.

### Medium
Important but recoverable defect.

### Low
Cosmetic or minor usability issue.

## 10. Acceptance Criteria

A release candidate must have:
- Passing unit tests
- Passing integration tests
- Passing critical UI tests
- Accessibility review
- Security review
- Regression pass
- Documented known issues

---

**End of TEST-001**
