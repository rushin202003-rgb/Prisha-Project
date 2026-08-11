import 'package:isar/isar.dart';

part 'journal.g.dart';

enum MoodValue {
  great,
  good,
  okay,
  bad,
  terrible,
}

@collection
class MoodEntry {
  Id isarId = Isar.autoIncrement;

  @Index(unique: true)
  final String id;
  
  final String studentId;
  final DateTime timestamp;
  
  @enumerated
  final MoodValue mood;
  
  final String? note;

  const MoodEntry({
    required this.id,
    required this.studentId,
    required this.timestamp,
    required this.mood,
    this.note,
  });
}

@collection
class JournalEntry {
  Id isarId = Isar.autoIncrement;

  @Index(unique: true)
  final String id;
  
  final String studentId;
  final DateTime date;
  final String content;

  const JournalEntry({
    required this.id,
    required this.studentId,
    required this.date,
    required this.content,
  });
}
