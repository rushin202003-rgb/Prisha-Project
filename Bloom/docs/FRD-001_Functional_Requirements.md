# FRD-001 — Functional Requirements Document

**Project:** Project Bloom  
**Document ID:** FRD-001  
**Version:** 1.0.0  
**Status:** Draft  
**Platform:** iPad / iOS

## 1. Purpose

This document translates the BRD and PRD into detailed, testable functional behaviour for Project Bloom.

## 2. Functional Areas

1. Onboarding and profile
2. Dashboard
3. Subjects and syllabus
4. Homework and notes
5. Worksheets
6. Exam and revision planning
7. Adaptive scheduler
8. AI companion
9. Hobbies and play
10. Life Dashboard
11. Rewards and Bloom Garden
12. Notifications
13. Parent/Guardian view
14. Settings and personalisation
15. Privacy and data controls

## 3. FR-001 — Onboarding

The application shall allow a student to:
- Create or initialise a student profile.
- Enter grade and board.
- Add subjects.
- Add school hours.
- Add known examination dates.
- Add hobbies.
- Configure reminder preferences.
- Select visual preferences.
- Select AI teaching preferences.

The system shall allow incomplete information because the student's syllabus may arrive progressively.

## 4. FR-002 — Dashboard

The dashboard shall show:
- Today's date.
- Today's schedule.
- Homework.
- Notes to complete.
- Worksheets.
- Revision tasks.
- Upcoming exams.
- Hobby/play blocks.
- Progress.
- Relevant reminders.
- AI assistant entry point.

The dashboard shall prioritise the most important tasks without overwhelming the student.

## 5. FR-003 — Subjects and Syllabus

The system shall support:
- Multiple subjects.
- Chapters/topics per subject.
- Chapter status.
- Completed work.
- Pending work.
- Revision status.

The student shall be able to add syllabus information later.

Adding new syllabus items shall trigger schedule recalculation when required.

## 6. FR-004 — Homework and Notes

The system shall allow the student to:
- Add homework.
- Record due dates.
- Assign subjects.
- Estimate task duration.
- Mark tasks complete.
- Record note-making tasks.
- Move unfinished tasks.

The system shall reserve approximately 30–40 minutes for daily school-note completion when configured.

## 7. FR-005 — Worksheets

The system shall allow worksheet uploads where supported.

The application shall:
- Store worksheet metadata.
- Associate worksheets with subjects.
- Allow the student to ask the AI for help.
- Track worksheet completion.

AI assistance should explain solutions rather than simply encourage copying.

## 8. FR-006 — Exams and Revision

The system shall allow:
- Exam dates.
- Exam subjects.
- Subject order.
- Revision topics.
- Revision sessions.

The scheduler shall protect the final 12-day revision period according to the product planning rule.

Completed study should not be scheduled again unnecessarily unless the student requests further practice.

## 9. FR-007 — Adaptive Scheduler

The scheduler shall consider:
- School hours.
- Homework.
- Notes.
- Worksheets.
- Revision.
- Hobbies.
- Play.
- Breaks.
- User availability.
- Exam proximity.
- Task duration.
- Priority.

When circumstances change, the system shall be able to generate 2–3 schedule alternatives.

Example trigger:
- Student says they are sleepy.
- Student reports being busy.
- A task takes longer than expected.

The system shall explain important trade-offs before the student chooses an alternative.

## 10. FR-008 — AI Companion

The AI shall support:
- Chapter explanations.
- Doubt solving.
- Quizzes.
- Stories.
- Study encouragement.
- Schedule assistance.
- Revision assistance.
- Achievement celebration.

Teaching modes may include:
- Teacher
- Story
- Visual
- Quiz
- Game
- Surprise Me

The AI should ask the student which teaching approach they prefer when appropriate.

The AI shall use age-appropriate language and avoid pretending to be a real person or celebrity.

## 11. FR-009 — Hobbies and Play

The student shall be able to select hobbies for a particular day.

Known hobbies include:
- Drawing
- Dancing
- Music
- Reading storybooks
- Crafts
- Badminton
- Puzzles
- Travel planning
- Games
- Knitting/crochet

The scheduler shall treat selected hobbies as real calendar commitments.

Play time shall be configurable rather than hard-coded.

## 12. FR-010 — Life Dashboard

The system shall support:
- Travel wish list
- Books to read
- Music to learn
- Badminton goals
- Craft ideas
- Birthday countdown
- Festivals
- Personal goals
- Achievements
- Journal
- Mood diary

## 13. FR-011 — Rewards and Bloom Garden

The system shall award positive progress for meaningful activities.

Rewards may include:
- Growth points
- Garden items
- Badges
- Milestones

The system shall not require perfect streaks.

## 14. FR-012 — Notifications

The system shall support:
- Gentle reminders.
- Strong reminders.
- Homework reminders.
- Exam reminders.
- Hobby reminders.
- Achievement notifications.

The student/guardian shall be able to configure quiet hours and notification preferences.

The system should batch related notifications when possible.

## 15. FR-013 — Parent/Guardian View

The parent view shall provide:
- Homework progress.
- Revision progress.
- Upcoming exams.
- General routine progress.
- Achievements.

Private journals and private AI conversations shall not be exposed by default.

## 16. FR-014 — Settings

Settings shall include:
- Profile
- Subjects
- Schedule
- Hobbies
- Notifications
- Appearance
- AI preferences
- Privacy
- Accessibility
- Account controls

## 17. FR-015 — Data Changes

When a student adds or changes:
- Syllabus
- Exam date
- Homework
- Availability
- Hobby
- Play time

the system shall identify whether the existing schedule is affected.

The application shall preserve completed work.

## 18. FR-016 — Error Handling

If the AI or scheduler cannot confidently produce a plan, the application shall:
- Explain the limitation simply.
- Ask for the minimum missing information.
- Avoid inventing syllabus or school information.

## 19. FR-017 — Accessibility

The application shall support relevant iOS accessibility capabilities including:
- VoiceOver
- Dynamic Type
- Reduced Motion
- Accessible labels
- Adequate touch targets
- Non-colour-only status indicators

## 20. Functional Acceptance Principles

A feature is acceptable only when:
- Its normal flow works.
- Its error states are handled.
- Relevant data is persisted.
- User changes are reflected correctly.
- It does not silently destroy user data.
- It respects student/guardian permissions.

## 21. Traceability

FRD requirements should trace back to:
- BRD business requirements.
- PRD feature requirements.

Engineering tasks should trace forward from FRD requirements.

---

**End of FRD-001**
