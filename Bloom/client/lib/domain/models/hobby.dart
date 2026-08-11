import 'package:isar/isar.dart';

part 'hobby.g.dart';

@collection
class Hobby {
  Id isarId = Isar.autoIncrement;

  @Index(unique: true)
  final String id;
  
  final String studentId;
  final String name;
  final String? description;
  final int targetMinutesPerWeek;

  const Hobby({
    required this.id,
    required this.studentId,
    required this.name,
    this.description,
    this.targetMinutesPerWeek = 120,
  });
}

@collection
class HobbySession {
  Id isarId = Isar.autoIncrement;

  @Index(unique: true)
  final String id;
  
  final String hobbyId;
  final DateTime date;
  final int durationMinutes;

  const HobbySession({
    required this.id,
    required this.hobbyId,
    required this.date,
    required this.durationMinutes,
  });
}
