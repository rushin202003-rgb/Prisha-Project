import 'package:isar/isar.dart';

part 'task.g.dart';

enum TaskType {
  homework,
  notes,
  worksheet,
  study,
  revision,
  practice,
  hobby,
}

enum TaskPriority {
  high,
  medium,
  low,
}

enum TaskStatus {
  planned,
  inProgress,
  completed,
  skipped,
  cancelled,
}

@collection
class Task {
  Id isarId = Isar.autoIncrement;

  @Index(unique: true)
  final String id;
  
  final String studentId;
  final String? subjectId;
  
  @enumerated
  final TaskType type;
  
  final String title;
  final DateTime? dueAt;
  final int estimatedMinutes;
  
  @enumerated
  final TaskPriority priority;
  
  @enumerated
  final TaskStatus status;

  Task({
    required this.id,
    required this.studentId,
    this.subjectId,
    required this.type,
    required this.title,
    this.dueAt,
    this.estimatedMinutes = 30,
    this.priority = TaskPriority.medium,
    this.status = TaskStatus.planned,
  });

  Task copyWith({
    String? id,
    String? studentId,
    String? subjectId,
    TaskType? type,
    String? title,
    DateTime? dueAt,
    int? estimatedMinutes,
    TaskStatus? status,
  }) {
    return Task(
      id: id ?? this.id,
      studentId: studentId ?? this.studentId,
      subjectId: subjectId ?? this.subjectId,
      type: type ?? this.type,
      title: title ?? this.title,
      dueAt: dueAt ?? this.dueAt,
      estimatedMinutes: estimatedMinutes ?? this.estimatedMinutes,
      status: status ?? this.status,
    );
  }
}
