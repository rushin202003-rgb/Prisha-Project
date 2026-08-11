import 'dart:convert';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../domain/models/sync_mutation.dart';
import 'cloud_sync_service.dart';

class SupabaseSyncService implements SyncService {
  final SupabaseClient client;

  SupabaseSyncService(this.client);

  @override
  Future<bool> pushMutation(SyncMutation mutation) async {
    try {
      final payloadMap = jsonDecode(mutation.payload) as Map<String, dynamic>;

      switch (mutation.action) {
        case 'ADD_TASK':
        case 'UPDATE_TASK':
          final Map<String, dynamic> data = {'id': payloadMap['id']};
          if (payloadMap.containsKey('studentId')) data['student_id'] = payloadMap['studentId'];
          if (payloadMap.containsKey('title')) data['title'] = payloadMap['title'];
          if (payloadMap.containsKey('type')) data['type'] = payloadMap['type'];
          if (payloadMap.containsKey('dueAt')) data['due_at'] = payloadMap['dueAt'];
          if (payloadMap.containsKey('priority')) data['priority'] = payloadMap['priority'];
          if (payloadMap.containsKey('isCompleted')) data['is_completed'] = payloadMap['isCompleted'];

          await client.from('tasks').upsert(data);
          break;

        case 'ADD_GOAL':
        case 'UPDATE_GOAL':
          final Map<String, dynamic> data = {'id': payloadMap['id']};
          if (payloadMap.containsKey('studentId')) data['student_id'] = payloadMap['studentId'];
          if (payloadMap.containsKey('title')) data['title'] = payloadMap['title'];
          if (payloadMap.containsKey('isCompleted')) data['is_completed'] = payloadMap['isCompleted'];

          await client.from('goals').upsert(data);
          break;

        case 'ADD_JOURNAL':
          final Map<String, dynamic> data = {
            'id': payloadMap['id'],
            'student_id': payloadMap['studentId'] ?? '1',
            'date': DateTime.now().toIso8601String(),
            'content': payloadMap['content'] ?? '',
          };
          if (payloadMap.containsKey('mood')) data['mood'] = payloadMap['mood'];

          await client.from('journal_entries').upsert(data);
          break;

        case 'UPDATE_PARENT_PROFILE':
          final Map<String, dynamic> data = {'id': payloadMap['id']};
          if (payloadMap.containsKey('displayName')) data['display_name'] = payloadMap['displayName'];
          if (payloadMap.containsKey('email')) data['email'] = payloadMap['email'];
          if (payloadMap.containsKey('notifyOnTaskCompletion')) data['notify_on_task_completion'] = payloadMap['notifyOnTaskCompletion'];
          if (payloadMap.containsKey('notifyOnMoodDrop')) data['notify_on_mood_drop'] = payloadMap['notifyOnMoodDrop'];
          if (payloadMap.containsKey('canViewJournal')) data['can_view_journal'] = payloadMap['canViewJournal'];

          await client.from('parent_profiles').upsert(data);
          break;

        default:
          return true; // Ignore mock/other mutations
      }
      return true;
    } catch (e) {
      // In case of network errors, return false to keep the mutation in queue
      return false;
    }
  }
}
