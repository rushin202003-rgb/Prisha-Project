import '../../domain/models/student_profile.dart';
import '../../domain/models/subject.dart';
import '../../domain/models/task.dart';
import '../../domain/models/life_dashboard.dart';
import '../../domain/repositories/student_repository.dart';

/// A structural scaffold for a remote repository (e.g. Firebase or Supabase).
/// In an offline-first architecture, this would likely wrap a local DB and a SyncService.
class RemoteStudentRepository implements StudentRepository {
  
  @override
  Future<StudentProfile?> getProfile(String userId) async {
    // TODO: Fetch from remote API
    throw UnimplementedError('API integration required');
  }

  @override
  Future<void> saveProfile(StudentProfile profile) async {
    // TODO: Push to remote API
    throw UnimplementedError('API integration required');
  }

  @override
  Future<List<Subject>> getSubjects(String userId) async {
    throw UnimplementedError('API integration required');
  }

  @override
  Future<void> addSubject(Subject subject) async {
    throw UnimplementedError('API integration required');
  }

  @override
  Future<List<SyllabusItem>> getSyllabus(String subjectId) async {
    throw UnimplementedError('API integration required');
  }

  @override
  Future<void> addSyllabusItem(SyllabusItem item) async {
    throw UnimplementedError('API integration required');
  }

  @override
  Future<void> updateSyllabusItem(SyllabusItem item) async {
    throw UnimplementedError('API integration required');
  }

  @override
  Future<List<Task>> getTasks(String userId, {DateTime? date}) async {
    throw UnimplementedError('API integration required');
  }

  @override
  Future<void> addTask(Task task) async {
    throw UnimplementedError('API integration required');
  }

  @override
  Future<void> updateTask(Task task) async {
    throw UnimplementedError('API integration required');
  }

  @override
  Future<List<Goal>> getGoals(String userId) async {
    throw UnimplementedError('API integration required');
  }

  @override
  Future<void> addGoal(Goal goal) async {
    throw UnimplementedError('API integration required');
  }

  @override
  Future<List<Achievement>> getAchievements(String userId) async {
    throw UnimplementedError('API integration required');
  }
}
