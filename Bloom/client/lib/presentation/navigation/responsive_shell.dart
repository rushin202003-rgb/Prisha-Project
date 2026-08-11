import 'package:flutter/material.dart';
import '../../domain/repositories/student_repository.dart';
import '../../core/offline_manager.dart';
import '../../domain/services/ai_gateway.dart';
import '../../domain/services/auth_service.dart';
import '../screens/today_screen.dart';
import '../screens/planner_screen.dart';
import '../screens/learn_screen.dart';
import '../screens/hobbies_screen.dart';
import '../screens/life_screen.dart';
import '../screens/progress_screen.dart';
import '../screens/settings_screen.dart';

class ResponsiveShell extends StatefulWidget {
  final StudentRepository repository;
  final OfflineManager offlineManager;
  final AIGateway aiGateway;
  final AuthService authService;

  const ResponsiveShell({
    super.key, 
    required this.repository, 
    required this.offlineManager,
    required this.aiGateway,
    required this.authService,
  });

  @override
  State<ResponsiveShell> createState() => _ResponsiveShellState();
}

class _ResponsiveShellState extends State<ResponsiveShell> {
  int _selectedIndex = 0;

  late final List<Widget> _screens = [
    TodayScreen(
      repository: widget.repository, 
      offlineManager: widget.offlineManager,
      aiGateway: widget.aiGateway,
    ),
    PlannerScreen(repository: widget.repository),
    LearnScreen(repository: widget.repository),
    HobbiesScreen(repository: widget.repository, offlineManager: widget.offlineManager),
    LifeScreen(repository: widget.repository, offlineManager: widget.offlineManager),
    ProgressScreen(repository: widget.repository),
    SettingsScreen(repository: widget.repository, offlineManager: widget.offlineManager, authService: widget.authService),
  ];

  final List<NavigationDestination> _destinations = const [
    NavigationDestination(icon: Icon(Icons.wb_sunny_outlined), label: 'Today'),
    NavigationDestination(icon: Icon(Icons.calendar_month_outlined), label: 'Planner'),
    NavigationDestination(icon: Icon(Icons.school_outlined), label: 'Learn'),
    NavigationDestination(icon: Icon(Icons.palette_outlined), label: 'Hobbies'),
    NavigationDestination(icon: Icon(Icons.favorite_outline), label: 'Life'),
    NavigationDestination(icon: Icon(Icons.emoji_events_outlined), label: 'Progress'),
    NavigationDestination(icon: Icon(Icons.settings_outlined), label: 'Settings'),
  ];

  final List<NavigationRailDestination> _railDestinations = const [
    NavigationRailDestination(icon: Icon(Icons.wb_sunny_outlined), label: Text('Today')),
    NavigationRailDestination(icon: Icon(Icons.calendar_month_outlined), label: Text('Planner')),
    NavigationRailDestination(icon: Icon(Icons.school_outlined), label: Text('Learn')),
    NavigationRailDestination(icon: Icon(Icons.palette_outlined), label: Text('Hobbies')),
    NavigationRailDestination(icon: Icon(Icons.favorite_outline), label: Text('Life')),
    NavigationRailDestination(icon: Icon(Icons.emoji_events_outlined), label: Text('Progress')),
    NavigationRailDestination(icon: Icon(Icons.settings_outlined), label: Text('Settings')),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          // Mobile View
          return Scaffold(
            body: _screens[_selectedIndex],
            bottomNavigationBar: NavigationBar(
              selectedIndex: _selectedIndex,
              onDestinationSelected: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              destinations: _destinations,
            ),
          );
        } else {
          // Tablet/Desktop View
          return Scaffold(
            body: Row(
              children: [
                NavigationRail(
                  selectedIndex: _selectedIndex,
                  onDestinationSelected: (index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  labelType: NavigationRailLabelType.all,
                  destinations: _railDestinations,
                ),
                const VerticalDivider(thickness: 1, width: 1),
                Expanded(child: _screens[_selectedIndex]),
              ],
            ),
          );
        }
      },
    );
  }
}
