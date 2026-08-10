# UX-001 — Information Architecture & Screen Specification

**Project:** Project Bloom
**Version:** 1.0.0
**Status:** Draft
**Platform:** iPad / iOS

## 1. Purpose

Define the information architecture, navigation model, screen inventory, and core interaction principles for Project Bloom.

## 2. UX Principles

1. Student-first.
2. Simple before clever.
3. Playful without becoming distracting.
4. Calm rather than productivity-pressuring.
5. Important information visible quickly.
6. Every schedule change should be understandable.
7. Accessibility is part of the design.
8. Student privacy is respected.

## 3. Primary Navigation

Recommended iPad navigation:

- Today
- Planner
- Learn
- Hobbies
- Life
- Progress

A persistent AI entry point may be available from major screens.

## 4. Today Dashboard

### Purpose
Give the student a quick view of the current day.

### Components
- Greeting
- Date
- Exam countdown
- Today's schedule
- Homework
- Notes to complete
- Worksheet tasks
- Revision
- Hobby/play blocks
- Progress summary
- AI assistant
- Quick-add button

### Primary actions
- Start task
- Complete task
- Reschedule
- Ask AI
- Add task
- View full schedule

## 5. Planner

### Views
- Today
- Tomorrow
- Week
- Exam plan

### Actions
- Create task
- Edit task
- Move task
- Mark complete
- Request AI revision
- Compare alternative schedules

## 6. Learn

### Sections
- Subjects
- Chapters
- Revision
- Practice
- AI Tutor

### Subject screen
Shows:
- Subject name
- Chapters
- Completion status
- Upcoming revision
- Practice activity

## 7. Homework & Worksheets

The student can:
- Add homework
- Upload worksheets
- Associate a subject
- Set due date
- Estimate duration
- Mark complete
- Ask AI for help

## 8. Hobbies

### Sections
- My hobbies
- Today's hobbies
- Hobby goals
- Ideas

The student can select which hobbies they want to pursue on a given day.

## 9. Life Dashboard

Sections:
- Travel wish list
- Books
- Music
- Badminton
- Crafts
- Goals
- Birthday
- Festivals
- Journal
- Mood diary

## 10. Progress

Shows:
- Completed work
- Revision progress
- Achievements
- Bloom Garden
- Healthy consistency indicators

Avoid presenting progress as a competitive leaderboard.

## 11. Parent View

Separate parent experience.

Shows:
- Academic progress
- Upcoming exams
- Homework/revision progress
- General routine
- Achievements

Does not automatically expose:
- Private journal
- Private AI conversations
- Detailed mood diary

## 12. Settings

Sections:
- Profile
- Subjects
- Schedule
- Hobbies
- AI preferences
- Notifications
- Appearance
- Privacy
- Accessibility
- Account

## 13. Visual Direction

Preferred visual language:
- Pastel pink
- Lavender
- Mint
- Rainbow pastel
- Travel maps
- Planes
- Stamps
- Flowers
- Butterflies

The design should feel colourful and alive while preserving readability.

## 14. Responsive iPad Behaviour

The interface should take advantage of iPad space.

Recommended patterns:
- Sidebar navigation
- Split views
- Cards
- Popovers
- Sheet-based editing
- Drag-and-drop where useful

Avoid desktop-style dense tables for the student experience.

## 15. Accessibility

Support:
- VoiceOver
- Dynamic Type
- Reduced Motion
- Sufficient contrast
- Large touch targets
- Clear labels
- Non-colour-only status

## 16. Core User Flows

### Daily planning
Today → Planner → Review schedule → Start task → Complete → Progress

### Schedule change
Today → “I’m sleepy/busy” → AI asks/understands constraints → 2–3 options → Student chooses → Schedule updates

### Homework
Today → Homework → Add → Subject/due date/duration → Save → Scheduler considers task

### Worksheet
Today → Worksheet → Upload → Subject → Ask AI → Learn/solve → Mark complete

### Hobby
Hobbies → Select today's hobby → Choose duration → Scheduler places it → Complete → Progress

## 17. Empty States

Empty states should be encouraging and actionable.

Example:
> “Your day is still a blank page. Want to plan it together? 🌸”

## 18. Error States

Errors should:
- Explain what happened.
- Offer a recovery action.
- Avoid technical jargon.
- Never blame the student.

## 19. UX Acceptance Criteria

- A student can understand the Today screen quickly.
- Core tasks require minimal navigation.
- Schedule changes are visible and reversible.
- Student and parent views are clearly separated.
- Private areas are clearly identified.
- Accessibility features are supported.

---

**End of UX-001**
