# Project Bloom — Master Implementation Plan

## 1. Introduction
This document serves as the master implementation plan for Project Bloom, driving the transition from architecture discovery into a production-ready application.

## 2. Technology Stack
- **Frontend Framework:** Flutter (Dart) for cross-platform compatibility across iOS, iPadOS, Android, Windows, macOS, and Web.
- **State Management:** Provider / StreamBuilder (Integrated reactively).
- **Local Persistence:** Isar Database (Integrated, Offline-First).
- **Backend Sync:** Mock Sync Service (Supabase/Firebase migration pending).

## 3. Core Modules & Milestones

### Phase 1: Foundation & Shell (Completed)
- Cross-platform Flutter environment setup.
- Responsive Navigation Shell (Mobile vs Tablet/Desktop).
- In-Memory mock data repositories.

### Phase 2: Domain Implementation & Database (Completed)
- Student Profile & Subject hierarchy.
- Scheduling Engine (Revision Planner & Priority sorting).
- Life Dashboard (Hobbies, Goals, Journal).
- Complete Isar annotations for all 19 domain models.
- Hooked up `IsarStudentRepository` for offline persistence.

### Phase 3: Backend & Sync (In Progress)
- [Completed] Local durable mutation queue (`OfflineManager`) that captures user operations.
- [Completed] `MockCloudSyncService` triggers sync transactions upon network connection.
- [Pending] Remote database integration (Firebase or Supabase setup).
- [Pending] Integration of `AuthService` with OAuth/Apple Sign-In.

### Phase 4: AI Integration (In Progress)
- [Completed] Created abstract `AIGateway` and implemented a dynamic `MockAIGateway`.
- [Completed] Connected generator to `TodayScreen` to dynamically load worksheets/quizzes based on topics.
- [Pending] Connect `AIGateway` to production LLM (e.g. Gemini API).
- [Pending] Implement conversational streaming for live tutor doubts.

### Phase 5: Hardening & Release (Pending)
- Accessibility audits (VoiceOver/TalkBack).
- Local Push Notifications setup.
- App Store / TestFlight submission.

## 4. Security & Privacy Model
- **Offline-First:** All sensitive data (Journal, Mood) lives on the device by default.
- **Parental Controls:** Parents have a read-only dashboard; they cannot view private journals unless explicitly shared.
- **AI Boundaries:** The LLM does not have direct read/write access to the database. The client dictates the context string sent to the LLM.

## 5. Release Strategy
1. **Internal Alpha:** Mock-data build to test UI flows (Completed).
2. **Local Persistence Beta:** Offline database build with local disk storage (Completed).
3. **TestFlight Beta:** Live database connection with a closed group of beta students.
4. **App Store V1:** Feature-complete launch focusing on the iPad experience.
