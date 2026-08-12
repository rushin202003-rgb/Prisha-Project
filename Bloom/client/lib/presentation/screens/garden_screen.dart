import 'package:flutter/material.dart';

class GardenScreen extends StatefulWidget {
  const GardenScreen({super.key});

  @override
  State<GardenScreen> createState() => _GardenScreenState();
}

class _GardenScreenState extends State<GardenScreen> {
  String _currentTheme = 'Day Garden';

  final Map<String, List<Color>> _themeGradients = {
    'Day Garden': [Colors.lightBlue[100]!, Colors.lightGreen[100]!],
    'Night Garden': [Colors.indigo[900]!, Colors.deepPurple[900]!],
    'Tropical': [Colors.orange[100]!, Colors.teal[100]!],
    'Winter': [Colors.blue[50]!, Colors.cyan[100]!],
    'Rainbow': [Colors.pink[100]!, Colors.yellow[100]!],
  };

  void _showThemeSelector() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView(
          padding: const EdgeInsets.all(16.0),
          shrinkWrap: true,
          children: _themeGradients.keys.map((themeName) {
            return ListTile(
              title: Text(themeName),
              trailing: _currentTheme == themeName
                  ? const Icon(Icons.check, color: Colors.pinkAccent)
                  : null,
              onTap: () {
                setState(() {
                  _currentTheme = themeName;
                });
                Navigator.of(context).pop();
              },
            );
          }).toList(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Bloom Garden 🌸 - $_currentTheme'),
        actions: [
          IconButton(
            icon: const Icon(Icons.color_lens),
            tooltip: 'Customize Garden Theme',
            onPressed: _showThemeSelector,
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: _themeGradients[_currentTheme]!,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 40,
              left: 50,
              child: _buildFlower(Colors.pink, 'Mathematics Level 1'),
            ),
            Positioned(
              bottom: 60,
              right: 80,
              child: _buildFlower(Colors.deepPurple, 'Science Explorer'),
            ),
            Positioned(
              bottom: 30,
              right: 150,
              child: _buildFlower(Colors.orange, 'Hobby Hero'),
            ),
            // Floating butterfly
            Positioned(
              top: 150,
              left: 100,
              child: Text(_currentTheme == 'Winter' ? '❄️' : '🦋',
                  style: const TextStyle(fontSize: 40)),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Text(
                    'Your garden is blooming beautifully! Keep completing tasks to plant more flowers.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFlower(Color color, String tooltip) {
    return Tooltip(
      message: tooltip,
      child: Column(
        children: [
          Icon(Icons.local_florist, size: 64, color: color),
          Container(width: 8, height: 40, color: Colors.green), // stem
        ],
      ),
    );
  }
}
