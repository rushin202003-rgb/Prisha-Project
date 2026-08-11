# UX-002 — Information Architecture & Navigation Map

**Project:** Project Bloom  
**Version:** 1.0.0  
**Status:** Approved

## 1. Primary Navigation (The Shell)
The app utilizes a standard persistent Tab Bar on mobile (bottom) and a Navigation Rail on tablet/desktop (left side).

### Tabs
1. **Today (`/today`)**: The daily dashboard showing immediate tasks (Homework, Quizzes, Reading).
2. **Planner (`/planner`)**: The chronological view of the week, allowing the student to see school hours vs study time.
3. **Learn (`/learn`)**: The subject hierarchy where the student can browse topics and trigger the AI Teacher.
4. **Hobbies (`/hobbies`)**: The non-academic zone for tracking crafts, music, and extracurricular goals.
5. **Life (`/life`)**: The overarching dashboard for long-term goals, journal entries, and the Bloom Garden rewards.
6. **Progress (`/progress`)**: Analytics on completed tasks, achievements, and streaks.

## 2. Modal Flows (Full-Screen)
To prevent distractions, detailed interactive flows are pushed as full-screen Modals over the main navigation shell.

- **Task Execution Flow**:
  `Today Tab` -> `Tap Task` -> `Push Fullscreen QuizScreen or WorksheetScreen` -> `Complete` -> `Pop to Today Tab`
- **Reflection Flow**:
  `Life Tab` -> `Tap 'Open Diary'` -> `Push Fullscreen JournalScreen` -> `Save` -> `Pop to Life Tab`
- **AI Teaching Flow**:
  `Learn Tab` -> `Tap Subject` -> `Push Fullscreen ChatScreen` -> `Close` -> `Pop to Learn Tab`

## 3. Parent / Guardian View
The Parent View exists outside the primary student navigation.
It is accessed via a locked gateway (PIN/Biometric) from the Settings screen.
- **Path**: `Settings` -> `Unlock Parent Portal` -> `Parent Dashboard`
