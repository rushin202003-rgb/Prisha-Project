import 'package:isar/isar.dart';

part 'subject.g.dart';

enum SyllabusStatus {
  notStarted,
  learning,
  completed,
  needsRevision,
}

@collection
class Subject {
  Id isarId = Isar.autoIncrement;

  @Index(unique: true)
  final String id;
  
  final String studentId;
  final String name;
  final String colorHex;
  final bool active;

  const Subject({
    required this.id,
    required this.studentId,
    required this.name,
    this.colorHex = '#9C27B0',
    this.active = true,
  });
}

@collection
class SyllabusItem {
  Id isarId = Isar.autoIncrement;

  @Index(unique: true)
  final String id;
  
  final String subjectId;
  final String title;
  
  @enumerated
  final SyllabusStatus status;
  
  final int estimatedMinutes;

  const SyllabusItem({
    required this.id,
    required this.subjectId,
    required this.title,
    this.status = SyllabusStatus.notStarted,
    this.estimatedMinutes = 60,
  });
}
