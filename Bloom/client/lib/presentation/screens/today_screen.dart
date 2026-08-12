import 'package:flutter/material.dart';
import '../../domain/repositories/student_repository.dart';
import '../../core/offline_manager.dart';
import '../../domain/services/ai_gateway.dart';
import '../../domain/models/student_profile.dart';
import '../../domain/models/task.dart';
import 'quiz_screen.dart';
import 'worksheet_screen.dart';

class TodayScreen extends StatefulWidget {
  final StudentRepository repository;
  final OfflineManager offlineManager;
  final AIGateway aiGateway;

  const TodayScreen({
    super.key,
    required this.repository,
    required this.offlineManager,
    required this.aiGateway,
  });

  @override
  State<TodayScreen> createState() => _TodayScreenState();
}

class _TodayScreenState extends State<TodayScreen> {
  bool _isLoading = false;

  Future<void> _startTask(Task task) async {
    setState(() => _isLoading = true);

    try {
      if (task.type == TaskType.revision) {
        final generatedQuiz = await widget.aiGateway.generateQuiz(task.title);
        if (mounted) {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => QuizScreen(quiz: generatedQuiz)),
          );
        }
      } else {
        final generatedWorksheet =
            await widget.aiGateway.generateWorksheet(task.title);
        if (mounted) {
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (_) => WorksheetScreen(worksheet: generatedWorksheet)),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: const Color(0xFFFDE8F0),
            content: Row(
              children: [
                const Text('🌸', style: TextStyle(fontSize: 20)),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    "My brain is a bit tired right now! You can still work on your offline tasks 📚",
                    style: const TextStyle(color: Color(0xFF4A3F55)),
                  ),
                ),
              ],
            ),
            duration: const Duration(seconds: 4),
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<StudentProfile?>(
      future: widget.repository.getProfile('1'),
      builder: (context, profileSnapshot) {
        final profile = profileSnapshot.data;
        return StreamBuilder<List<Task>>(
          stream: widget.repository.watchTasks('1', date: DateTime.now()),
          builder: (context, taskSnapshot) {
            final tasks = taskSnapshot.data ?? [];
            return Scaffold(
              appBar: AppBar(
                  title: Text('Today for ${profile?.displayName ?? ""} 🌸')),
              body: Stack(
                children: [
                  tasks.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Your day is still a blank page.',
                                  style: TextStyle(fontSize: 18)),
                              const SizedBox(height: 16),
                              ElevatedButton(
                                  onPressed: () {},
                                  child: const Text(
                                      'Want to plan it together? 🌸')),
                            ],
                          ),
                        )
                      : ListView.builder(
                          itemCount: tasks.length,
                          itemBuilder: (context, index) {
                            final task = tasks[index];
                            return Card(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              child: ListTile(
                                leading: Checkbox(
                                  value: task.status == TaskStatus.completed,
                                  onChanged: (val) async {
                                    final updatedTask = task.copyWith(
                                      status: val == true
                                          ? TaskStatus.completed
                                          : TaskStatus.planned,
                                    );
                                    await widget.repository
                                        .updateTask(updatedTask);
                                    await widget.offlineManager.queueMutation(
                                      'UPDATE_TASK',
                                      '{"id": "${task.id}", "status": "${updatedTask.status.name}"}',
                                    );
                                  },
                                ),
                                title: Text(task.title),
                                subtitle: Text(
                                    '${task.type.name} • ${task.priority.name} priority'),
                                trailing: const Icon(Icons.play_arrow,
                                    color: Colors.pinkAccent),
                                onTap: () => _startTask(task),
                              ),
                            );
                          },
                        ),
                  if (_isLoading)
                    Container(
                      color: Colors.black.withOpacity(0.3),
                      child: const Center(
                        child: Card(
                          child: Padding(
                            padding: EdgeInsets.all(24.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CircularProgressIndicator(),
                                SizedBox(height: 16),
                                Text('AI companion generating material...',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
