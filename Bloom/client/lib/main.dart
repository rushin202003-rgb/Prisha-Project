import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'core/theme.dart';
import 'core/offline_manager.dart';
import 'presentation/navigation/responsive_shell.dart';
import 'data/repositories/isar_student_repository.dart';
import 'domain/repositories/student_repository.dart';
import 'domain/models/student_profile.dart';
import 'domain/models/task.dart';
import 'domain/models/sync_mutation.dart';
import 'domain/models/subject.dart';
import 'domain/models/life_dashboard.dart';
import 'domain/models/journal.dart';
import 'domain/models/hobby.dart';
import 'domain/models/quiz.dart';
import 'domain/models/worksheet.dart';
import 'domain/models/parent_profile.dart';
import 'domain/models/companion_config.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'data/services/cloud_sync_service.dart';
import 'data/services/supabase_sync_service.dart';
import 'domain/services/ai_gateway.dart';
import 'data/services/mock_ai_gateway.dart';
import 'domain/services/auth_service.dart';
import 'data/services/mock_auth_service.dart';
import 'presentation/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL'] ?? '',
    anonKey: dotenv.env['SUPABASE_ANON_KEY'] ?? '',
  );

  final dir = await getApplicationDocumentsDirectory();
  
  final isar = await Isar.open(
    [
      StudentProfileSchema,
      TaskSchema,
      SyncMutationSchema,
      SubjectSchema,
      SyllabusItemSchema,
      GoalSchema,
      AchievementSchema,
      BookSchema,
      MusicItemSchema,
      TravelWishSchema,
      CraftIdeaSchema,
      JournalEntrySchema,
      MoodEntrySchema,
      HobbySchema,
      HobbySessionSchema,
      QuizSchema,
      WorksheetSchema,
      ParentProfileSchema,
      CompanionConfigSchema,
    ],
    directory: dir.path,
  );

  final repository = IsarStudentRepository(isar);
  final syncService = SupabaseSyncService(Supabase.instance.client);
  final offlineManager = OfflineManager(isar: isar, syncService: syncService);
  final aiGateway = MockAIGateway();
  final authService = MockAuthService();

  // Initialize dummy data if empty
  final profilesCount = await isar.studentProfiles.count();
  if (profilesCount == 0) {
    await repository.saveProfile(StudentProfile(
      userId: '1',
      displayName: 'Prisha',
      grade: '10th',
      board: 'CBSE',
      schoolHoursPerDay: 7.0,
    ));

    await repository.addTask(Task(
      id: 't1',
      studentId: '1',
      type: TaskType.homework,
      title: 'Algebra Worksheet',
      dueAt: DateTime.now().add(const Duration(hours: 2)),
      priority: TaskPriority.high,
    ));
    
    await offlineManager.queueMutation('INIT', 'Initialized dummy data');
  }

  runApp(BloomApp(
    repository: repository,
    offlineManager: offlineManager,
    aiGateway: aiGateway,
    authService: authService,
  ));
}

class BloomApp extends StatelessWidget {
  final StudentRepository repository;
  final OfflineManager offlineManager;
  final AIGateway aiGateway;
  final AuthService authService;
  
  const BloomApp({
    super.key, 
    required this.repository,
    required this.offlineManager,
    required this.aiGateway,
    required this.authService,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project Bloom',
      theme: BloomTheme.lightTheme,
      home: StreamBuilder<String?>(
        stream: authService.authStateChanges,
        builder: (context, snapshot) {
          final userId = snapshot.data;
          if (userId == null) {
            return LoginScreen(authService: authService);
          }
          return ResponsiveShell(
            repository: repository,
            offlineManager: offlineManager,
            aiGateway: aiGateway,
            authService: authService,
          );
        },
      ),
    );
  }
}
