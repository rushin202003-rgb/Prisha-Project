import 'package:supabase_flutter/supabase_flutter.dart';
import '../../domain/models/student_profile.dart';
import '../../domain/models/subject.dart';
import '../../domain/models/task.dart';
import '../../domain/models/life_dashboard.dart';
import '../../domain/models/hobby.dart';
import '../../domain/models/journal.dart';
import '../../domain/models/parent_profile.dart';
import '../../domain/repositories/student_repository.dart';

class RemoteStudentRepository implements StudentRepository {
  final SupabaseClient? _client;

  RemoteStudentRepository([this._client]);

  SupabaseClient get _supabase => _client ?? Supabase.instance.client;

  @override
  Future<StudentProfile?> getProfile(String userId) async {
    final response = await _supabase
        .from('student_profiles')
        .select()
        .eq('user_id', userId)
        .maybeSingle();
    if (response == null) return null;
    return StudentProfile(
      userId: response['user_id'] as String,
      displayName: response['display_name'] as String? ?? '',
      grade: response['grade'] as String? ?? '',
      board: response['board'] as String? ?? '',
      schoolHoursPerDay:
          (response['school_hours_per_day'] as num?)?.toDouble() ?? 0.0,
      preferredTeachingMode:
          response['preferred_teaching_mode'] as String? ?? 'Teacher',
    );
  }

  @override
  Future<void> saveProfile(StudentProfile profile) async {
    await _supabase.from('student_profiles').upsert({
      'user_id': profile.userId,
      'display_name': profile.displayName,
      'grade': profile.grade,
      'board': profile.board,
      'school_hours_per_day': profile.schoolHoursPerDay,
      'preferred_teaching_mode': profile.preferredTeachingMode,
    });
  }

  @override
  Future<List<Subject>> getSubjects(String userId) async {
    final response =
        await _supabase.from('subjects').select().eq('student_id', userId);
    return (response as List).map((row) {
      final map = row as Map<String, dynamic>;
      return Subject(
        id: map['id'] as String,
        studentId: map['student_id'] as String,
        name: map['name'] as String,
        colorHex: map['color_hex'] as String? ?? '#9C27B0',
        active: map['active'] as bool? ?? true,
      );
    }).toList();
  }

  @override
  Future<void> addSubject(Subject subject) async {
    await _supabase.from('subjects').upsert({
      'id': subject.id,
      'student_id': subject.studentId,
      'name': subject.name,
      'color_hex': subject.colorHex,
      'active': subject.active,
    });
  }

  @override
  Future<List<SyllabusItem>> getSyllabus(String subjectId) async {
    final response = await _supabase
        .from('syllabus_items')
        .select()
        .eq('subject_id', subjectId);
    return (response as List).map((row) {
      final map = row as Map<String, dynamic>;
      final statusName = map['status'] as String? ?? 'notStarted';
      final status = SyllabusStatus.values.firstWhere(
        (e) => e.name == statusName,
        orElse: () => SyllabusStatus.notStarted,
      );
      return SyllabusItem(
        id: map['id'] as String,
        subjectId: map['subject_id'] as String,
        title: map['title'] as String,
        status: status,
        estimatedMinutes: map['estimated_minutes'] as int? ?? 60,
      );
    }).toList();
  }

  @override
  Future<void> addSyllabusItem(SyllabusItem item) async {
    await _supabase.from('syllabus_items').upsert({
      'id': item.id,
      'subject_id': item.subjectId,
      'title': item.title,
      'status': item.status.name,
      'estimated_minutes': item.estimatedMinutes,
    });
  }

  @override
  Future<void> updateSyllabusItem(SyllabusItem item) async {
    await addSyllabusItem(item);
  }

  @override
  Future<List<Task>> getTasks(String userId, {DateTime? date}) async {
    final response =
        await _supabase.from('tasks').select().eq('student_id', userId);
    final tasks = (response as List).map((row) {
      final map = row as Map<String, dynamic>;
      final type = TaskType.values.firstWhere(
        (e) => e.name == (map['type'] as String?),
        orElse: () => TaskType.homework,
      );
      final priority = TaskPriority.values.firstWhere(
        (e) => e.name == (map['priority'] as String?),
        orElse: () => TaskPriority.medium,
      );
      final status = TaskStatus.values.firstWhere(
        (e) => e.name == (map['status'] as String?),
        orElse: () => TaskStatus.planned,
      );
      final dueAtRaw = map['due_at'] as String?;
      return Task(
        id: map['id'] as String,
        studentId: map['student_id'] as String,
        subjectId: map['subject_id'] as String?,
        type: type,
        title: map['title'] as String,
        dueAt: dueAtRaw != null ? DateTime.tryParse(dueAtRaw) : null,
        estimatedMinutes: map['estimated_minutes'] as int? ?? 30,
        priority: priority,
        status: status,
      );
    }).toList();

    if (date != null) {
      return tasks.where((t) {
        if (t.dueAt == null) return false;
        return t.dueAt!.year == date.year &&
            t.dueAt!.month == date.month &&
            t.dueAt!.day == date.day;
      }).toList();
    }
    return tasks;
  }

  @override
  Future<void> addTask(Task task) async {
    await _supabase.from('tasks').upsert({
      'id': task.id,
      'student_id': task.studentId,
      'subject_id': task.subjectId,
      'type': task.type.name,
      'title': task.title,
      'due_at': task.dueAt?.toIso8601String(),
      'estimated_minutes': task.estimatedMinutes,
      'priority': task.priority.name,
      'status': task.status.name,
    });
  }

  @override
  Future<void> updateTask(Task task) async {
    await addTask(task);
  }

  @override
  Future<List<Goal>> getGoals(String userId) async {
    final response =
        await _supabase.from('goals').select().eq('student_id', userId);
    return (response as List).map((row) {
      final map = row as Map<String, dynamic>;
      return Goal(
        id: map['id'] as String,
        studentId: map['student_id'] as String,
        title: map['title'] as String,
        isCompleted: map['is_completed'] as bool? ?? false,
      );
    }).toList();
  }

  @override
  Future<void> addGoal(Goal goal) async {
    await _supabase.from('goals').upsert({
      'id': goal.id,
      'student_id': goal.studentId,
      'title': goal.title,
      'is_completed': goal.isCompleted,
    });
  }

  @override
  Future<List<Achievement>> getAchievements(String userId) async {
    final response =
        await _supabase.from('achievements').select().eq('student_id', userId);
    return (response as List).map((row) {
      final map = row as Map<String, dynamic>;
      final dateRaw = map['date_unlocked'] as String?;
      return Achievement(
        id: map['id'] as String,
        studentId: map['student_id'] as String,
        title: map['title'] as String,
        description: map['description'] as String? ?? '',
        dateUnlocked: dateRaw != null
            ? DateTime.tryParse(dateRaw) ?? DateTime.now()
            : DateTime.now(),
      );
    }).toList();
  }

  @override
  Future<List<Hobby>> getHobbies(String userId) async {
    final response =
        await _supabase.from('hobbies').select().eq('student_id', userId);
    return (response as List).map((row) {
      final map = row as Map<String, dynamic>;
      return Hobby(
        id: map['id'] as String,
        studentId: map['student_id'] as String,
        name: map['name'] as String,
        description: map['description'] as String?,
        targetMinutesPerWeek: map['target_minutes_per_week'] as int? ?? 120,
      );
    }).toList();
  }

  @override
  Future<void> addHobby(Hobby hobby) async {
    await _supabase.from('hobbies').upsert({
      'id': hobby.id,
      'student_id': hobby.studentId,
      'name': hobby.name,
      'description': hobby.description,
      'target_minutes_per_week': hobby.targetMinutesPerWeek,
    });
  }

  @override
  Future<List<HobbySession>> getHobbySessions(String hobbyId) async {
    final response =
        await _supabase.from('hobby_sessions').select().eq('hobby_id', hobbyId);
    return (response as List).map((row) {
      final map = row as Map<String, dynamic>;
      final dateRaw = map['date'] as String?;
      return HobbySession(
        id: map['id'] as String,
        hobbyId: map['hobby_id'] as String,
        date: dateRaw != null
            ? DateTime.tryParse(dateRaw) ?? DateTime.now()
            : DateTime.now(),
        durationMinutes: map['duration_minutes'] as int? ?? 0,
      );
    }).toList();
  }

  @override
  Future<void> logHobbySession(HobbySession session) async {
    await _supabase.from('hobby_sessions').upsert({
      'id': session.id,
      'hobby_id': session.hobbyId,
      'date': session.date.toIso8601String(),
      'duration_minutes': session.durationMinutes,
    });
  }

  @override
  Future<void> addJournalEntry(JournalEntry entry) async {
    await _supabase.from('journal_entries').upsert({
      'id': entry.id,
      'student_id': entry.studentId,
      'date': entry.date.toIso8601String(),
      'content': entry.content,
    });
  }

  @override
  Future<void> addMoodEntry(MoodEntry entry) async {
    await _supabase.from('mood_entries').upsert({
      'id': entry.id,
      'student_id': entry.studentId,
      'timestamp': entry.timestamp.toIso8601String(),
      'mood': entry.mood.name,
      'note': entry.note,
    });
  }

  @override
  Future<ParentProfile?> getParentProfile(String id) async {
    final response = await _supabase
        .from('parent_profiles')
        .select()
        .eq('id', id)
        .maybeSingle();
    if (response == null) return null;
    final linkedListRaw = response['linked_student_ids'] as List?;
    final linkedStudentIds =
        linkedListRaw?.map((e) => e.toString()).toList() ?? [];
    return ParentProfile(
      id: response['id'] as String,
      displayName: response['display_name'] as String? ?? 'Parent',
      email: response['email'] as String? ?? '',
      linkedStudentIds: linkedStudentIds,
      notifyOnTaskCompletion:
          response['notify_on_task_completion'] as bool? ?? true,
      notifyOnMoodDrop: response['notify_on_mood_drop'] as bool? ?? true,
      canViewJournal: response['can_view_journal'] as bool? ?? false,
    );
  }

  @override
  Future<void> saveParentProfile(ParentProfile profile) async {
    await _supabase.from('parent_profiles').upsert({
      'id': profile.id,
      'display_name': profile.displayName,
      'email': profile.email,
      'linked_student_ids': profile.linkedStudentIds,
      'notify_on_task_completion': profile.notifyOnTaskCompletion,
      'notify_on_mood_drop': profile.notifyOnMoodDrop,
      'can_view_journal': profile.canViewJournal,
    });
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
    final response = await _supabase
        .from('journal_entries')
        .select()
        .eq('student_id', userId);
    yield (response as List).map((row) {
      final map = row as Map<String, dynamic>;
      final dateRaw = map['date'] as String?;
      return JournalEntry(
        id: map['id'] as String,
        studentId: map['student_id'] as String,
        date: dateRaw != null
            ? DateTime.tryParse(dateRaw) ?? DateTime.now()
            : DateTime.now(),
        content: map['content'] as String? ?? '',
      );
    }).toList();
  }

  @override
  Stream<ParentProfile?> watchParentProfile(String id) async* {
    yield await getParentProfile(id);
  }

  @override
  Future<void> clearAllUserData() async {
    final userId = _supabase.auth.currentUser?.id;
    if (userId == null) {
      // No authenticated user — do not delete any data.
      return;
    }

    // Delete hobby_sessions first (no direct student_id; keyed by hobby_id).
    // Fetch the authenticated user's hobby IDs, then delete their sessions.
    final hobbiesResponse = await _supabase
        .from('hobbies')
        .select('id')
        .eq('student_id', userId);
    final hobbyIds = (hobbiesResponse as List)
        .map((row) => (row as Map<String, dynamic>)['id'] as String)
        .toList();
    if (hobbyIds.isNotEmpty) {
      await _supabase
          .from('hobby_sessions')
          .delete()
          .inFilter('hobby_id', hobbyIds);
    }

    // Delete all remaining tables that carry student_id directly.
    await _supabase.from('hobbies').delete().eq('student_id', userId);
    await _supabase.from('tasks').delete().eq('student_id', userId);
    await _supabase.from('goals').delete().eq('student_id', userId);
    await _supabase.from('journal_entries').delete().eq('student_id', userId);
    await _supabase.from('mood_entries').delete().eq('student_id', userId);
  }
}
