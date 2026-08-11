import '../models/student_profile.dart';
import '../models/subject.dart';
import '../models/task.dart';
import '../models/life_dashboard.dart';
import '../models/hobby.dart';
import '../models/journal.dart';
import '../models/parent_profile.dart';

abstract class StudentRepository {
  Future<StudentProfile?> getProfile(String userId);
  Future<void> saveProfile(StudentProfile profile);

  Future<List<Subject>> getSubjects(String userId);
  Future<void> addSubject(Subject subject);

  Future<List<SyllabusItem>> getSyllabus(String subjectId);
  Future<void> addSyllabusItem(SyllabusItem item);
  Future<void> updateSyllabusItem(SyllabusItem item);

  Future<List<Task>> getTasks(String userId, {DateTime? date});
  Future<void> addTask(Task task);
  Future<void> updateTask(Task task);

  // Life Dashboard
  Future<List<Goal>> getGoals(String userId);
  Future<void> addGoal(Goal goal);
  Future<List<Achievement>> getAchievements(String userId);

  // Hobbies & Sessions
  Future<List<Hobby>> getHobbies(String userId);
  Future<void> addHobby(Hobby hobby);
  Future<List<HobbySession>> getHobbySessions(String hobbyId);
  Future<void> logHobbySession(HobbySession session);

  // Journal & Mood
  Future<void> addJournalEntry(JournalEntry entry);
  Future<void> addMoodEntry(MoodEntry entry);

  // Parent Profile
  Future<ParentProfile?> getParentProfile(String id);
  Future<void> saveParentProfile(ParentProfile profile);

  // Live Streams for UI reactive updates
  Stream<List<Task>> watchTasks(String userId, {DateTime? date});
  Stream<List<Goal>> watchGoals(String userId);
  Stream<List<Achievement>> watchAchievements(String userId);
  Stream<List<Hobby>> watchHobbies(String userId);
  Stream<List<JournalEntry>> watchJournalEntries(String userId);
  Stream<ParentProfile?> watchParentProfile(String id);
  Future<void> clearAllUserData();
}
