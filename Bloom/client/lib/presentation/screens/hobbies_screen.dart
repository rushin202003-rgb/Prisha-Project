import 'package:flutter/material.dart';
import '../../domain/repositories/student_repository.dart';
import '../../domain/models/hobby.dart';
import '../../core/offline_manager.dart';

class HobbiesScreen extends StatelessWidget {
  final StudentRepository repository;
  final OfflineManager offlineManager;

  const HobbiesScreen({
    super.key,
    required this.repository,
    required this.offlineManager,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Hobbies 🎨')),
      body: StreamBuilder<List<Hobby>>(
        stream: repository.watchHobbies('1'),
        builder: (context, snapshot) {
          final hobbies = snapshot.data ?? [];
          if (hobbies.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.palette, size: 48, color: Colors.pinkAccent),
                  SizedBox(height: 16),
                  Text('No hobbies added yet! Tap below to add one.',
                      style: TextStyle(fontSize: 16)),
                ],
              ),
            );
          }

          return ListView.builder(
            itemCount: hobbies.length,
            itemBuilder: (context, index) {
              final hobby = hobbies[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  leading: const Icon(Icons.star, color: Colors.amber),
                  title: Text(hobby.name),
                  subtitle: Text(hobby.description ?? 'No description'),
                  trailing: Text('${hobby.targetMinutesPerWeek} mins/week'),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          final nameController = TextEditingController();
          final descController = TextEditingController();
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Add a New Hobby'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                        hintText: 'Hobby Name (e.g. Guitar)'),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: descController,
                    decoration: const InputDecoration(hintText: 'Description'),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () async {
                    if (nameController.text.isNotEmpty) {
                      final newHobby = Hobby(
                        id: DateTime.now().millisecondsSinceEpoch.toString(),
                        studentId: '1',
                        name: nameController.text,
                        description: descController.text,
                      );
                      await repository.addHobby(newHobby);
                      await offlineManager.queueMutation(
                        'ADD_HOBBY',
                        '{"id": "${newHobby.id}", "name": "${newHobby.name}"}',
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
        label: const Text('Add Hobby'),
        backgroundColor: Colors.pinkAccent,
        foregroundColor: Colors.white,
      ),
    );
  }
}
