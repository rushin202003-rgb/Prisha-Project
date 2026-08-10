# CURSOR-001 — Cross-Platform Cursor Build Handoff

**Project:** Project Bloom  
**Version:** 2.0.0  
**Status:** Revised Build Handoff

## 1. Critical Requirement

Project Bloom is **not an iOS-only application**.

Required targets:
- iOS
- iPadOS
- Android
- macOS
- Windows
- Web

Do not create a SwiftUI-only architecture.

## 2. Before Coding

Read all documents in `/docs`, especially BRD, PRD, FRD, NFR, UX, AI, ARCH, DATA, API, TEST, SEC, and TECH.

If documents conflict, report the conflict instead of silently choosing.

## 3. Technology Evaluation First

Before production feature development:
1. Inspect requirements.
2. Evaluate Flutter, React Native-based options, and .NET MAUI.
3. Consider mobile, tablet, desktop, and web.
4. Consider accessibility, notifications, files, persistence, sync, authentication, AI, performance, and maintainability.
5. Recommend a stack.
6. Create a technology decision record.
7. Do not start large-scale development until the decision is documented.

Flutter is the current recommended candidate, not a mandatory choice.

## 4. Build Milestones

### Milestone 0 — Foundation
Create:
- Cross-platform project
- `/docs`
- Test infrastructure
- Environment configuration
- Basic architecture
- README
- AGENTS.md

### Milestone 1 — Design Shell
Build:
- Project Bloom theme
- Responsive navigation
- Today
- Planner
- Learn
- Hobbies
- Life
- Progress
- Settings

No AI or cloud dependency yet.

### Milestone 2 — Student Core
Build profile, subjects, syllabus, tasks, homework, notes, worksheets metadata, and local persistence.

### Milestone 3 — Scheduling
Build availability, priorities, exams, revision boundary, schedule generation, 2–3 alternatives, and rescheduling.

### Milestone 4 — Life Dashboard
Build hobbies, play, goals, books, music, travel, crafts, achievements, journal, and mood.

### Milestone 5 — Backend
Build authentication, database, API, sync, file storage, and parent relationships.

### Milestone 6 — AI
Build AI gateway, teaching modes, doubt solving, quizzes, worksheet assistance, and schedule assistance.

### Milestone 7 — Hardening
Accessibility, security, notifications, offline behaviour, performance, and cross-platform testing.

## 5. Responsive Rule

Do not design only for iPad and shrink it down. Create responsive layouts for phone, tablet, laptop, desktop, and browser.

## 6. Domain Logic Rule

Scheduling, exam planning, revision calculation, task priority, progress, and rewards must remain platform-independent.

## 7. AI Rule

AI must not directly mutate important application data.

```text
User
 ↓
AI Gateway
 ↓
Structured response
 ↓
Application validation
 ↓
Domain service
 ↓
Database
```

## 8. Testing Rule

Every milestone must build successfully, run automated tests, test critical flows, report files changed, report tests run, and report known issues.

## 9. Security Rule

Never commit secrets, put provider API keys in clients, trust client-only authorization, or expose private student data to parents by default.

## 10. Visual Direction

Project Bloom should be colourful, cheerful, playful, calm, and accessible:
- Pastel pink
- Lavender
- Mint
- Rainbow pastel
- Travel motifs
- Garden motifs

## 11. iPad Priority Without Lock-In

iPad is a high-priority experience because it is the preferred device, but every core feature must work across supported platforms.

## 12. First Deliverable

The first coding milestone is a **working cross-platform Project Bloom shell**, not the complete application.

It must demonstrate:
- App launches
- Navigation works
- Theme works
- Responsive layouts work
- Tests run
- No cloud/AI dependency is required

## 13. Stop-and-Ask Rule

Stop and ask for a decision if requirements conflict, a platform limitation changes the product, a technical choice creates major vendor lock-in, a security/privacy decision is ambiguous, or a feature cannot reasonably work across required platforms.

---

**End of CURSOR-001**
