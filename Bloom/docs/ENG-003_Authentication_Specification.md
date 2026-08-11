# ENG-003 — Authentication Specification

**Project:** Project Bloom  
**Version:** 1.0.0  
**Status:** Approved

## 1. Objective
Define how users securely access Project Bloom while maintaining strict boundaries between Student and Parent data.

## 2. Initial Onboarding (The Guardian)
By law (COPPA/GDPR-K), the account must be created by an adult.
- **Primary Auth Provider:** Apple Sign-In (Mandatory for iOS App Store approval).
- **Secondary Providers:** Google Sign-In, Email/Password.

## 3. The Local Device Boundary
Once the parent logs into the iPad/Tablet, the device is considered "trusted."
- The app defaults to the **Student View** upon launch.
- The student does NOT need a password to access their daily tasks, AI companion, or journal.

## 4. The Parent Gateway
To access the Parent Dashboard (analytics, settings, and restrictions), the app requires a local step-up authentication.
- **Implementation:** A 4-digit PIN set during onboarding, OR biometric fallback (FaceID/TouchID).
- **Why?** This prevents the student from altering their own screen-time limits or deleting tasks without permission.

## 5. Token Management
- The app uses standard JWT (JSON Web Tokens) managed by the chosen auth SDK.
- Tokens must be refreshed silently in the background.
- If the token expires entirely, the app remains in "Offline Mode" until the parent re-authenticates, preventing the student from being locked out of their downloaded homework.
