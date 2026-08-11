import 'dart:convert';
import 'package:google_generative_ai/google_generative_ai.dart';
import '../../domain/services/ai_gateway.dart';
import '../../domain/models/quiz.dart';
import '../../domain/models/worksheet.dart';
import '../../domain/models/schedule.dart';

class GeminiAIGateway implements AIGateway {
  final String apiKey;

  GeminiAIGateway(this.apiKey);

  @override
  Future<String> askQuestion(String prompt) async {
    try {
      final model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: apiKey);
      final response = await model.generateContent([Content.text(prompt)]);
      return response.text ?? 'No response received from the tutor.';
    } catch (e) {
      return 'Sorry, I had trouble connecting to my brain. Details: $e';
    }
  }

  @override
  Future<Quiz> generateQuiz(String prompt) async {
    try {
      final model = GenerativeModel(
        model: 'gemini-1.5-flash',
        apiKey: apiKey,
        generationConfig: GenerationConfig(
          responseMimeType: 'application/json',
          responseSchema: Schema.object(
            properties: {
              'title': Schema.string(description: 'Title of the quiz'),
              'questions': Schema.array(
                items: Schema.object(
                  properties: {
                    'id': Schema.string(description: 'Unique question ID, e.g., q1, q2'),
                    'questionText': Schema.string(description: 'The multiple choice question text'),
                    'options': Schema.array(items: Schema.string(description: 'A single answer option')),
                    'correctOptionIndex': Schema.integer(description: '0-based index of the correct option in the options array'),
                    'explanation': Schema.string(description: 'Clear step-by-step academic explanation of the correct answer'),
                  },
                  requiredProperties: ['id', 'questionText', 'options', 'correctOptionIndex', 'explanation'],
                ),
              ),
            },
            requiredProperties: ['title', 'questions'],
          ),
        ),
      );

      final response = await model.generateContent([Content.text(prompt)]);
      final jsonText = response.text;
      if (jsonText == null || jsonText.isEmpty) {
        throw Exception('No content generated');
      }

      final map = jsonDecode(jsonText) as Map<String, dynamic>;
      final questionsList = (map['questions'] as List).map((q) => QuizQuestion(
        id: q['id']?.toString(),
        questionText: q['questionText']?.toString(),
        options: List<String>.from(q['options'] ?? []),
        correctOptionIndex: q['correctOptionIndex'] as int?,
        explanation: q['explanation']?.toString(),
      )).toList();

      return Quiz(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: map['title']?.toString() ?? 'Tutor Quiz',
        subjectId: '1',
        questions: questionsList,
      );
    } catch (e) {
      // Return a basic fallback quiz if the API fails or fails to parse
      return Quiz(
        id: 'fallback_quiz',
        title: 'Academic Checkpoint Quiz',
        subjectId: '1',
        questions: [
          QuizQuestion(
            id: 'fq1',
            questionText: 'Which of the following describes the core theme of your study session?',
            options: ['Revision', 'Recall', 'Analysis', 'All of the above'],
            correctOptionIndex: 3,
            explanation: 'All of these methods contribute to active retrieval and understanding.',
          )
        ],
      );
    }
  }

  @override
  Future<Worksheet> generateWorksheet(String prompt) async {
    try {
      final model = GenerativeModel(
        model: 'gemini-1.5-flash',
        apiKey: apiKey,
        generationConfig: GenerationConfig(
          responseMimeType: 'application/json',
          responseSchema: Schema.object(
            properties: {
              'title': Schema.string(description: 'Title of the worksheet'),
              'problems': Schema.array(
                items: Schema.object(
                  properties: {
                    'id': Schema.string(description: 'Unique problem ID, e.g., p1, p2'),
                    'problemText': Schema.string(description: 'The worksheet question or math problem text'),
                    'hint': Schema.string(description: 'A helpful hint to guide the student towards solving it'),
                  },
                  requiredProperties: ['id', 'problemText', 'hint'],
                ),
              ),
            },
            requiredProperties: ['title', 'problems'],
          ),
        ),
      );

      final response = await model.generateContent([Content.text(prompt)]);
      final jsonText = response.text;
      if (jsonText == null || jsonText.isEmpty) {
        throw Exception('No content generated');
      }

      final map = jsonDecode(jsonText) as Map<String, dynamic>;
      final problemsList = (map['problems'] as List).map((p) => WorksheetProblem(
        id: p['id']?.toString(),
        problemText: p['problemText']?.toString(),
        hint: p['hint']?.toString(),
      )).toList();

      return Worksheet(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: map['title']?.toString() ?? 'Tutor Worksheet',
        subjectId: '1',
        problems: problemsList,
      );
    } catch (e) {
      // Fallback worksheet
      return Worksheet(
        id: 'fallback_worksheet',
        title: 'Review Worksheet',
        subjectId: '1',
        problems: [
          WorksheetProblem(
            id: 'fp1',
            problemText: 'Explain in your own words the most important concepts of this topic.',
            hint: 'Recall details step-by-step.',
          )
        ],
      );
    }
  }

  @override
  Future<List<Schedule>> assistWithSchedule(String prompt, Schedule currentSchedule) async {
    // Basic schedule shifting fallback, similar to the mock gateway
    return [
      Schedule(
        id: '${currentSchedule.id}_v2',
        studentId: currentSchedule.studentId,
        date: currentSchedule.date,
        version: currentSchedule.version + 1,
        status: 'proposed',
        blocks: currentSchedule.blocks.map((block) {
          return ScheduleBlock(
            id: block.id,
            scheduleId: '${currentSchedule.id}_v2',
            taskId: block.taskId,
            startAt: block.startAt.add(const Duration(minutes: 30)),
            endAt: block.endAt.add(const Duration(minutes: 30)),
            blockType: block.blockType,
            reasonCode: 'ai_reschedule',
          );
        }).toList(),
      )
    ];
  }
}
