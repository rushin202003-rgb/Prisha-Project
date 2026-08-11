import 'package:isar/isar.dart';
import '../../domain/models/student_profile.dart';
import '../../domain/models/subject.dart';
import '../../domain/models/task.dart';
import '../../domain/models/life_dashboard.dart';
import '../../domain/models/hobby.dart';
import '../../domain/models/journal.dart';
import '../../domain/models/parent_profile.dart';
import '../../domain/repositories/student_repository.dart';

class IsarStudentRepository implements StudentRepository {
  final Isar isar;

  IsarStudentRepository(this.isar);

  @override
  Future<StudentProfile?> getProfile(String userId) async {
    return await isar.studentProfiles.filter().userIdEqualTo(userId).findFirst();
  }

  @override
  Future<void> saveProfile(StudentProfile profile) async {
    await isar.writeTxn(() async {
      final existing = await isar.studentProfiles.filter().userIdEqualTo(profile.userId).findFirst();
      if (existing != null) {
        profile.isarId = existing.isarId;
      }
      await isar.studentProfiles.put(profile);
    });
  }

  @override
  Future<List<Subject>> getSubjects(String userId) async {
    return await isar.subjects.filter().studentIdEqualTo(userId).findAll();
  }

  @override
  Future<void> addSubject(Subject subject) async {
    await isar.writeTxn(() async {
      final existing = await isar.subjects.filter().idEqualTo(subject.id).findFirst();
      if (existing != null) {
        subject.isarId = existing.isarId;
      }
      await isar.subjects.put(subject);
    });
  }

  @override
  Future<List<SyllabusItem>> getSyllabus(String subjectId) async {
    return await isar.syllabusItems.filter().subjectIdEqualTo(subjectId).findAll();
  }

  @override
  Future<void> addSyllabusItem(SyllabusItem item) async {
    await isar.writeTxn(() async {
      final existing = await isar.syllabusItems.filter().idEqualTo(item.id).findFirst();
      if (existing != null) {
        item.isarId = existing.isarId;
      }
      await isar.syllabusItems.put(item);
    });
  }

  @override
  Future<void> updateSyllabusItem(SyllabusItem item) async {
    await isar.writeTxn(() async {
      final existing = await isar.syllabusItems.filter().idEqualTo(item.id).findFirst();
      if (existing != null) {
        item.isarId = existing.isarId;
      }
      await isar.syllabusItems.put(item);
    });
  }

  @override
  Future<List<Task>> getTasks(String userId, {DateTime? date}) async {
    var query = isar.tasks.filter().studentIdEqualTo(userId);
    
    if (date != null) {
      final start = DateTime(date.year, date.month, date.day);
      final end = start.add(const Duration(days: 1));
      query = query.dueAtBetween(start, end);
    }
    
    return await query.findAll();
  }

  @override
  Future<void> addTask(Task task) async {
    await isar.writeTxn(() async {
      final existing = await isar.tasks.filter().idEqualTo(task.id).findFirst();
      if (existing != null) {
        task.isarId = existing.isarId;
      }
      await isar.tasks.put(task);
    });
  }

  @override
  Future<void> updateTask(Task task) async {
    await isar.writeTxn(() async {
      final existing = await isar.tasks.filter().idEqualTo(task.id).findFirst();
      if (existing != null) {
        task.isarId = existing.isarId;
      }
      await isar.tasks.put(task);
    });
  }

  @override
  Future<List<Goal>> getGoals(String userId) async {
    return await isar.goals.filter().studentIdEqualTo(userId).findAll();
  }

  @override
  Future<void> addGoal(Goal goal) async {
    await isar.writeTxn(() async {
      final existing = await isar.goals.filter().idEqualTo(goal.id).findFirst();
      if (existing != null) {
        goal.isarId = existing.isarId;
      }
      await isar.goals.put(goal);
    });
  }

  @override
  Future<List<Achievement>> getAchievements(String userId) async {
    return await isar.achievements.filter().studentIdEqualTo(userId).findAll();
  }

  // --- Hobbies & Sessions ---

  @override
  Future<List<Hobby>> getHobbies(String userId) async {
    return await isar.hobbys.filter().studentIdEqualTo(userId).findAll();
  }

  @override
  Future<void> addHobby(Hobby hobby) async {
    await isar.writeTxn(() async {
      final existing = await isar.hobbys.filter().idEqualTo(hobby.id).findFirst();
      if (existing != null) {
        hobby.isarId = existing.isarId;
      }
      await isar.hobbys.put(hobby);
    });
  }

  @override
  Future<List<HobbySession>> getHobbySessions(String hobbyId) async {
    return await isar.hobbySessions.filter().hobbyIdEqualTo(hobbyId).findAll();
  }

  @override
  Future<void> logHobbySession(HobbySession session) async {
    await isar.writeTxn(() async {
      final existing = await isar.hobbySessions.filter().idEqualTo(session.id).findFirst();
      if (existing != null) {
        session.isarId = existing.isarId;
      }
      await isar.hobbySessions.put(session);
    });
  }

  // --- Journal & Mood ---

  @override
  Future<void> addJournalEntry(JournalEntry entry) async {
    await isar.writeTxn(() async {
      final existing = await isar.journalEntrys.filter().idEqualTo(entry.id).findFirst();
      if (existing != null) {
        entry.isarId = existing.isarId;
      }
      await isar.journalEntrys.put(entry);
    });
  }

  @override
  Future<void> addMoodEntry(MoodEntry entry) async {
    await isar.writeTxn(() async {
      final existing = await isar.moodEntrys.filter().idEqualTo(entry.id).findFirst();
      if (existing != null) {
        entry.isarId = existing.isarId;
      }
      await isar.moodEntrys.put(entry);
    });
  }

  // --- Parent Profile ---

  @override
  Future<ParentProfile?> getParentProfile(String id) async {
    return await isar.parentProfiles.filter().idEqualTo(id).findFirst();
  }

  @override
  Future<void> saveParentProfile(ParentProfile profile) async {
    await isar.writeTxn(() async {
      final existing = await isar.parentProfiles.filter().idEqualTo(profile.id).findFirst();
      if (existing != null) {
        profile.isarId = existing.isarId;
      }
      await isar.parentProfiles.put(profile);
    });
  }

  // --- Live Streams ---

  @override
  Stream<List<Task>> watchTasks(String userId, {DateTime? date}) {
    var query = isar.tasks.filter().studentIdEqualTo(userId);
    
    if (date != null) {
      final start = DateTime(date.year, date.month, date.day);
      final end = start.add(const Duration(days: 1));
      query = query.dueAtBetween(start, end);
    }
    
    return query.build().watch(fireImmediately: true);
  }

  @override
  Stream<List<Goal>> watchGoals(String userId) {
    return isar.goals.filter().studentIdEqualTo(userId).build().watch(fireImmediately: true);
  }

  @override
  Stream<List<Achievement>> watchAchievements(String userId) {
    return isar.achievements.filter().studentIdEqualTo(userId).build().watch(fireImmediately: true);
  }

  @override
  Stream<List<Hobby>> watchHobbies(String userId) {
    return isar.hobbys.filter().studentIdEqualTo(userId).build().watch(fireImmediately: true);
  }

  @override
  Stream<List<JournalEntry>> watchJournalEntries(String userId) {
    return isar.journalEntrys.filter().studentIdEqualTo(userId).build().watch(fireImmediately: true);
  }

  @override
  Stream<ParentProfile?> watchParentProfile(String id) {
    return isar.parentProfiles.filter().idEqualTo(id).build().watch(fireImmediately: true).map((list) => list.isNotEmpty ? list.first : null);
  }

  @override
  Future<void> clearAllUserData() async {
    await isar.writeTxn(() async {
      await isar.clear();
    });
  }
}
