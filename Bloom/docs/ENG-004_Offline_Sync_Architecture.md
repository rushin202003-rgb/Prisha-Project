# ENG-004 — Offline & Sync Architecture

**Project:** Project Bloom  
**Version:** 1.0.0  
**Status:** Approved

## 1. The Offline-First Mandate
Project Bloom is designed for iPads and tablets which frequently leave WiFi zones (e.g., in a car, on a plane, or at a school with blocked networks). 
**The app MUST function normally without an internet connection.**

## 2. The Local Database
All user data is mirrored to a high-speed local database on the device.
- **Recommended Tech:** Isar Database (highly optimized for Flutter).
- Reads are ALWAYS performed against the local database to guarantee 0ms latency.

## 3. The Mutation Queue (`OfflineManager`)
When a student completes a task or writes a journal entry:
1. The mutation is immediately written to the *local* database.
2. The UI updates instantly.
3. The mutation payload (e.g., `{"action": "UPDATE_TASK", "id": "123", "status": "completed"}`) is appended to a local durable queue.

## 4. The Sync Engine
When the `OfflineManager` detects an active internet connection:
1. It reads the mutation queue.
2. It attempts to push changes to the cloud database (via `SyncService`).
3. If successful, the mutation is removed from the queue.
4. If it fails (e.g., 500 error), it uses exponential backoff to retry.

## 5. Conflict Resolution
Since Bloom is typically a single-user-per-device system, complex merging is rarely needed.
- **Rule:** Last-Write-Wins based on the local device timestamp of the mutation.
