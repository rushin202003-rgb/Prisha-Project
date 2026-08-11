import 'package:flutter/material.dart';
import '../../domain/repositories/student_repository.dart';
import '../../domain/models/subject.dart';
import 'ai_chat_screen.dart';

class LearnScreen extends StatelessWidget {
  final StudentRepository repository;
  const LearnScreen({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Subject>>(
      future: repository.getSubjects('1'),
      builder: (context, snapshot) {
        final subjects = snapshot.data ?? [];
        return Scaffold(
          appBar: AppBar(title: const Text('Learn')),
          body: ListView.builder(
            itemCount: subjects.length,
            itemBuilder: (context, index) {
              final subject = subjects[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  leading: Icon(Icons.book, color: Color(int.parse(subject.colorHex.replaceAll('#', '0xff')))),
                  title: Text(subject.name),
                  trailing: const Icon(Icons.chat_bubble_outline, color: Colors.blueAccent),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => AiChatScreen(subjectName: subject.name)));
                  },
                ),
              );
            },
          ),
        );
      }
    );
  }
}
