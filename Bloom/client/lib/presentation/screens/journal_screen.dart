import 'package:flutter/material.dart';
import '../../domain/models/journal.dart';
import '../../domain/repositories/student_repository.dart';
import '../../core/offline_manager.dart';

class JournalScreen extends StatefulWidget {
  final StudentRepository repository;
  final OfflineManager offlineManager;

  const JournalScreen({
    super.key,
    required this.repository,
    required this.offlineManager,
  });

  @override
  State<JournalScreen> createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
  MoodValue? _selectedMood;
  final TextEditingController _controller = TextEditingController();

  void _saveEntry() async {
    if (_selectedMood == null || _controller.text.isEmpty) return;

    final entryId = DateTime.now().millisecondsSinceEpoch.toString();
    final journal = JournalEntry(
      id: entryId,
      studentId: '1',
      date: DateTime.now(),
      content: _controller.text,
    );

    final mood = MoodEntry(
      id: entryId,
      studentId: '1',
      timestamp: DateTime.now(),
      mood: _selectedMood!,
      note: 'Logged via diary entry',
    );

    await widget.repository.addJournalEntry(journal);
    await widget.repository.addMoodEntry(mood);

    await widget.offlineManager.queueMutation(
      'ADD_JOURNAL',
      '{"id": "$entryId", "mood": "${_selectedMood!.name}", "content": "${_controller.text.replaceAll("\n", "\\n")}"}',
    );

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Saved safely to your diary 🌸')),
      );
      Navigator.of(context).pop();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Diary 📖'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: _saveEntry,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'How are you feeling today?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: MoodValue.values.map((mood) {
                final isSelected = _selectedMood == mood;
                String emoji = '😐';
                switch (mood) {
                  case MoodValue.great:
                    emoji = '😊';
                    break;
                  case MoodValue.good:
                    emoji = '😌';
                    break;
                  case MoodValue.okay:
                    emoji = '😐';
                    break;
                  case MoodValue.bad:
                    emoji = '😟';
                    break;
                  case MoodValue.terrible:
                    emoji = '😢';
                    break;
                }
                return GestureDetector(
                  onTap: () => setState(() => _selectedMood = mood),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.pink[100] : Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                    child: Text(emoji, style: const TextStyle(fontSize: 32)),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 32),
            Expanded(
              child: TextField(
                controller: _controller,
                maxLines: null,
                expands: true,
                textAlignVertical: TextAlignVertical.top,
                decoration: InputDecoration(
                  hintText: 'Dear Diary...',
                  filled: true,
                  fillColor: Colors.purple[50],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.all(16),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _saveEntry,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16),
                backgroundColor: Colors.pinkAccent,
                foregroundColor: Colors.white,
              ),
              child: const Text('Close & Lock Diary'),
            ),
          ],
        ),
      ),
    );
  }
}
