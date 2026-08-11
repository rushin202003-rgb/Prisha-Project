import 'package:flutter/material.dart';
import '../../domain/models/worksheet.dart';

class WorksheetScreen extends StatefulWidget {
  final Worksheet worksheet;
  const WorksheetScreen({super.key, required this.worksheet});

  @override
  State<WorksheetScreen> createState() => _WorksheetScreenState();
}

class _WorksheetScreenState extends State<WorksheetScreen> {
  final Map<String, String> _answers = {};

  void _submitWorksheet() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Worksheet saved to your journal! 📝')),
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.worksheet.title)),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: widget.worksheet.problems.length + 1,
        itemBuilder: (context, index) {
          if (index == widget.worksheet.problems.length) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 32.0),
              child: ElevatedButton(
                onPressed: _submitWorksheet,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                  backgroundColor: Colors.deepPurpleAccent,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Submit Worksheet'),
              ),
            );
          }

          final problem = widget.worksheet.problems[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.deepPurple[100],
                        child: Text('${index + 1}', style: const TextStyle(fontSize: 12, color: Colors.deepPurple)),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          problem.problemText,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  if (problem.hint != null) ...[
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.yellow[50],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.lightbulb_outline, size: 16, color: Colors.orange),
                          const SizedBox(width: 8),
                          Expanded(child: Text(problem.hint!, style: const TextStyle(fontSize: 12))),
                        ],
                      ),
                    ),
                  ],
                  const SizedBox(height: 16),
                  TextField(
                    maxLines: 3,
                    decoration: const InputDecoration(
                      hintText: 'Type your answer here...',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (val) => _answers[problem.id] = val,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
