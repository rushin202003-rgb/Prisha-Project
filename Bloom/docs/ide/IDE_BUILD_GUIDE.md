# AI IDE Build Guide — Project Bloom

## Objective
Use an AI IDE to turn the Project Bloom specification into a production-quality iPad/iOS application.

## Recommended workflow

### 1. Create a Git repository
Create a repository such as `project-bloom` and upload this documentation pack.

### 2. Ingest before coding
Ask the AI IDE:

> Read the entire repository before writing code. Do not implement anything yet.
>
> Treat `/docs` as the product source of truth.
>
> Summarize the requirements, identify contradictions and missing specifications, and create `docs/ide/IMPLEMENTATION_GAP_REPORT.md`.
>
> Then create `docs/ide/IMPLEMENTATION_PLAN.md` covering architecture, modules, data model, AI boundaries, testing, security/privacy, and release strategy.
>
> Do not invent unresolved product decisions. Mark them as OPEN QUESTIONS.

### 3. Freeze architecture
Review the gap report and implementation plan before major coding begins.

### 4. Build vertically
Recommended order:
1. App shell and navigation
2. Local data model
3. Dashboard
4. Homework/notes/worksheets
5. Scheduler
6. Revision planner
7. Hobby hub
8. Journal/mood
9. Rewards
10. AI companion
11. Parent view
12. Notifications
13. Sync/backend
14. Testing and polish

### 5. Use small agent tasks
Each task should have one objective, explicit scope, acceptance criteria, and tests.

## iOS strategy
Preferred client:
- SwiftUI
- Swift Concurrency
- Appropriate local persistence
- Accessibility-first UI
- iPad layouts/multitasking
- Apple Pencil as later enhancement

Do not finalize a backend, AI provider, authentication provider, or cloud database until the architecture specification is complete.

## Cloud-agent caution
AI Cloud agents can work in isolated development environments and can be managed from their respective companion apps. Do not assume a generic hosted cloud VM is equivalent to an Apple macOS/Xcode/App Store signing environment. Validate final archive, signing, provisioning, TestFlight, and App Store workflows in an Apple-supported macOS/Xcode environment or an explicitly configured CI system.

## Definition of done
A feature needs:
- Requirement reference
- UI implementation
- Loading/empty/error/success states
- Accessibility review
- Tests where applicable
- Documentation update
- No known critical bugs

## Agent rule
If a requirement is ambiguous, do not invent a product decision. Create an OPEN QUESTION and ask for clarification.
