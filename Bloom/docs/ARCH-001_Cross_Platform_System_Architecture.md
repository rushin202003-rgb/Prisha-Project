# ARCH-001 — Cross-Platform System Architecture

**Project:** Project Bloom  
**Version:** 2.0.0  
**Status:** Revised

## 1. Purpose

Define an architecture for one Project Bloom product working across mobile, tablet, desktop, and web.

## 2. Supported Platforms

First-class targets:
- iOS
- iPadOS
- Android
- macOS
- Windows
- Web

Linux may be supported where the chosen framework provides stable support without disproportionate maintenance.

## 3. Architecture

```text
                 PROJECT BLOOM
                       |
          +------------+------------+
          |            |            |
        Mobile       Desktop       Web
     iOS/Android   macOS/Windows  Browser
          |            |            |
          +------------+------------+
                       |
              Shared Application
                  Architecture
                       |
              +--------+--------+
              |                 |
        Domain/Application   Platform
             Logic          Integrations
              |                 |
              +--------+--------+
                       |
                 Secure API
                       |
                 Cloud Backend
          +------------+------------+
          |            |            |
       Database       AI          Files
```

## 4. Layers

### Presentation
Responsive screens and components.

### Application
Use cases such as generating schedules, completing tasks, adding syllabus, planning hobbies, asking AI, and uploading worksheets.

### Domain
Scheduling, task priority, exam planning, revision, permissions, and progress.

### Data
API client, local persistence, synchronization, and repositories.

### Platform
Notifications, secure storage, file picker, camera/scanner where supported, sharing, and accessibility integrations.

## 5. Cross-Platform Rule

Business logic must not depend on a specific operating system.

## 6. Backend

The backend provides:
- Authentication
- Authorization
- Cloud persistence
- Sync
- AI gateway
- File management
- Parent relationships
- Server-side validation

## 7. AI Gateway

```text
Client → Authenticated API → AI Gateway → AI Provider
```

Provider credentials remain server-side. The gateway enforces authorization, safety, context filtering, rate limits, and data minimisation.

## 8. Scheduling Engine

The scheduling engine is independently testable.

Inputs:
- School hours
- Availability
- Tasks
- Exams
- Syllabus
- Revision boundary
- Hobbies
- Play
- Breaks
- Priorities

AI may suggest options, but application/domain logic validates the final schedule.

## 9. Synchronisation

Cloud data is authoritative for synchronized accounts. Clients maintain local state for responsive/offline use.

Sync must handle updates, completion changes, rescheduling, conflicts, and retries.

## 10. Responsive UX

- **Phone:** Today, tasks, AI, and quick actions
- **Tablet:** navigation rail/sidebar and multi-column planning
- **Desktop/Web:** expanded planner, keyboard/mouse interaction, resizable layouts

## 11. Security

- No API secrets in client applications.
- Server-side authorization.
- Secure transport.
- Protected local credentials.
- Access-controlled files.
- Student/parent permission separation.

## 12. Acceptance Criteria

- iOS and Android can use the same core business logic.
- Desktop and web use the same product model.
- APIs are platform-independent.
- AI provider credentials remain server-side.
- Scheduling is platform-independent.
- Responsive layouts are supported.
- Platform-specific services are isolated.

---

**End of ARCH-001**
