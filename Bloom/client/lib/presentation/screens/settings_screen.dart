import 'package:flutter/material.dart';
import '../../domain/repositories/student_repository.dart';
import '../../core/offline_manager.dart';
import '../../domain/services/auth_service.dart';
import 'parent_dashboard_screen.dart';

class SettingsScreen extends StatelessWidget {
  final StudentRepository repository;
  final OfflineManager offlineManager;
  final AuthService authService;
  const SettingsScreen({
    super.key,
    required this.repository,
    required this.offlineManager,
    required this.authService,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          const ListTile(
              leading: Icon(Icons.person), title: Text('Student Profile')),
          const ListTile(
              leading: Icon(Icons.smart_toy),
              title: Text('AI Companion Configuration')),
          const ListTile(
              leading: Icon(Icons.notifications), title: Text('Notifications')),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.admin_panel_settings,
                color: Colors.deepPurple),
            title: const Text('Parent Gateway'),
            subtitle: const Text('Locked with PIN'),
            trailing: const Icon(Icons.lock),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => ParentDashboardScreen(
                  repository: repository,
                  offlineManager: offlineManager,
                  authService: authService,
                ),
              ));
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.exit_to_app, color: Colors.red),
            title: const Text('Sign Out', style: TextStyle(color: Colors.red)),
            onTap: () async {
              await authService.signOut();
            },
          ),
        ],
      ),
    );
  }
}
