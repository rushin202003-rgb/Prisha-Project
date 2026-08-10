# PRD-007 — Functional Feature Requirements (Part 4)

**Project:** Project Bloom  
**Version:** 1.0.0  
**Status:** Draft

## Purpose

This document completes the remaining Version 1 functional-feature requirements for Project Bloom.

It defines:
- F-011 — Rewards & Bloom Garden
- F-012 — Parent/Guardian Dashboard
- F-013 — Notifications & Reminders
- F-014 — Settings & Personalisation

---

# F-011 — Rewards & Bloom Garden

## Objective
Make progress feel rewarding without turning studying into a competition.

Project Bloom uses a gentle **Bloom Garden** metaphor where learning, hobbies, achievements, and positive habits help the student's personal garden grow.

## Reward principles
Rewards encourage effort, consistency, learning, creativity, healthy routines, and exploration. They must never pressure the student to study excessively.

## Reward types

### Growth Points
Possible activities:
- Homework completion
- Revision sessions
- Worksheet completion
- Subject practice
- Reading
- Hobby sessions
- Personal goals

### Garden Items
Examples:
- Flowers
- Trees
- Butterflies
- Birds
- Garden decorations
- Travel-themed objects
- Seasonal decorations

### Achievements
Examples:
- First Bloom
- Curious Explorer
- Hobby Hero
- Revision Ready
- Bookworm
- Creative Spark

Rewards should not be based exclusively on academic performance.

## Streaks
Possible streaks include study consistency, reading, hobbies, reflection, and personal goals.

A missed day must not create shame or guilt.

## Garden personalisation
Students may choose garden themes, decorations, seasonal elements, backgrounds, and avatar representation.

Potential themes:
- Garden
- Travel
- Rainbow
- Night Garden
- Tropical
- Winter

## Acceptance criteria
- Rewards are positive.
- Academic marks are not the sole basis for rewards.
- Missing a day does not create guilt.
- Students can customise the garden.
- Rewards are accessible and optional.

---

# F-012 — Parent/Guardian Dashboard

## Objective
Give parents useful visibility without turning Project Bloom into a surveillance tool.

## Parent dashboard information

### Academic progress
- Homework completion
- Worksheet completion
- Revision progress
- Upcoming exams
- Study consistency

### Routine
- Planned study time
- Completed study sessions
- Hobby participation
- General routine consistency

### Achievements
- Badges
- Milestones
- Goals achieved

## Private student information
Private content should remain private by default.

Examples:
- Journal entries
- Private reflections
- Personal AI conversations
- Detailed mood diary content

If a future feature allows sharing, the student should understand what is being shared.

## Parent notifications
Possible notifications:
- Upcoming exam
- Major overdue school work
- Important schedule changes
- Achievement milestones

## Parent controls
Parents may configure reminder preferences, study-time boundaries, quiet hours, school schedule, exam dates, and family commitments.

Parent controls must not override protected wellbeing requirements.

## Acceptance criteria
- Parent sees useful progress information.
- Private student content remains private by default.
- Parents can configure appropriate preferences.
- Dashboard does not encourage excessive monitoring.

---

# F-013 — Notifications & Reminders

## Objective
Help students remember important tasks without becoming annoying.

## Notification categories
- Gentle reminders
- Strong reminders
- Achievements
- Exams
- Hobby reminders

Examples:
- “Maths revision is coming up soon. 🌸”
- “Your Science worksheet is due today. Let’s get it done! 💪”
- “You completed your revision goal! 🌟”

## Controls
Students/guardians can configure:
- Notification type
- Reminder strength
- Quiet hours
- Frequency
- Subjects
- Homework reminders
- Hobby reminders

## Smart notification logic
If the student is already busy, avoid sending many separate notifications. Combine related reminders into one useful summary.

Example:
> You have Maths revision and a worksheet remaining today. Want me to help rearrange your evening?

## Safety
Avoid constant notifications, guilt-based messages, fear-based exam reminders, or messages encouraging late-night studying.

## Acceptance criteria
- Notifications are configurable.
- Quiet hours are respected.
- Notifications do not become spam.
- Messages are age-appropriate.

---

# F-014 — Settings & Personalisation

## Objective
Allow students and guardians to personalise Project Bloom without making settings complicated.

## Student settings

### Profile
- Name
- Grade
- School board
- Subjects
- Profile avatar

### Appearance
Preferred visual direction:
- Pastel pink
- Lavender
- Mint
- Rainbow pastel
- Travel
- Garden
- Mixed theme

## AI preferences
Students can choose:
- Teaching mode
- Explanation length
- Language preference
- Reminder style

The AI should ask which teaching mode the student prefers when appropriate.

## Language
Initial learning experience:
- English
- Hindi

## Schedule preferences
Configurable:
- School hours
- Homework time
- Study availability
- Play time
- Hobby time
- Family time
- Preferred breaks

Known school schedule:
**7:00 AM – 2:00 PM**

## Play time
Play-time preferences must remain editable because exact timing can vary.

Current known preference:
- Weekdays: approximately 9:30 PM–10:30/11:00 PM
- Weekends: approximately 9:30 PM–12:00 AM

The scheduler must distinguish the intended time of day rather than assuming.

## Hobbies
Students can:
- Add hobbies
- Remove hobbies
- Select today's hobbies
- Set hobby goals
- Schedule hobby time

Current interests:
- Drawing
- Dancing
- Music
- Storybooks
- Crafts
- Badminton
- Puzzles
- Travel planning
- Games
- Knitting/crochet

## Life Dashboard
The app should support:
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

## Login and security
Potential options:
- Device authentication
- PIN
- Password
- Apple Sign-In

The final authentication architecture will be determined during engineering architecture.

## Account roles
- Student — full student experience
- Parent/Guardian — restricted progress dashboard
- Teacher — future scope

## Data and privacy controls
Users should eventually be able to:
- Export data
- Delete account
- Manage permissions
- Review connected services
- Control notification preferences

## Accessibility
Support appropriate iOS accessibility features including:
- Dynamic Type
- VoiceOver
- Reduced Motion
- Sufficient contrast
- Touch-friendly controls

Colour must never be the only way information is communicated.

## Acceptance criteria
- Settings are understandable to a middle-school student.
- Important controls are easy to find.
- Personalisation does not require technical knowledge.
- Accessibility settings are respected.
- Student and parent permissions are separated.

---

# Feature Dependency Map

```text
Dashboard
   │
   ├── Scheduler
   │     ├── Homework
   │     ├── Worksheets
   │     ├── Revision
   │     ├── Hobbies
   │     └── Play Time
   │
   ├── AI Companion
   │     └── Major modules
   │
   ├── Rewards
   │     └── Completed Activities
   │
   ├── Notifications
   │     └── Tasks + Exams + Goals
   │
   └── Parent Dashboard
         └── Progress Data
```

# Version 1 Priority

## Must Have
- Dashboard
- Scheduler
- Homework
- Worksheets
- Notes
- Revision Planner
- Exam Countdown
- AI Companion
- Hobby Hub
- Basic Rewards
- Notifications
- Student Settings

## Should Have
- Parent Dashboard
- Journal
- Mood Diary
- Garden customisation
- Advanced AI teaching modes

## Could Have
- Apple Pencil handwriting recognition
- Voice journaling
- OCR
- Advanced travel planning
- Teacher portal
- Collaborative learning

# Definition of Functional Completeness

PRD-007 is functionally complete when:
1. Every Must-Have feature has requirements.
2. Dependencies are identified.
3. User journeys are mapped.
4. Acceptance criteria exist.
5. Privacy requirements are identified.
6. Accessibility requirements are identified.
7. Future enhancements are separated from Version 1.

# Summary

PRD-007 now defines the current Version 1 feature catalogue.

Project Bloom is a Student Life Dashboard combining:

**Study + AI Learning + Planning + Hobbies + Play + Goals + Creativity + Reflection + Rewards + Family Visibility**

while keeping the student in control.
