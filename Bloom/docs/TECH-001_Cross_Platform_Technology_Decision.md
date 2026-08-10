# TECH-001 — Cross-Platform Technology Decision

**Project:** Project Bloom  
**Version:** 1.0.0  
**Status:** Proposed Decision

## 1. Platform Requirement

Project Bloom must support:
- iOS / iPadOS
- Android phones and tablets
- macOS
- Windows
- Web browsers

The product must not be architected as iOS-only.

## 2. Recommended Direction

Flutter is the initial recommended technology candidate because it can target mobile, desktop, and web from a shared application codebase.

This is not an irreversible decision. Before implementation, Cursor must validate Flutter against:
- iOS and Android capabilities
- Desktop and web requirements
- Accessibility
- Local persistence and sync
- Notifications
- File uploads
- Authentication
- Performance
- AI integration
- Maintainability

## 3. Alternatives

Cursor should briefly evaluate:
- Flutter
- React Native plus web/desktop strategy
- .NET MAUI plus web strategy

The final choice must be documented with reasons and trade-offs.

## 4. Core Principle

Use one shared product/domain model and shared backend APIs rather than separate products for each platform.

## 5. Platform Experience

- **iPad:** high-priority tablet experience
- **iPhone:** responsive compact experience
- **Android:** responsive phone/tablet experience
- **Desktop:** mouse, keyboard, large-screen, and window-resizing support
- **Web:** responsive browser experience

## 6. Decision Gate

Do not begin large-scale feature development until the technology choice is documented and approved.

---

**End of TECH-001**
