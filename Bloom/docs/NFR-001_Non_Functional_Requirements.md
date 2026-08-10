# NFR-001 — Non-Functional Requirements

**Project:** Project Bloom  
**Document ID:** NFR-001  
**Version:** 1.0.0  
**Status:** Draft

## 1. Purpose

Define quality, security, performance, reliability, accessibility, privacy, and maintainability requirements.

## 2. Performance

- Dashboard should feel responsive during normal use.
- Local navigation should not require network access where unnecessary.
- Heavy operations should provide progress feedback.
- AI operations should show an appropriate loading state.

## 3. Reliability

- User-entered tasks should not be lost during normal operation.
- Schedule changes should be recoverable.
- Sync conflicts should be handled explicitly.
- Failed network operations should provide useful retry behaviour.

## 4. Offline Behaviour

Where technically feasible, users should still be able to:
- View recent schedules.
- View saved tasks.
- Mark appropriate local tasks complete.
- Review saved syllabus information.

Network-dependent features should clearly indicate when connectivity is required.

## 5. Security

- Credentials and secrets must not be embedded in source code.
- Data in transit must use secure transport.
- Sensitive stored data must have appropriate protection.
- Access must be authorised by account role.
- Parent and student permissions must be separated.

## 6. Privacy

The system should follow data minimisation.

Sensitive areas such as journals, mood information, schedules, uploaded school material, and AI conversations require explicit access controls.

Users should have appropriate data-management controls.

## 7. Child/Student Safety

The product must be designed for school-age users.

The AI must:
- Use age-appropriate language.
- Avoid manipulative engagement.
- Avoid guilt-based productivity.
- Avoid encouraging unhealthy study patterns.
- Encourage appropriate breaks and rest.
- Avoid pretending to be a real celebrity or person.

## 8. Accessibility

Support:
- VoiceOver
- Dynamic Type
- Reduced Motion
- Sufficient contrast
- Clear labels
- Large touch targets
- Non-colour-only communication

## 9. Usability

The main student dashboard should be understandable quickly.

Core tasks should require minimal navigation.

The interface should feel playful but remain readable and calm.

## 10. Maintainability

The codebase should:
- Use clear module boundaries.
- Avoid unnecessary coupling.
- Have automated tests for critical business logic.
- Keep configuration separate from application logic.
- Document architectural decisions.

## 11. Scalability

Architecture should allow future addition of:
- Teachers
- Schools
- Additional platforms
- More subjects
- More languages
- Additional AI capabilities

without requiring a complete rewrite.

## 12. Observability

Production systems should provide appropriate:
- Error logging
- Crash reporting
- Performance monitoring
- Service health information

Logs must avoid exposing sensitive student content.

## 13. Backup and Recovery

Critical user data should have an appropriate backup/recovery strategy.

Deletion must remain intentional and controlled.

## 14. Compatibility

Initial priority:
- iPad
- Current supported iPadOS versions selected during technical architecture.

Future:
- iPhone
- Web

## 15. Quality Gate

A production feature must satisfy:
- Functional tests
- Relevant UI tests
- Accessibility checks
- Security review where applicable
- Error-state validation
- Data persistence checks

---

**End of NFR-001**
