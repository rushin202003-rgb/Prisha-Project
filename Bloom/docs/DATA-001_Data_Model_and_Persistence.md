# DATA-001 — Data Model & Persistence Specification

**Project:** Project Bloom
**Version:** 1.0.0
**Status:** Draft

## 1. Purpose

Define the logical data model for Project Bloom.

## 2. Core Entities

### User
- id
- role
- displayName
- grade
- board
- createdAt
- updatedAt

### StudentProfile
- userId
- schoolHours
- preferredLanguage
- preferredTeachingMode
- reminderPreference
- appearancePreference

### Subject
- id
- studentId
- name
- code
- active

### SyllabusItem
- id
- subjectId
- title
- description
- sequence
- estimatedMinutes
- status
- source
- createdAt
- updatedAt

### Exam
- id
- studentId
- title
- date
- subjectId
- priority
- notes

### Task
- id
- studentId
- subjectId
- type
- title
- description
- dueAt
- estimatedMinutes
- priority
- status
- source
- createdAt
- updatedAt

Task types may include:
- Homework
- Notes
- Worksheet
- Study
- Revision
- Practice
- Hobby
- Personal

### Schedule
- id
- studentId
- date
- version
- status
- createdAt
- selectedAt

### ScheduleBlock
- id
- scheduleId
- taskId
- startAt
- endAt
- blockType
- locked
- reasonCode

### Hobby
- id
- studentId
- name
- category
- active

### HobbySession
- id
- hobbyId
- date
- durationMinutes
- status

### Goal
- id
- studentId
- title
- category
- target
- status

### Achievement
- id
- studentId
- achievementType
- title
- earnedAt

### JournalEntry
- id
- studentId
- date
- content
- createdAt
- updatedAt

### MoodEntry
- id
- studentId
- date
- mood
- optionalNote

### Book
- id
- studentId
- title
- author
- status

### MusicItem
- id
- studentId
- title
- artist
- status

### TravelWish
- id
- studentId
- place
- notes
- status

### CraftIdea
- id
- studentId
- title
- notes
- status

### Worksheet
- id
- studentId
- subjectId
- taskId
- fileId
- title
- status

### FileMetadata
- id
- ownerId
- storageKey
- mimeType
- sizeBytes
- createdAt

### ParentStudentRelationship
- id
- studentId
- parentUserId
- permissions
- status
- createdAt

### NotificationPreference
- id
- userId
- gentleEnabled
- strongEnabled
- quietHoursStart
- quietHoursEnd

### AIConversation
- id
- userId
- createdAt
- updatedAt

### AIMessage
- id
- conversationId
- role
- content
- createdAt

AI message retention should be configurable and privacy-aware.

## 3. Relationships

```text
User
 └── StudentProfile
      ├── Subjects
      │    └── SyllabusItems
      ├── Exams
      ├── Tasks
      ├── Schedules
      │    └── ScheduleBlocks
      ├── Hobbies
      │    └── HobbySessions
      ├── Goals
      ├── Achievements
      ├── JournalEntries
      ├── MoodEntries
      ├── Books
      ├── MusicItems
      ├── TravelWishes
      ├── CraftIdeas
      └── Worksheets
```

## 4. Status Enums

### TaskStatus
- planned
- inProgress
- completed
- skipped
- cancelled

### SyllabusStatus
- notStarted
- learning
- completed
- needsRevision

### ScheduleStatus
- proposed
- selected
- active
- archived

### HobbySessionStatus
- planned
- completed
- skipped

## 5. Audit Fields

User-editable entities should generally contain:
- createdAt
- updatedAt

Important server-managed changes should optionally include:
- createdBy
- updatedBy
- version

## 6. Data Ownership

Student-owned data must be associated with the correct student.

Parent access must be through an explicit relationship rather than guessing ownership from email or name.

## 7. Local Persistence

The iPad should persist essential records needed for offline operation.

Sync metadata may include:
- localVersion
- serverVersion
- lastSyncedAt
- syncState

## 8. Data Deletion

Deletion should be intentional.

Sensitive data should support appropriate deletion/export workflows.

## 9. Data Validation

Examples:
- Exam dates must be valid.
- Task duration must be positive.
- Schedule blocks cannot have end before start.
- Subject must exist before a syllabus item is attached.
- Parent relationship must reference valid users.

## 10. Data Model Acceptance Criteria

- Entities have stable IDs.
- Relationships are explicit.
- Student ownership is enforceable.
- Parent permissions are represented.
- Local sync metadata is supported.
- Sensitive records can be controlled and deleted appropriately.

---

**End of DATA-001**
