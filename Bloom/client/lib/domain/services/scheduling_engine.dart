import '../models/task.dart';
import '../models/schedule.dart';

class SchedulingEngine {
  /// Calculates the revision boundary before an exam.
  /// Anything after this date should prioritize revision tasks.
  static DateTime calculateRevisionBoundary(DateTime examDate, {int revisionDays = 12}) {
    return examDate.subtract(Duration(days: revisionDays));
  }

  /// Generates a simple sequential schedule starting from 15:00 (3:00 PM)
  static Schedule generateDailySchedule(
    String studentId,
    DateTime date,
    List<Task> pendingTasks,
  ) {
    // 1. Sort tasks: High priority first, then due earlier.
    final sortedTasks = List<Task>.from(pendingTasks);
    sortedTasks.sort((a, b) {
      if (a.priority != b.priority) {
        return a.priority.index.compareTo(b.priority.index); // Enum index 0 is high
      }
      if (a.dueAt != null && b.dueAt != null) {
        return a.dueAt!.compareTo(b.dueAt!);
      }
      return 0;
    });

    final blocks = <ScheduleBlock>[];
    // Start at 3:00 PM
    DateTime currentTime = DateTime(date.year, date.month, date.day, 15, 0);

    for (var i = 0; i < sortedTasks.length; i++) {
      final task = sortedTasks[i];
      final endTime = currentTime.add(Duration(minutes: task.estimatedMinutes));
      
      blocks.add(ScheduleBlock(
        id: 'block_$i',
        scheduleId: 'sched_gen_1',
        taskId: task.id,
        startAt: currentTime,
        endAt: endTime,
        blockType: BlockType.study,
      ));

      currentTime = endTime;
      // Add a 10-minute break after every study block automatically
      final breakEnd = currentTime.add(const Duration(minutes: 10));
      blocks.add(ScheduleBlock(
        id: 'break_$i',
        scheduleId: 'sched_gen_1',
        startAt: currentTime,
        endAt: breakEnd,
        blockType: BlockType.breakTime,
      ));
      currentTime = breakEnd;
    }

    return Schedule(
      id: 'sched_gen_1',
      studentId: studentId,
      date: date,
      status: 'proposed',
      blocks: blocks,
    );
  }

  /// Generates 2-3 alternatives if a student is sleepy/busy.
  static List<Schedule> generateAlternatives(Schedule baseSchedule) {
    // In a real implementation, Option A: Drops hobbies, Option B: Delays low-priority tasks, etc.
    // Here we just return dummy distinct schedules for architecture purposes.
    return [
      Schedule(id: 'alt_1', studentId: baseSchedule.studentId, date: baseSchedule.date, blocks: baseSchedule.blocks, version: 1),
      Schedule(id: 'alt_2', studentId: baseSchedule.studentId, date: baseSchedule.date, blocks: baseSchedule.blocks.skip(1).toList(), version: 2), // Dropped first task
    ];
  }
}
