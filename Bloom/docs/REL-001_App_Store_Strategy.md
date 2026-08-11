# REL-001 — App Store Strategy & Privacy

**Project:** Project Bloom  
**Version:** 1.0.0  
**Status:** Approved

## 1. TestFlight Beta Strategy
- **Audience:** Invite-only group of ~50 parents and students.
- **Objective:** Validate the Socratic AI teaching mode and the offline-first sync behavior.
- **Feedback Loop:** Parents submit feedback via a secure form embedded in the Parent Gateway.

## 2. App Store Submission (Kids Category)
Because Project Bloom targets minors, it MUST comply with Apple's strict Kids Category guidelines:
- **No Third-Party Analytics:** We cannot use SDKs that track user behavior across apps.
- **No External Links for Kids:** Any external links (e.g., privacy policy, support) must be locked behind the Parent Gateway.
- **Sign-In with Apple:** Mandatory for account creation.

## 3. Data Privacy & COPPA Compliance
- **Parental Consent:** The parent must explicitly consent to data collection during the initial Apple Sign-In flow.
- **Data Minimization:** Only collect the bare minimum needed for the app to function (e.g., grade level, subjects). Do not ask for the student's real full name; a nickname is preferred.

## 4. Data Retention & Deletion Policy
- **User-Initiated Deletion:** The Parent Gateway must have a clear "Delete Account and All Data" button that securely wipes all NoSQL records.
- **Dormant Accounts:** Accounts inactive for 24 months should be purged automatically to minimize data liability.
