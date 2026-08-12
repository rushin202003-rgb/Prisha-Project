import 'package:isar/isar.dart';
import 'journal.dart';

part 'life_dashboard.g.dart';

@collection
class Goal {
  Id isarId = Isar.autoIncrement;

  @Index(unique: true)
  final String id;

  final String studentId;
  final String title;
  final bool isCompleted;

  Goal({
    required this.id,
    required this.studentId,
    required this.title,
    this.isCompleted = false,
  });
}

@collection
class Achievement {
  Id isarId = Isar.autoIncrement;

  @Index(unique: true)
  final String id;

  final String studentId;
  final String title;
  final String description;
  final DateTime dateUnlocked;

  Achievement({
    required this.id,
    required this.studentId,
    required this.title,
    required this.description,
    required this.dateUnlocked,
  });
}

@collection
class Book {
  Id isarId = Isar.autoIncrement;

  @Index(unique: true)
  final String id;

  final String studentId;
  final String title;
  final String author;
  final bool isRead;

  Book({
    required this.id,
    required this.studentId,
    required this.title,
    required this.author,
    this.isRead = false,
  });
}

@collection
class MusicItem {
  Id isarId = Isar.autoIncrement;

  @Index(unique: true)
  final String id;

  final String title;
  final String artist;

  MusicItem({
    required this.id,
    required this.title,
    required this.artist,
  });
}

@collection
class TravelWish {
  Id isarId = Isar.autoIncrement;

  @Index(unique: true)
  final String id;

  final String destination;

  TravelWish({
    required this.id,
    required this.destination,
  });
}

@collection
class CraftIdea {
  Id isarId = Isar.autoIncrement;

  @Index(unique: true)
  final String id;

  final String idea;

  CraftIdea({
    required this.id,
    required this.idea,
  });
}

// Retaining this class for legacy dashboard mapping if needed
class LifeDashboard {
  final String studentId;
  final List<JournalEntry> journals;
  final List<String> hobbies;
  final List<Goal> goals;

  LifeDashboard({
    required this.studentId,
    required this.journals,
    required this.hobbies,
    required this.goals,
  });
}
