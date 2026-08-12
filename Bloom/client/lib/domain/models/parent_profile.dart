import 'package:isar/isar.dart';

part 'parent_profile.g.dart';

@collection
class ParentProfile {
  Id isarId = Isar.autoIncrement;

  @Index(unique: true)
  final String id;

  final String displayName;
  final String email;
  final List<String> linkedStudentIds;

  // Notification Preferences
  final bool notifyOnTaskCompletion;
  final bool notifyOnMoodDrop;

  // Privacy Boundaries
  final bool canViewJournal;

  ParentProfile({
    required this.id,
    required this.displayName,
    required this.email,
    this.linkedStudentIds = const [],
    this.notifyOnTaskCompletion = true,
    this.notifyOnMoodDrop = true,
    this.canViewJournal = false, // Strictly false by default for privacy
  });
}
