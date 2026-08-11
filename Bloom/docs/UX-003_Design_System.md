# UX-003 — Design System & Layout Rules

**Project:** Project Bloom  
**Version:** 1.0.0  
**Status:** Approved

## 1. Brand & Vibe
Project Bloom must feel playful, calming, and personal—never stressful or strictly corporate.

## 2. Color Palette
- **Primary Accent:** Pastel Pink (`#FF6E91` / Colors.pinkAccent)
- **Secondary Accent:** Lavender/Deep Purple (`#7C4DFF` / Colors.deepPurpleAccent)
- **Backgrounds:** Soft pastel tints (e.g., `Colors.purple[50]`, `Colors.pink[50]`)
- **Semantic Success:** Mint Green (for completed tasks/achievements)
- **Semantic Warning:** Soft Orange/Yellow (avoid harsh reds to prevent anxiety)

## 3. Typography
- **Font Family:** Rounded, modern sans-serif (e.g., Nunito or Quicksand via Google Fonts).
- **Hierarchy:**
  - `Display`: Large, playful headers for celebrations.
  - `Headline`: Section titles on the dashboard.
  - `Body`: Clean, highly legible text for reading assignments and AI chat.
- **Dynamic Type:** All text MUST respect system accessibility scaling (no hardcoded font sizes without scaling factors).

## 4. Responsive Layout Rules (Cross-Platform)

### Mobile (Compact Width)
- Bottom Navigation Bar.
- Single-column lists (Cards span full width minus padding).
- Modals slide up from the bottom.

### Tablet / iPad (Medium/Expanded Width)
- Navigation Rail on the left (or persistent Drawer).
- Multi-column grid layouts for Dashboard tasks and Hobbies.
- Side-by-side master/detail views for the `Learn` tab (Subject list on the left, AI Chat / Content on the right).
- Modals can appear as centered dialogs with a backdrop blur, rather than fullscreen takeovers.
