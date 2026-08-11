# UX-004 — Accessibility Specification

**Project:** Project Bloom  
**Version:** 1.0.0  
**Status:** Approved

## 1. Objective
Project Bloom must be usable by all students, including those with visual impairments, motor difficulties, or cognitive sensitivities.

## 2. Screen Reader Support (VoiceOver / TalkBack)
- **Semantic Wrappers:** All interactive elements (Custom buttons, Interactive Cards) must be wrapped in `Semantics` widgets (as implemented in `A11yUtils`).
- **Meaningful Labels:** Icon-only buttons MUST have a descriptive semantic label.
  - *Bad:* (No label on the back button)
  - *Good:* `label: "Go back to the previous screen"`
- **State Announcements:** Checkboxes and progress bars must announce their current state (e.g., "Maths Revision, 50% complete").

## 3. Visual Accessibility
- **Contrast Ratios:** Text must maintain a minimum contrast ratio of 4.5:1 against pastel backgrounds.
- **Color Independence:** Color must never be the sole indicator of status.
  - *Bad:* A task is red if overdue.
  - *Good:* A task is red AND has a warning icon AND text stating "Overdue".
- **Animations:** Users with "Reduce Motion" enabled at the OS level should not see bouncy or continuous animations. Micro-animations should gracefully degrade to cross-fades.

## 4. Touch Targets
- **Minimum Size:** All tappable areas must be at least 44x44 logical pixels.
- **Spacing:** Adequate padding (min 8px) must exist between adjacent buttons to prevent accidental mis-taps, which is crucial for younger students or those with motor control challenges.
