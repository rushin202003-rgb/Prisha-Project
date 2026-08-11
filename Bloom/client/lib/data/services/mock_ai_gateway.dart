import '../../domain/services/ai_gateway.dart';
import '../../domain/models/quiz.dart';
import '../../domain/models/worksheet.dart';
import '../../domain/models/schedule.dart';

class MockAIGateway implements AIGateway {
  @override
  Future<String> askQuestion(String prompt) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return 'Here is the step-by-step breakdown of your question regarding "$prompt":\n\n'
        '1. **Understand the Goal**: Identify what the prompt is asking.\n'
        '2. **Core Concepts**: Break down the variables and definitions.\n'
        '3. **Solve**: Work through each sub-problem methodically.\n\n'
        'Hope this helps! Let me know if you need another hint. 🌸';
  }

  @override
  Future<Quiz> generateQuiz(String prompt) async {
    await Future.delayed(const Duration(milliseconds: 1500)); // Simulate LLM delay
    return Quiz(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: 'Quiz: $prompt',
      subjectId: 's1',
      questions: [
        QuizQuestion(
          id: 'q1',
          questionText: 'What is the primary objective when studying $prompt?',
          options: ['Memorization', 'Understanding core concepts', 'Fast execution', 'Skipping hard parts'],
          correctOptionIndex: 1,
          explanation: 'Understanding the underlying concepts helps apply them to new challenges.',
        ),
        QuizQuestion(
          id: 'q2',
          questionText: 'Which tool is most helpful when analyzing $prompt?',
          options: ['Text Editor', 'Doubt solver', 'Calculator', 'Structured planning'],
          correctOptionIndex: 3,
          explanation: 'Structured planning organizes thoughts step-by-step.',
        ),
      ],
    );
  }

  @override
  Future<Worksheet> generateWorksheet(String prompt) async {
    await Future.delayed(const Duration(milliseconds: 1500)); // Simulate LLM delay
    return Worksheet(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: 'Worksheet: $prompt',
      subjectId: 's1',
      problems: [
        WorksheetProblem(
          id: 'p1',
          problemText: 'Explain in your own words the significance of $prompt.',
          hint: 'Think about how it connects to other topics.',
        ),
        WorksheetProblem(
          id: 'p2',
          problemText: 'Solve a practical scenario where $prompt is applied.',
          hint: 'Focus on dividing the solution into three distinct steps.',
        ),
      ],
    );
  }

  @override
  Future<List<Schedule>> assistWithSchedule(String prompt, Schedule currentSchedule) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return [currentSchedule];
  }
}
