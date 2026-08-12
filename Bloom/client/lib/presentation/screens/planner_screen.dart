import 'package:flutter/material.dart';
import '../../domain/repositories/student_repository.dart';
import '../../domain/models/task.dart';

class PlannerScreen extends StatelessWidget {
  final StudentRepository repository;
  const PlannerScreen({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Task>>(
        stream: repository.watchTasks('1'),
        builder: (context, snapshot) {
          final tasks = snapshot.data ?? [];
          return Scaffold(
            appBar: AppBar(title: const Text('Planner')),
            body: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: const Icon(Icons.assignment),
                    title: Text(task.title),
                    subtitle: Text(
                        'Due: ${task.dueAt?.toString().split(" ")[0] ?? "No Date"}'),
                  ),
                );
              },
            ),
          );
        });
  }
}
