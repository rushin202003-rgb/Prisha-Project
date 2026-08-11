import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import '../domain/models/sync_mutation.dart';
import '../data/services/cloud_sync_service.dart';

/// Manages offline behavior and network connectivity states.
class OfflineManager extends ChangeNotifier {
  final Isar isar;
  final SyncService syncService;
  bool _isOffline = false;

  OfflineManager({required this.isar, required this.syncService});

  bool get isOffline => _isOffline;

  void setOfflineState(bool offline) {
    if (_isOffline != offline) {
      _isOffline = offline;
      notifyListeners();

      if (!_isOffline) {
        _processOfflineQueue();
      }
    }
  }

  Future<void> queueMutation(String action, String payload) async {
    final mutation = SyncMutation.create(
      action: action,
      payload: payload,
      timestamp: DateTime.now(),
    );

    await isar.writeTxn(() async {
      await isar.syncMutations.put(mutation);
    });
    
    if (!_isOffline) {
      await _processOfflineQueue();
    }
  }

  Future<void> _processOfflineQueue() async {
    // Read all queued mutations
    final pendingMutations = await isar.syncMutations.where().sortByTimestamp().findAll();
    
    if (pendingMutations.isEmpty) return;

    for (var mutation in pendingMutations) {
      final success = await syncService.pushMutation(mutation);
      if (success) {
        await isar.writeTxn(() async {
          await isar.syncMutations.delete(mutation.isarId);
        });
      } else {
        // Stop sync on failure (wait for next network switch or retry event)
        break;
      }
    }
  }
}
