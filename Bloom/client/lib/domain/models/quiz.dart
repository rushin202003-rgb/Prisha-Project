import 'package:isar/isar.dart';

part 'quiz.g.dart';

@embedded
class QuizQuestion {
  String? id;
  String? questionText;
  List<String>? options;
  int? correctOptionIndex;
  String? explanation;

  QuizQuestion({
    this.id,
    this.questionText,
    this.options,
    this.correctOptionIndex,
    this.explanation,
  });
}

@collection
class Quiz {
  Id isarId = Isar.autoIncrement;

  @Index(unique: true)
  final String id;

  final String title;
  final String subjectId;
  final List<QuizQuestion> questions;

  Quiz({
    required this.id,
    required this.title,
    required this.subjectId,
    required this.questions,
  });
}
