import 'package:isar/isar.dart';

part 'worksheet.g.dart';

@embedded
class WorksheetProblem {
  String? id;
  String? problemText;
  String? hint;

  WorksheetProblem({
    this.id,
    this.problemText,
    this.hint,
  });
}

@collection
class Worksheet {
  Id isarId = Isar.autoIncrement;

  @Index(unique: true)
  final String id;

  final String title;
  final String subjectId;
  final List<WorksheetProblem> problems;

  Worksheet({
    required this.id,
    required this.title,
    required this.subjectId,
    required this.problems,
  });
}
