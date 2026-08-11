import '../models/task.dart';

abstract class NotificationService {
  /// Schedules a local notification for an upcoming task.
  Future<void> scheduleTaskReminder(Task task);

  /// Sends a positive reinforcement notification (e.g., "Great job on your Algebra!").
  Future<void> sendPositiveReinforcement(String message);

  /// Cancels all scheduled notifications (useful for "Do Not Disturb" or "Sleep" modes).
  Future<void> cancelAllNotifications();

  /// Requests permission from the OS to send notifications.
  Future<bool> requestPermission();
}
