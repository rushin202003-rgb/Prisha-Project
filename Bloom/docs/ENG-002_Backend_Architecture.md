# ENG-002 — Backend Architecture (Vendor-Agnostic)

**Project:** Project Bloom  
**Version:** 1.0.0  
**Status:** Approved

## 1. Overview
Project Bloom relies on a backend strictly for **Data Synchronization** and **Cross-Device State**. The backend does not run heavy business logic; the domain logic lives on the Flutter client.

Whether we select Firebase, Supabase, or AWS Amplify, the schema follows standard NoSQL document/collection paradigms.

## 2. Core Collections (NoSQL Structure)

### `users` Collection
Stores the top-level account (usually tied to the Parent/Guardian email or Apple ID).
- `id`: String (UUID)
- `email`: String
- `createdAt`: Timestamp
- `subscriptionTier`: String (Free / Premium)

### `student_profiles` Collection
A user can have multiple student profiles (e.g., siblings).
- `id`: String
- `userId`: String (Foreign Key)
- `displayName`: String
- `gradeLevel`: String
- `themePreference`: String

### `tasks` Collection
The core atomic unit of work (Homework, Quizzes, Reading).
- `id`: String
- `studentId`: String
- `title`: String
- `type`: Enum (homework, revision, reading)
- `dueDate`: Timestamp
- `status`: Enum (pending, in_progress, completed)

### `journal_entries` Collection
- `id`: String
- `studentId`: String
- `mood`: Enum
- `content`: String (Encrypted at rest)
- `timestamp`: Timestamp

## 3. Real-time Synchronization Requirements
The chosen backend MUST support WebSockets or Server-Sent Events (SSE) to allow the Flutter client to subscribe to collection changes. When a parent updates a setting on their phone, the student's iPad must update instantly if online.

## 4. API Design (Serverless)
Any complex backend logic (such as triggering a Push Notification when a task is overdue) will be handled via serverless functions (Cloud Functions/Edge Functions) reacting to database write events.
