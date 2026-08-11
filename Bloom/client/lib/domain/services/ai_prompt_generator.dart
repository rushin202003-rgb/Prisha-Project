import '../models/task.dart';
import '../models/journal.dart';
import '../models/companion_config.dart';

class AIPromptGeneratorService {
  
  /// Generates a highly scoped prompt to send to the Cloud Agent
  /// based strictly on local context.
  static String generateTeachingPrompt({
    required Task currentTask,
    required CompanionMode mode,
    MoodEntry? latestMood,
    String? customInstructions,
  }) {
    final buffer = StringBuffer();
    
    // 1. Establish Persona Boundary
    buffer.writeln('SYSTEM INSTRUCTION:');
    if (mode == CompanionMode.teacher) {
      buffer.writeln('You are a strict but encouraging academic tutor. Teach step-by-step. Do not give the direct answer.');
    } else {
      buffer.writeln('You are a supportive, playful peer. Use fun analogies and emoji. Keep it light and encouraging.');
    }
    if (customInstructions != null && customInstructions.isNotEmpty) {
      buffer.writeln('Additional constraint: $customInstructions');
    }
    
    // 2. Provide Scoped Context
    buffer.writeln('\nCONTEXT:');
    buffer.writeln('The student is currently working on: ${currentTask.title} (Type: ${currentTask.type.name})');
    if (latestMood != null) {
      buffer.writeln('The student is currently feeling: ${latestMood.mood.name}. Adapt your tone accordingly.');
    }

    // 3. User Request Placeholder
    buffer.writeln('\nUSER INPUT:');
    buffer.writeln('[TODO: Insert actual user chat message here]');

    return buffer.toString();
  }

  /// Generates a strict prompt instructing the LLM to output a Quiz JSON.
  static String generateQuizPrompt(String topic) {
    return '''
SYSTEM INSTRUCTION:
You are an expert curriculum designer. 
Generate a 5-question multiple choice quiz on the topic: $topic.
You MUST output valid JSON matching the exact schema required by the application.
No markdown wrappers, no conversational text. JSON only.
''';
  }

  /// Generates a strict prompt instructing the LLM to output a Worksheet JSON.
  static String generateWorksheetPrompt(String topic) {
    return '''
SYSTEM INSTRUCTION:
You are an expert curriculum designer. 
Generate a 3-problem worksheet on the topic: $topic. Include hints for each problem.
You MUST output valid JSON matching the exact schema required by the application.
No markdown wrappers, no conversational text. JSON only.
''';
  }
}
