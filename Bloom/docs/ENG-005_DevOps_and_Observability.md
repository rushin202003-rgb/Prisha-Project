# ENG-005 — DevOps & Observability

**Project:** Project Bloom  
**Version:** 1.0.0  
**Status:** Approved

## 1. CI/CD Pipeline (GitHub Actions)
Every pull request to the `main` branch must pass the following automated checks:
- **Linting:** Run `flutter analyze` with strict rules.
- **Unit Tests:** Run `flutter test` (must maintain >80% coverage on Domain logic like the `SchedulingEngine`).
- **Build (iOS):** Verify that the app compiles using `flutter build ios --no-codesign`.

For releases, a manual trigger builds the signed IPA and uploads it to TestFlight via Fastlane.

## 2. Observability & Crash Reporting
Due to the strict privacy constraints of the App Store Kids Category, standard analytics (like Google Analytics) are prohibited.
- **Crash Reporting:** We will use a privacy-first crash reporter (e.g., Sentry configured for strict PII stripping, or Firebase Crashlytics with Data Collection disabled by default until the parent explicitly opts in).
- **No Tracking:** We will NOT track individual button taps or screen times for marketing purposes.

## 3. Production Incident Plan
If the LLM provider experiences an outage:
- The `AIGateway` will catch the 5xx error.
- The UI will gracefully fallback, explaining to the student: "My brain is a bit tired right now, but you can still do your offline worksheets! 🌸"
- PagerDuty alerts are sent to the engineering team.
