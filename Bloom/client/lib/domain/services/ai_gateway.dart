import '../models/quiz.dart';
import '../models/worksheet.dart';
import '../models/schedule.dart';

abstract class AIGateway {
  /// Asks a general doubt-solving question and returns a structured markdown response.
  Future<String> askQuestion(String prompt);

  /// Generates a structured Quiz based on the provided prompt context.
  Future<Quiz> generateQuiz(String prompt);

  /// Generates a structured Worksheet based on the provided prompt context.
  Future<Worksheet> generateWorksheet(String prompt);

  /// Requests the AI to propose schedule modifications based on a disruption.
  Future<List<Schedule>> assistWithSchedule(
      String prompt, Schedule currentSchedule);
}
