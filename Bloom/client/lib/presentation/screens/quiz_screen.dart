import 'package:flutter/material.dart';
import '../../domain/models/quiz.dart';

class QuizScreen extends StatefulWidget {
  final Quiz quiz;
  const QuizScreen({super.key, required this.quiz});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentIndex = 0;
  int? _selectedOptionIndex;
  int _score = 0;

  void _submitAnswer() {
    if (_selectedOptionIndex == null) return;
    
    if (_selectedOptionIndex == widget.quiz.questions[_currentIndex].correctOptionIndex) {
      _score++;
    }

    if (_currentIndex < widget.quiz.questions.length - 1) {
      setState(() {
        _currentIndex++;
        _selectedOptionIndex = null;
      });
    } else {
      _showResults();
    }
  }

  void _showResults() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Quiz Complete! 🎉'),
        content: Text('You scored $_score out of ${widget.quiz.questions.length}!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close dialog
              Navigator.of(context).pop(); // Close screen
            },
            child: const Text('Back to Home'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.quiz.questions.isEmpty) return const Scaffold(body: Center(child: Text('No questions available')));

    final question = widget.quiz.questions[_currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.quiz.title),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: LinearProgressIndicator(
            value: (_currentIndex + 1) / widget.quiz.questions.length,
            backgroundColor: Colors.grey[200],
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.pinkAccent),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Question ${_currentIndex + 1} of ${widget.quiz.questions.length}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            Text(
              question.questionText,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 32),
            ...List.generate(question.options.length, (index) {
              final isSelected = _selectedOptionIndex == index;
              return Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.all(16),
                    backgroundColor: isSelected ? Colors.pink[50] : null,
                    side: BorderSide(
                      color: isSelected ? Colors.pinkAccent : Colors.grey[300]!,
                      width: isSelected ? 2 : 1,
                    ),
                  ),
                  onPressed: () {
                    setState(() => _selectedOptionIndex = index);
                  },
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      question.options[index],
                      style: TextStyle(
                        color: isSelected ? Colors.pinkAccent : Colors.black87,
                      ),
                    ),
                  ),
                ),
              );
            }),
            const Spacer(),
            ElevatedButton(
              onPressed: _selectedOptionIndex == null ? null : _submitAnswer,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16),
                backgroundColor: Colors.pinkAccent,
                foregroundColor: Colors.white,
              ),
              child: Text(_currentIndex == widget.quiz.questions.length - 1 ? 'Finish' : 'Next Question'),
            ),
          ],
        ),
      ),
    );
  }
}
