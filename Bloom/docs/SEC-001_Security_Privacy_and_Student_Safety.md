# SEC-001 — Security, Privacy & Student Safety Specification

**Project:** Project Bloom
**Version:** 1.0.0
**Status:** Draft

## 1. Purpose

Define security, privacy, access control, and student-safety requirements.

## 2. Security Principles

1. Least privilege
2. Data minimisation
3. Secure defaults
4. Server-side authorization
5. No secrets in client code
6. Explicit parent/student permissions
7. Audit sensitive operations
8. Protect data throughout its lifecycle

## 3. Authentication

Authentication must:
- Use a secure identity mechanism.
- Protect sessions.
- Support logout/revocation.
- Avoid storing passwords directly unless the selected authentication architecture requires it.

If a simple student PIN is offered, it should be treated as a local convenience mechanism and must not replace secure account authorization.

## 4. Authorization

Every backend resource must verify:
- User identity
- Role
- Resource ownership
- Relationship permissions

Never rely only on client-side checks.

## 5. Student/Parent Separation

Student and parent accounts must have separate authorization scopes.

Parent access should be explicit and revocable.

## 6. Private Data

Potentially private information includes:
- Journal
- Mood entries
- AI conversations
- Personal goals
- School information
- Uploaded documents

These should have explicit access rules.

## 7. Data Minimisation

Only collect information required for:
- Planning
- Learning
- Account management
- Product operation
- Safety/security

Avoid collecting unnecessary personal information.

## 8. Data Encryption

Use appropriate encryption:
- In transit
- At rest
- For sensitive local credentials/tokens

## 9. File Security

Uploaded worksheets must:
- Be associated with an authorised owner.
- Have access-controlled storage.
- Use validated file types.
- Have reasonable size limits.
- Not be publicly accessible by default.

## 10. AI Security

The AI gateway must:
- Authenticate requests.
- Authorize data access.
- Send only relevant context.
- Avoid exposing unrelated student information.
- Apply rate limits.
- Avoid placing provider credentials in the iPad app.

## 11. AI Safety

The AI should:
- Be age appropriate.
- Avoid manipulative emotional dependency.
- Avoid shame or fear.
- Avoid encouraging unhealthy study behaviour.
- Encourage reasonable rest and breaks.
- Not impersonate real people or celebrities.
- Escalate appropriately when a situation exceeds the app's role.

## 12. Logging

Logs should contain operational information without exposing:
- Journal text
- Mood notes
- Full private AI conversations
- Uploaded document contents
- Authentication secrets

## 13. Data Retention

Retention periods should be defined per data category.

The product should support appropriate deletion of:
- Account
- Journal entries
- Mood entries
- AI conversations
- Uploaded files

## 14. Account Deletion

Account deletion must:
- Require intentional confirmation.
- Explain consequences.
- Revoke active sessions.
- Delete or anonymise data according to the retention policy.
- Handle parent relationships appropriately.

## 15. Privacy by Design

Privacy requirements must be considered during:
- UX design
- Database design
- API design
- AI prompt/context construction
- Analytics implementation
- Notifications

## 16. Security Testing

Security tests must cover:
- Authentication bypass
- Authorization bypass
- Object-level access
- File access
- Session handling
- Rate limiting
- Sensitive logging
- AI context leakage

## 17. Incident Response

Production incidents should have:
- Detection
- Triage
- Containment
- Investigation
- Remediation
- Appropriate notification
- Post-incident review

## 18. Acceptance Criteria

The product must not release with:
- Known critical authorization bypass
- Cross-student data exposure
- Unprotected private files
- Exposed API secrets
- Critical AI safety defect
- Critical account/session vulnerability

---

**End of SEC-001**
