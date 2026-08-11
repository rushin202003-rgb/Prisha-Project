abstract class SyncService {
  /// Initiates a full bidirectional sync with the cloud.
  Future<void> syncData();

  /// Pushes local pending changes to the cloud.
  Future<void> pushChanges();

  /// Pulls remote changes from the cloud to the local database.
  Future<void> pullChanges();
}
