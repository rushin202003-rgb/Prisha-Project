import 'package:isar/isar.dart';

part 'sync_mutation.g.dart';

@collection
class SyncMutation {
  Id isarId = Isar.autoIncrement;

  late String action;
  late String payload;
  late DateTime timestamp;

  SyncMutation();

  SyncMutation.create({
    required this.action,
    required this.payload,
    required this.timestamp,
  });
}
