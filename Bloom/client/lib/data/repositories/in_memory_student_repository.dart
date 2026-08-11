import '../../domain/models/student_profile.dart';
import '../../domain/models/subject.dart';
import '../../domain/models/task.dart';
import '../../domain/models/life_dashboard.dart';
import '../../domain/repositories/student_repository.dart';

class InMemoryStudentRepository implements StudentRepository {
  StudentProfile? _profile;
  final List<Subject> _subjects = [];
  final List<SyllabusItem> _syllabusItems = [];
  final List<Task> _tasks = [];
  final List<Goal> _goals = [];
  final List<Achievement> _achievements = [];

  @override
  Future<StudentProfile?> getProfile(String userId) async {
    return _profile;
  }

  @override
  Future<void> saveProfile(StudentProfile profile) async {
    _profile = profile;
  }

  @override
  Future<List<Subject>> getSubjects(String userId) async {
    return _subjects.where((s) => s.studentId == userId).toList();
  }

  @override
  Future<void> addSubject(Subject subject) async {
    _subjects.add(subject);
  }

  @override
  Future<List<SyllabusItem>> getSyllabus(String subjectId) async {
    return _syllabusItems.where((i) => i.subjectId == subjectId).toList();
  }

  @override
  Future<void> addSyllabusItem(SyllabusItem item) async {
    _syllabusItems.add(item);
  }

  @override
  Future<void> updateSyllabusItem(SyllabusItem item) async {
    final index = _syllabusItems.indexWhere((i) => i.id == item.id);
    if (index >= 0) {
      _syllabusItems[index] = item;
    }
  }

  @override
  Future<List<Task>> getTasks(String userId, {DateTime? date}) async {
    var userTasks = _tasks.where((t) => t.studentId == userId).toList();
    if (date != null) {
      // Basic filter for due date matching the same day
      userTasks = userTasks.where((t) {
        if (t.dueAt == null) return false;
        return t.dueAt!.year == date.year &&
               t.dueAt!.month == date.month &&
               t.dueAt!.day == date.day;
      }).toList();
    }
    return userTasks;
  }

  @override
  Future<void> addTask(Task task) async {
    _tasks.add(task);
  }

  @override
  Future<void> updateTask(Task task) async {
    final index = _tasks.indexWhere((t) => t.id == task.id);
    if (index >= 0) {
      _tasks[index] = task;
    }
  }

  @override
  Future<List<Goal>> getGoals(String userId) async {
    return _goals.where((g) => g.studentId == userId).toList();
  }

  @override
  Future<void> addGoal(Goal goal) async {
    _goals.add(goal);
  }

  @override
  Future<List<Achievement>> getAchievements(String userId) async {
    return _achievements.where((a) => a.studentId == userId).toList();
  }
}
