# API-001 — API Specification

**Project:** Project Bloom
**Version:** 1.0.0
**Status:** Draft

## 1. Purpose

Define the initial backend API contract for the iPad application.

## 2. API Principles

- HTTPS only
- Authenticated requests
- Explicit authorization
- JSON request/response bodies unless file transfer requires otherwise
- Stable resource identifiers
- Consistent error format
- Versioned API
- No provider secrets on the iPad

Base path example:

`/api/v1`

## 3. Authentication

### POST /auth/session
Creates or refreshes an authenticated application session.

### POST /auth/logout
Ends the current session.

Authentication implementation should be selected during architecture implementation.

## 4. Student Profile

### GET /me
Returns the authenticated user's profile.

### PATCH /me
Updates editable profile preferences.

## 5. Subjects

### GET /subjects
List the student's subjects.

### POST /subjects
Create a subject.

### PATCH /subjects/{subjectId}
Update a subject.

### DELETE /subjects/{subjectId}
Archive/delete a subject according to data-retention rules.

## 6. Syllabus

### GET /subjects/{subjectId}/syllabus
List syllabus items.

### POST /subjects/{subjectId}/syllabus
Create syllabus item.

### PATCH /syllabus/{itemId}
Update syllabus item.

### POST /syllabus/import
Import syllabus information from supported input.

The endpoint must not silently overwrite completed student work.

## 7. Exams

### GET /exams
List exams.

### POST /exams
Create exam.

### PATCH /exams/{examId}
Update exam.

### DELETE /exams/{examId}
Remove an exam.

## 8. Tasks

### GET /tasks
Query tasks by date/status/subject.

### POST /tasks
Create task.

### PATCH /tasks/{taskId}
Update task.

### POST /tasks/{taskId}/complete
Mark task completed.

### POST /tasks/{taskId}/reschedule
Request a task reschedule.

## 9. Schedules

### GET /schedules/{date}
Get schedule for a date.

### POST /schedules/generate
Generate a schedule proposal.

Request should include relevant constraints and preferences.

### POST /schedules/{scheduleId}/select
Select a proposed schedule.

### POST /schedules/{scheduleId}/revise
Generate revised schedule options.

The API should support returning 2–3 alternatives when requested.

## 10. Hobbies

### GET /hobbies
List hobbies.

### POST /hobbies
Create hobby.

### PATCH /hobbies/{hobbyId}
Update hobby.

### POST /hobbies/{hobbyId}/sessions
Create a hobby session.

## 11. Life Dashboard

Resources:
- `/goals`
- `/books`
- `/music`
- `/travel-wishes`
- `/craft-ideas`
- `/achievements`

Each should support normal list/create/update operations.

## 12. Journal and Mood

### GET /journal
List authorised journal entries.

### POST /journal
Create entry.

### PATCH /journal/{entryId}
Update entry.

### DELETE /journal/{entryId}
Delete entry.

### GET /mood
List authorised mood entries.

### POST /mood
Create mood entry.

These endpoints require strict privacy authorization.

## 13. Worksheets and Files

### POST /files/upload
Upload a supported file using a secure upload mechanism.

### GET /files/{fileId}
Return authorized file metadata/access information.

### DELETE /files/{fileId}
Delete a file if authorized.

### POST /worksheets
Create worksheet metadata.

### GET /worksheets
List worksheets.

## 14. AI

### POST /ai/chat
Send a user request to the AI gateway.

Request conceptually contains:
- conversationId
- message
- context references
- teachingMode

The backend should construct the AI context from authorised data.

### POST /ai/explain
Request an educational explanation.

### POST /ai/quiz
Generate a practice quiz.

### POST /ai/schedule-options
Generate 2–3 schedule alternatives.

AI endpoints must enforce safety, authorization, rate limits, and data minimisation.

## 15. Parent

### GET /parent/students
List authorised student relationships.

### GET /parent/students/{studentId}/progress
Return permitted progress information.

### GET /parent/students/{studentId}/upcoming
Return permitted upcoming academic information.

Private journal and AI conversation data must not be included unless explicitly authorised by the product's privacy model.

## 16. Notifications

### GET /notification-preferences
Get preferences.

### PATCH /notification-preferences
Update preferences.

## 17. Errors

Recommended structure:

```json
{
  "error": {
    "code": "INVALID_REQUEST",
    "message": "The request could not be completed.",
    "requestId": "..."
  }
}
```

Do not expose internal stack traces or secrets.

## 18. Authorization

Every resource request must verify:
1. Authentication.
2. Resource ownership or explicit relationship.
3. Required permission.
4. Appropriate role.

## 19. Rate Limiting

Rate limits should apply especially to:
- AI endpoints
- File uploads
- Authentication
- Schedule generation

Limits should be configurable server-side.

## 20. API Versioning

Breaking changes require a new API version.

Non-breaking additions may remain within the existing version.

## 21. API Acceptance Criteria

- All endpoints require appropriate authorization.
- Errors use a consistent format.
- AI secrets remain server-side.
- Parent endpoints cannot access private student content by default.
- Schedule generation is deterministic where appropriate.
- APIs are versioned.
- Critical operations are logged without exposing sensitive content.

---

**End of API-001**
