import 'package:flutter/material.dart';
import '../../domain/repositories/student_repository.dart';
import '../../domain/models/parent_profile.dart';
import '../../core/offline_manager.dart';
import '../../domain/services/auth_service.dart';

class ParentDashboardScreen extends StatefulWidget {
  final StudentRepository repository;
  final OfflineManager offlineManager;
  final AuthService authService;

  const ParentDashboardScreen({
    super.key,
    required this.repository,
    required this.offlineManager,
    required this.authService,
  });

  @override
  State<ParentDashboardScreen> createState() => _ParentDashboardScreenState();
}

class _ParentDashboardScreenState extends State<ParentDashboardScreen> {
  bool _isUnlocked = false;
  final TextEditingController _pinController = TextEditingController();

  void _verifyPin() {
    if (_pinController.text == '1234') {
      setState(() {
        _isUnlocked = true;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Incorrect PIN.')),
      );
    }
  }

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isUnlocked) {
      return Scaffold(
        appBar: AppBar(title: const Text('Parent Gateway 🔒')),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.lock, size: 64, color: Colors.grey),
                const SizedBox(height: 16),
                const Text(
                    'Enter Parent PIN to unlock analytics and settings.'),
                const SizedBox(height: 32),
                TextField(
                  controller: _pinController,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '****',
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _verifyPin,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurpleAccent,
                      foregroundColor: Colors.white),
                  child: const Text('Unlock'),
                ),
              ],
            ),
          ),
        ),
      );
    }

    // Unlocked Dashboard
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parent Dashboard 🛡️'),
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.white,
      ),
      body: StreamBuilder<ParentProfile?>(
        stream: widget.repository.watchParentProfile('p1'),
        builder: (context, snapshot) {
          final profile = snapshot.data ??
              ParentProfile(
                id: 'p1',
                displayName: 'Parent',
                email: 'parent@bloom.com',
                notifyOnTaskCompletion: true,
                notifyOnMoodDrop: true,
                canViewJournal: false,
              );

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const Text('Weekly Analytics',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              const Card(
                child: ListTile(
                  leading: Icon(Icons.check_circle, color: Colors.green),
                  title: Text('Task Completion Rate'),
                  trailing: Text('85%',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ),
              const Card(
                child: ListTile(
                  leading: Icon(Icons.timer, color: Colors.orange),
                  title: Text('Average Daily Study Time'),
                  trailing: Text('1h 15m',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(height: 32),
              const Text('Settings & Controls',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              SwitchListTile(
                title: const Text('Notify on Task Completion'),
                value: profile.notifyOnTaskCompletion,
                onChanged: (val) async {
                  final updated = ParentProfile(
                    id: profile.id,
                    displayName: profile.displayName,
                    email: profile.email,
                    notifyOnTaskCompletion: val,
                    notifyOnMoodDrop: profile.notifyOnMoodDrop,
                    canViewJournal: profile.canViewJournal,
                  );
                  await widget.repository.saveParentProfile(updated);
                  await widget.offlineManager.queueMutation(
                    'UPDATE_PARENT_PROFILE',
                    '{"id": "${profile.id}", "notifyOnTaskCompletion": $val}',
                  );
                },
              ),
              SwitchListTile(
                title: const Text('Notify on Mood Drop'),
                value: profile.notifyOnMoodDrop,
                onChanged: (val) async {
                  final updated = ParentProfile(
                    id: profile.id,
                    displayName: profile.displayName,
                    email: profile.email,
                    notifyOnTaskCompletion: profile.notifyOnTaskCompletion,
                    notifyOnMoodDrop: val,
                    canViewJournal: profile.canViewJournal,
                  );
                  await widget.repository.saveParentProfile(updated);
                  await widget.offlineManager.queueMutation(
                    'UPDATE_PARENT_PROFILE',
                    '{"id": "${profile.id}", "notifyOnMoodDrop": $val}',
                  );
                },
              ),
              SwitchListTile(
                title: const Text('Allow viewing child diary'),
                value: profile.canViewJournal,
                onChanged: (val) async {
                  final updated = ParentProfile(
                    id: profile.id,
                    displayName: profile.displayName,
                    email: profile.email,
                    notifyOnTaskCompletion: profile.notifyOnTaskCompletion,
                    notifyOnMoodDrop: profile.notifyOnMoodDrop,
                    canViewJournal: val,
                  );
                  await widget.repository.saveParentProfile(updated);
                  await widget.offlineManager.queueMutation(
                    'UPDATE_PARENT_PROFILE',
                    '{"id": "${profile.id}", "canViewJournal": $val}',
                  );
                },
              ),
              const Divider(height: 32),
              ListTile(
                leading: const Icon(Icons.download),
                title: const Text('Export Student Data'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.delete, color: Colors.red),
                title: const Text('Delete Account',
                    style: TextStyle(color: Colors.red)),
                onTap: () {
                  final deleteConfirmController = TextEditingController();
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Confirm Account Deletion ⚠️',
                          style: TextStyle(color: Colors.red)),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text(
                            'Warning: Deleting your account will scrub all child study planners, moods, journals, and dashboard settings forever to comply with COPPA and GDPR. This cannot be undone.',
                          ),
                          const SizedBox(height: 16),
                          const Text(
                              'Please type "DELETE" in all caps below to confirm:'),
                          const SizedBox(height: 8),
                          TextField(
                            controller: deleteConfirmController,
                            decoration: const InputDecoration(
                              hintText: 'DELETE',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () async {
                            if (deleteConfirmController.text == 'DELETE') {
                              Navigator.of(context)
                                  .pop(); // Dismiss confirmation dialog
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (_) => const Center(
                                    child: CircularProgressIndicator()),
                              );

                              await widget.repository.clearAllUserData();
                              await widget.authService.deleteAccount();

                              if (mounted) {
                                Navigator.of(context).pop(); // Dismiss spinner
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'Account and all cached child data scrubbed safely.')),
                                );
                                Navigator.of(context)
                                    .popUntil((route) => route.isFirst);
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text('Input does not match "DELETE".')),
                              );
                            }
                          },
                          child: const Text('Scrub & Delete',
                              style: TextStyle(color: Colors.red)),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
