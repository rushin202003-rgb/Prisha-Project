import 'package:flutter/material.dart';
import '../../domain/repositories/student_repository.dart';
import '../../core/offline_manager.dart';
import '../../domain/models/life_dashboard.dart';
import 'journal_screen.dart';
import 'garden_screen.dart';

class LifeScreen extends StatelessWidget {
  final StudentRepository repository;
  final OfflineManager offlineManager;
  const LifeScreen({super.key, required this.repository, required this.offlineManager});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Goal>>(
      stream: repository.watchGoals('1'),
      builder: (context, snapshot) {
        final goals = snapshot.data ?? [];
        return Scaffold(
          appBar: AppBar(title: const Text('Life Dashboard')),
          body: ListView.builder(
            itemCount: goals.length,
            itemBuilder: (context, index) {
              final goal = goals[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  leading: const Icon(Icons.flag, color: Colors.pinkAccent),
                  title: Text(goal.title),
                  trailing: Checkbox(
                    value: goal.isCompleted,
                    onChanged: (val) async {
                      final updatedGoal = Goal(
                        id: goal.id,
                        studentId: goal.studentId,
                        title: goal.title,
                        isCompleted: val ?? false,
                      );
                      await repository.addGoal(updatedGoal);
                      await offlineManager.queueMutation(
                        'UPDATE_GOAL',
                        '{"id": "${goal.id}", "completed": ${val}}',
                      );
                    },
                  ),
                ),
              );
            },
          ),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton.extended(
                heroTag: 'add_goal_btn',
                onPressed: () {
                  final controller = TextEditingController();
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Add a New Goal'),
                      content: TextField(
                        controller: controller,
                        decoration: const InputDecoration(hintText: 'Enter goal title'),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () async {
                            if (controller.text.isNotEmpty) {
                              final newGoal = Goal(
                                id: DateTime.now().millisecondsSinceEpoch.toString(),
                                studentId: '1',
                                title: controller.text,
                                isCompleted: false,
                              );
                              await repository.addGoal(newGoal);
                              await offlineManager.queueMutation(
                                'ADD_GOAL',
                                '{"id": "${newGoal.id}", "title": "${newGoal.title}"}',
                              );
                              Navigator.of(context).pop();
                            }
                          },
                          child: const Text('Add'),
                        ),
                      ],
                    ),
                  );
                },
                icon: const Icon(Icons.add),
                label: const Text('New Goal'),
                backgroundColor: Colors.indigoAccent,
                foregroundColor: Colors.white,
              ),
              const SizedBox(height: 16),
              FloatingActionButton.extended(
                heroTag: 'garden_btn',
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => const GardenScreen()));
                },
                icon: const Icon(Icons.local_florist),
                label: const Text('My Garden'),
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
              ),
              const SizedBox(height: 16),
              FloatingActionButton.extended(
                heroTag: 'diary_btn',
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => JournalScreen(
                      repository: repository,
                      offlineManager: offlineManager,
                    ),
                  ));
                },
                icon: const Icon(Icons.book),
                label: const Text('Open Diary'),
                backgroundColor: Colors.pinkAccent,
                foregroundColor: Colors.white,
              ),
            ],
          ),
        );
      }
    );
  }
}
