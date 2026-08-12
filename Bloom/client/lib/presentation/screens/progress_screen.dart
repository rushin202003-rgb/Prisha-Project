import 'package:flutter/material.dart';
import '../../domain/repositories/student_repository.dart';
import '../../domain/models/life_dashboard.dart';

class ProgressScreen extends StatelessWidget {
  final StudentRepository repository;
  const ProgressScreen({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Progress & Achievements 🏆')),
      body: StreamBuilder<List<Achievement>>(
        stream: repository.watchAchievements('1'),
        builder: (context, snapshot) {
          final achievements = snapshot.data ?? [];
          if (achievements.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.emoji_events,
                        size: 64, color: Colors.orangeAccent),
                    const SizedBox(height: 16),
                    const Text(
                      'No achievements unlocked yet!',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Keep completing tasks to unlock rewards and trophies in your garden.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: achievements.length,
            itemBuilder: (context, index) {
              final achievement = achievements[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Colors.amberAccent,
                    child: Icon(Icons.emoji_events, color: Colors.brown),
                  ),
                  title: Text(achievement.title,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(achievement.description),
                  trailing:
                      Text(achievement.dateUnlocked.toString().split(" ")[0]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
