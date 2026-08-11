import 'package:isar/isar.dart';

part 'companion_config.g.dart';

enum CompanionMode {
  teacher,
  friend,
}

@collection
class CompanionConfig {
  Id isarId = Isar.autoIncrement;

  @Index(unique: true)
  final String studentId;
  
  @enumerated
  final CompanionMode mode;
  
  final String? customInstructions;

  const CompanionConfig({
    required this.studentId,
    this.mode = CompanionMode.teacher,
    this.customInstructions,
  });

  CompanionConfig copyWith({
    CompanionMode? mode,
    String? customInstructions,
  }) {
    return CompanionConfig(
      studentId: studentId,
      mode: mode ?? this.mode,
      customInstructions: customInstructions ?? this.customInstructions,
    );
  }
}
