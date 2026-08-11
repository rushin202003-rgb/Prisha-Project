import 'package:isar/isar.dart';

part 'student_profile.g.dart';

@collection
class StudentProfile {
  Id isarId = Isar.autoIncrement;

  @Index(unique: true)
  final String userId;
  final String displayName;
  final String grade;
  final String board;
  final double schoolHoursPerDay;
  final String preferredTeachingMode;

  const StudentProfile({
    required this.userId,
    required this.displayName,
    required this.grade,
    required this.board,
    required this.schoolHoursPerDay,
    this.preferredTeachingMode = 'Teacher',
  });

  StudentProfile copyWith({
    String? userId,
    String? displayName,
    String? grade,
    String? board,
    double? schoolHoursPerDay,
    String? preferredTeachingMode,
  }) {
    return StudentProfile(
      userId: userId ?? this.userId,
      displayName: displayName ?? this.displayName,
      grade: grade ?? this.grade,
      board: board ?? this.board,
      schoolHoursPerDay: schoolHoursPerDay ?? this.schoolHoursPerDay,
      preferredTeachingMode: preferredTeachingMode ?? this.preferredTeachingMode,
    );
  }
}
