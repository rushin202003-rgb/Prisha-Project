# PROD-001 — Roadmap, Release Plan & Risk Register

**Project:** Project Bloom  
**Version:** 1.0.0  
**Status:** Approved

## 1. Product Roadmap

### Phase 1: Architecture & Foundation (Current State)
- Initial Flutter Shell and mock repositories.
- Generation of the comprehensive documentation suite.
- Basic interactive UI flows.

### Phase 2: Cloud Integration (Next Phase)
- Connect Firebase/Supabase NoSQL backend.
- Implement Apple Sign-In and local Parent Gateway PIN.
- Wire up the `AIGateway` to the Gemini API using strict structured prompts.

### Phase 3: Polish & Beta
- Extensive UI/UX polishing based on `UX-003`.
- VoiceOver and TalkBack accessibility testing.
- Launch closed TestFlight Beta (50 users).

### Phase 4: Future Scope (Post V1)
- Teacher Portal.
- Apple Pencil handwriting recognition (OCR).
- Advanced Travel Planning.

## 2. Release Plan (V1)
- **Target Platform:** iOS App Store (iPad Primary, iPhone Secondary).
- **Target Audience:** Middle school students and their parents.
- **Pricing:** Free Beta, moving to a Freemium model (Core features free, AI usage metered).

## 3. Risk Register

| Risk | Impact | Mitigation Strategy |
| :--- | :--- | :--- |
| **LLM Latency** | High | Use edge-functions or optimized models (Gemini Flash). Show engaging loading states. |
| **LLM Hallucination** | Critical | Use `response_schema` strict validation. Fallback to offline defaults if JSON parsing fails. |
| **Offline Sync Collisions** | Medium | Use strict Last-Write-Wins timestamps in the `OfflineManager`. |
| **App Store Rejection (Kids)** | High | Strictly adhere to COPPA guidelines. Ensure no PII tracking analytics are included. |
