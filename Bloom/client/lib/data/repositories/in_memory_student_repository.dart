import '../../domain/models/student_profile.dart';
import '../../domain/models/subject.dart';
import '../../domain/models/task.dart';
import '../../domain/models/life_dashboard.dart';
import '../../domain/models/hobby.dart';
import '../../domain/models/journal.dart';
import '../../domain/models/parent_profile.dart';
import '../../domain/repositories/student_repository.dart';

class InMemoryStudentRepository implements StudentRepository {
  StudentProfile? _profile;
  final List<Subject> _subjects = [];
  final List<SyllabusItem> _syllabusItems = [];
  final List<Task> _tasks = [];
  final List<Goal> _goals = [];
  final List<Achievement> _achievements = [];
  final List<Hobby> _hobbies = [];
  final List<HobbySession> _hobbySessions = [];
  final List<JournalEntry> _journalEntries = [];
  final List<MoodEntry> _moodEntries = [];
  ParentProfile? _parentProfile;

  @override
  Future<StudentProfile?> getProfile(String userId) async {
    if (_profile?.userId == userId) {
      return _profile;
    }
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
    final index = _subjects.indexWhere((s) => s.id == subject.id);
    if (index >= 0) {
      _subjects[index] = subject;
    } else {
      _subjects.add(subject);
    }
  }

  @override
  Future<List<SyllabusItem>> getSyllabus(String subjectId) async {
    return _syllabusItems.where((i) => i.subjectId == subjectId).toList();
  }

  @override
  Future<void> addSyllabusItem(SyllabusItem item) async {
    final index = _syllabusItems.indexWhere((i) => i.id == item.id);
    if (index >= 0) {
      _syllabusItems[index] = item;
    } else {
      _syllabusItems.add(item);
    }
  }

  @override
  Future<void> updateSyllabusItem(SyllabusItem item) async {
    final index = _syllabusItems.indexWhere((i) => i.id == item.id);
    if (index >= 0) {
      _syllabusItems[index] = item;
    } else {
      _syllabusItems.add(item);
    }
  }

  @override
  Future<List<Task>> getTasks(String userId, {DateTime? date}) async {
    var userTasks = _tasks.where((t) => t.studentId == userId).toList();
    if (date != null) {
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
    final index = _tasks.indexWhere((t) => t.id == task.id);
    if (index >= 0) {
      _tasks[index] = task;
    } else {
      _tasks.add(task);
    }
  }

  @override
  Future<void> updateTask(Task task) async {
    final index = _tasks.indexWhere((t) => t.id == task.id);
    if (index >= 0) {
      _tasks[index] = task;
    } else {
      _tasks.add(task);
    }
  }

  @override
  Future<List<Goal>> getGoals(String userId) async {
    return _goals.where((g) => g.studentId == userId).toList();
  }

  @override
  Future<void> addGoal(Goal goal) async {
    final index = _goals.indexWhere((g) => g.id == goal.id);
    if (index >= 0) {
      _goals[index] = goal;
    } else {
      _goals.add(goal);
    }
  }

  @override
  Future<List<Achievement>> getAchievements(String userId) async {
    return _achievements.where((a) => a.studentId == userId).toList();
  }

  @override
  Future<List<Hobby>> getHobbies(String userId) async {
    return _hobbies.where((h) => h.studentId == userId).toList();
  }

  @override
  Future<void> addHobby(Hobby hobby) async {
    final index = _hobbies.indexWhere((h) => h.id == hobby.id);
    if (index >= 0) {
      _hobbies[index] = hobby;
    } else {
      _hobbies.add(hobby);
    }
  }

  @override
  Future<List<HobbySession>> getHobbySessions(String hobbyId) async {
    return _hobbySessions.where((s) => s.hobbyId == hobbyId).toList();
  }

  @override
  Future<void> logHobbySession(HobbySession session) async {
    final index = _hobbySessions.indexWhere((s) => s.id == session.id);
    if (index >= 0) {
      _hobbySessions[index] = session;
    } else {
      _hobbySessions.add(session);
    }
  }

  @override
  Future<void> addJournalEntry(JournalEntry entry) async {
    final index = _journalEntries.indexWhere((j) => j.id == entry.id);
    if (index >= 0) {
      _journalEntries[index] = entry;
    } else {
      _journalEntries.add(entry);
    }
  }

  @override
  Future<void> addMoodEntry(MoodEntry entry) async {
    final index = _moodEntries.indexWhere((m) => m.id == entry.id);
    if (index >= 0) {
      _moodEntries[index] = entry;
    } else {
      _moodEntries.add(entry);
    }
  }

  @override
  Future<ParentProfile?> getParentProfile(String id) async {
    if (_parentProfile?.id == id) {
      return _parentProfile;
    }
    return _parentProfile;
  }

  @override
  Future<void> saveParentProfile(ParentProfile profile) async {
    _parentProfile = profile;
  }

  @override
  Stream<List<Task>> watchTasks(String userId, {DateTime? date}) async* {
    yield await getTasks(userId, date: date);
  }

  @override
  Stream<List<Goal>> watchGoals(String userId) async* {
    yield await getGoals(userId);
  }

  @override
  Stream<List<Achievement>> watchAchievements(String userId) async* {
    yield await getAchievements(userId);
  }

  @override
  Stream<List<Hobby>> watchHobbies(String userId) async* {
    yield await getHobbies(userId);
  }

  @override
  Stream<List<JournalEntry>> watchJournalEntries(String userId) async* {
    yield _journalEntries.where((j) => j.studentId == userId).toList();
  }

  @override
  Stream<ParentProfile?> watchParentProfile(String id) async* {
    yield await getParentProfile(id);
  }

  @override
  Future<void> clearAllUserData() async {
    _profile = null;
    _subjects.clear();
    _syllabusItems.clear();
    _tasks.clear();
    _goals.clear();
    _achievements.clear();
    _hobbies.clear();
    _hobbySessions.clear();
    _journalEntries.clear();
    _moodEntries.clear();
    _parentProfile = null;
  }
}
