import 'dart:developer' as developer;
import '../../domain/models/sync_mutation.dart';

abstract class SyncService {
  Future<bool> pushMutation(SyncMutation mutation);
}

class MockCloudSyncService implements SyncService {
  @override
  Future<bool> pushMutation(SyncMutation mutation) async {
    developer.log('Syncing mutation to cloud: ${mutation.action} with payload: ${mutation.payload}');
    
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 800));

    // Simulate successful sync (90% success rate to demonstrate retries if needed)
    return true; 
  }
}
