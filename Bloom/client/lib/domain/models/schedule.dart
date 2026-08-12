enum BlockType {
  study,
  hobby,
  play,
  breakTime,
}

class ScheduleBlock {
  final String id;
  final String scheduleId;
  final String?
      taskId; // If null, it could be a break or hobby without a specific task
  final DateTime startAt;
  final DateTime endAt;
  final BlockType blockType;
  final bool locked;
  final String? reasonCode; // e.g., "sleepy_adjustment"

  const ScheduleBlock({
    required this.id,
    required this.scheduleId,
    this.taskId,
    required this.startAt,
    required this.endAt,
    required this.blockType,
    this.locked = false,
    this.reasonCode,
  });
}

class Schedule {
  final String id;
  final String studentId;
  final DateTime date;
  final int version;
  final String status; // "proposed", "selected", "active"
  final List<ScheduleBlock> blocks;

  const Schedule({
    required this.id,
    required this.studentId,
    required this.date,
    this.version = 1,
    this.status = 'proposed',
    required this.blocks,
  });
}
