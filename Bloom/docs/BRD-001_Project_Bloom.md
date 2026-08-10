# BRD-001 — Business Requirements Document

**Project:** Project Bloom  
**Document ID:** BRD-001  
**Version:** 1.0.0  
**Status:** Draft  
**Product Type:** AI-powered Student Life Dashboard  
**Initial Platform:** iPad / iOS  
**Initial Target:** Class 6 ICSE student

## 1. Executive Summary

Project Bloom is an AI-powered Student Life Dashboard designed to help school students organise academic responsibilities while maintaining time for hobbies, play, creativity, personal goals, reflection, and family life.

The product combines:
- Study planner
- Homework manager
- Revision planner
- AI tutor
- Exam organiser
- Hobby planner
- Personal goals dashboard
- Journal
- Achievement system
- Parent progress dashboard

The core opportunity is to create a single student-friendly environment that helps answer:

> “What should I do today, how should I learn it, and how can I still have time for the things I enjoy?”

Project Bloom is deliberately designed as a Life Dashboard, rather than only an academic productivity application.

## 2. Business/Product Vision

Project Bloom aims to become a trusted digital companion for students.

**Vision:** Help students learn with curiosity, organise with confidence, grow through healthy habits, and enjoy childhood.

## 3. Business Problem

Students commonly use separate systems for homework, notes, worksheets, exam preparation, calendars, reminders, learning resources, hobbies, personal goals, and journaling.

These disconnected systems create unnecessary complexity.

Project Bloom brings these areas together into one adaptive dashboard.

## 4. Business Opportunity

The product treats the student's day as a complete system rather than treating academic study as the only important activity.

Core differentiator:

> Balanced intelligence rather than productivity at all costs.

The scheduler should ask what is realistically possible today while protecting important parts of the student's life.

## 5. Product Objectives

1. Academic organisation
2. Adaptive planning
3. Personalised learning
4. Protect balance
5. Encourage independence
6. Extend beyond school

The product should protect sleep, meals, play, hobbies, family time, and breaks.

## 6. Target Users

### Primary User — Student

Initial representative:
- Class 6
- ICSE
- iPad user
- Creative and energetic
- Enjoys travel and fun
- Enjoys drawing, dancing, music, reading, crafts, badminton, puzzles, games, travel planning, and knitting/crochet

### Secondary User — Parent/Guardian

Needs meaningful progress visibility, upcoming exam information, homework/revision status, general routine visibility, and achievement information.

Parents should not automatically receive private student content.

### Future Users

Teachers and schools are future scope.

## 7. Stakeholder Requirements

### Student
Needs easy navigation, attractive dashboard, personalisation, flexible schedules, AI help, hobbies, rewards, and privacy.

### Parent/Guardian
Needs trustworthy progress information, appropriate controls, notifications, and visibility without excessive surveillance.

### Product Owner
Needs a maintainable product, clear requirements, measurable outcomes, safe AI, and extensible architecture.

### Engineering Team
Needs clear requirements, stable architecture, testable business logic, defined APIs, and clear data ownership.

## 8. Core Business Requirements

- **BR-001:** Student-first design
- **BR-002:** Balanced planning
- **BR-003:** Adaptive schedules
- **BR-004:** Multiple schedule choices
- **BR-005:** Personalisation
- **BR-006:** AI learning assistance
- **BR-007:** Parent visibility
- **BR-008:** Life dashboard
- **BR-009:** Offline resilience where feasible
- **BR-010:** iPad-first experience

## 9. Version 1 Scope

### In Scope
- Dashboard
- Subjects
- Homework
- Notes
- Worksheets
- Exams
- Revision
- Study scheduling
- AI companion
- Chapter explanations
- Questions/doubts
- Teaching modes
- Schedule suggestions
- Hobbies
- Play time
- Personal goals
- Books
- Music
- Travel wish list
- Achievements
- Journal
- Mood diary
- Rewards
- Bloom Garden
- Notifications
- Parent dashboard
- Student settings

### Out of Scope for Version 1
- Full teacher platform
- School administration platform
- School-wide LMS
- Social networking
- Public student profiles
- Student-to-student messaging
- Competitive public leaderboards
- Advertising
- In-app purchases aimed at children
- Unnecessary social engagement features

## 10. Product Differentiation

1. Life-first scheduling
2. Adaptive AI
3. Multiple choices
4. Hobbies as first-class activities
5. Long-term Life Dashboard

## 11. Success Criteria

Students should be able to:
- Understand their day quickly
- Complete important academic work
- Prepare for examinations earlier
- Adjust schedules when necessary
- Continue hobbies during school periods
- Use AI to understand difficult concepts
- Track meaningful progress
- Feel encouraged rather than pressured

## 12. Product KPIs

### Academic organisation
- Homework completion rate
- Worksheet completion rate
- Revision completion rate
- On-time task completion

### Planning
- Plans accepted
- Plans modified
- Plans completed
- Successful schedule revisions

### Learning
- AI learning sessions
- Practice sessions
- Quiz completion
- Confidence changes

### Balance
- Hobby sessions
- Play-time preservation
- Break compliance
- Healthy schedule adjustments

### Engagement
- Weekly active students
- Returning students
- Achievement participation

The product should not optimise primarily for screen time, notification count, or number of AI messages.

## 13. Business Constraints

- Product is intended for school students.
- Language must be age-appropriate.
- AI interactions must be safe.
- Privacy is important.
- iPad is the initial platform.
- School schedules, syllabi, homework loads, examination dates, subjects, and learning speeds vary.

## 14. Key Assumptions

- Students may enter or receive school schedules.
- Syllabus information may arrive progressively.
- Examination dates may be entered manually.
- Students may upload worksheets.
- Parents may optionally configure certain preferences.
- Some AI capabilities require internet connectivity.
- Some core planning functionality should remain available offline where feasible.
- Product begins as an iPad-first application.

## 15. Progressive Syllabus Model

The product must support:

**Partial syllabus → Updated syllabus → Final syllabus**

When new chapters are added:
1. Import new syllabus information.
2. Identify newly added material.
3. Recalculate the study plan.
4. Preserve completed work.
5. Recalculate remaining workload.
6. Protect the revision period.
7. Present revised schedules.

## 16. Examination Planning

For the initial planning model, the final 12 days before the examination period are reserved primarily for revision.

The scheduling engine must calculate the revision boundary from the examination dates. Exact algorithms belong in the FRD/scheduling specification.

## 17. Change Management

When requirements change:
1. Add or update the relevant data.
2. Recalculate workload.
3. Identify conflicts.
4. Generate schedule alternatives.
5. Ask the student to choose where appropriate.

The system must not silently destroy previously created schedules.

## 18. AI Business Requirements

The AI must:
- Explain concepts
- Adapt explanations
- Encourage
- Help plan
- Help revise
- Answer doubts
- Tell educational stories
- Generate quizzes
- Support reflection

The AI should not:
- Shame students
- Compare students
- Encourage unhealthy study patterns
- Pretend certainty when uncertain
- Replace parents or teachers
- Encourage excessive screen use

## 19. AI Personality

The AI should feel:
- Warm
- Energetic
- Friendly
- Playful
- Encouraging
- Supportive

A preferred pop-culture-inspired energy may guide tone, but the AI must not impersonate or claim to be a real celebrity.

## 20. Schedule Adaptation

When the student says they are sleepy or busy, the system should:
1. Understand available time.
2. Identify unfinished tasks.
3. Protect important commitments.
4. Generate 2–3 reasonable alternatives.
5. Explain trade-offs.
6. Let the student choose.

## 21. Reward Rules

Rewards should:
- Celebrate effort
- Celebrate learning
- Include hobbies
- Include personal goals
- Avoid unhealthy competition
- Avoid guilt

Perfect streaks should not be required.

## 22. Parent Rules

Parents should receive:
- Progress
- Important upcoming academic events
- Achievements
- General routine information

Parents should not automatically receive:
- Private journals
- Private AI conversations
- Detailed personal reflections

## 23. Privacy

Privacy is a product requirement.

Potentially sensitive areas include:
- Mood information
- Journal entries
- AI conversations
- Student schedules
- School information

These areas require explicit privacy decisions before production release.

## 24. Security

Production systems must appropriately protect:
- Accounts
- Student data
- Parent accounts
- AI conversations
- Journal entries
- Personal goals
- Uploaded documents

Secrets and credentials must never be stored directly in source code.

## 25. Accessibility

The product should support:
- VoiceOver
- Dynamic Type
- Reduced Motion
- Sufficient contrast
- Large touch targets
- Clear text
- Non-colour-only status indicators

## 26. Product Experience

The product should feel:

**Colourful + calm + intelligent + playful + organised**

Visual direction:
- Pastel pink
- Lavender
- Mint
- Rainbow pastel
- Travel motifs
- Maps
- Planes
- Stamps
- Flowers
- Butterflies

## 27. Risk Register

| Risk | Impact | Mitigation |
|---|---|---|
| AI gives incorrect academic information | High | Verification, confidence indicators, escalation |
| AI becomes overly controlling | High | Choice-based scheduling |
| Too many notifications | Medium | Controls and smart batching |
| Parent surveillance concerns | High | Privacy-by-default |
| Student loses interest | Medium | Personalisation and meaningful rewards |
| Scheduling becomes too complicated | High | Simple dashboard + schedule options |
| Incomplete syllabus | High | Progressive syllabus model |
| Excessive screen time | High | Encourage offline activities |
| Product becomes too large | High | Strict Version 1 scope |
| iOS technical limitations | Medium | Early architecture validation |

## 28. Business Dependencies

Potential dependencies:
- iOS/iPadOS capabilities
- AI services
- Authentication
- Data storage
- Notification services
- Secure file handling
- Calendar/date calculations
- Cloud infrastructure

Exact providers should be selected during architecture planning.

## 29. Product Governance

Major changes should be classified as:
- Requirement change
- Design change
- Technical change
- Scope change

Major scope changes require review before implementation.

## 30. Definition of Business Success

Project Bloom succeeds if students can say:

> “I know what I need to do.”

> “I understand what I’m learning.”

> “My schedule changes when my day changes.”

> “I still have time for the things I love.”

> “I feel proud of my progress.”

Parents should be able to say:

> “I know how my child is progressing without having to constantly monitor them.”

## 31. Long-Term Direction

Project Bloom may eventually evolve into a broader student operating system for everyday life.

Potential future modules:
- Travel planning
- Reading tracker
- Music learning
- Sports goals
- Creative projects
- Personal finance education
- School collaboration
- Teacher tools
- Family planning

These must not overwhelm Version 1.

## 32. BRD Completion Criteria

The BRD is complete when:
- Business objectives are documented.
- Target users are defined.
- Stakeholders are identified.
- Scope is defined.
- Out-of-scope items are documented.
- Business requirements are traceable to product requirements.
- Risks are identified.
- Success metrics are defined.
- Constraints are documented.
- Assumptions are explicit.

## 33. Relationship to Other Documents

```text
Vision
   ↓
BRD
   ↓
PRD
   ↓
FRD
   ↓
UX Specification
   ↓
AI Specification
   ↓
System Architecture
   ↓
Engineering
   ↓
Testing
   ↓
Release
```

The BRD explains the business/product **why**.

The PRD explains the product **what**.

The FRD will explain the detailed functional **how it should behave**.

## 34. Final Product Principle

Project Bloom is not designed to create the most productive student possible.

It is designed to help create a:

**confident + organised + curious + balanced + happy learner.**

---

**End of BRD-001**
