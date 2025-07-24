import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/home_screen.dart';
import '../screens/journal_screen.dart';
import '../screens/mood_screen.dart';
import '../screens/mindfulness_screen.dart';
import '../screens/memory_screen.dart';
import '../screens/settings_screen.dart';
import '../utils/background_manager.dart';

class NavWrapper extends StatefulWidget {
  const NavWrapper({super.key});

  @override
  State<NavWrapper> createState() => _NavWrapperState();
}

class _NavWrapperState extends State<NavWrapper> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    JournalScreen(),
    MoodScreen(),
    MindfulnessScreen(),
    MemoryScreen(),
    SettingsScreen(),
  ];

  final List<BottomNavigationBarItem> _navItems = const [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Journal'),
    BottomNavigationBarItem(icon: Icon(Icons.emoji_emotions), label: 'Mood'),
    BottomNavigationBarItem(icon: Icon(Icons.spa), label: 'Mind'),
    BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'Memory'),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundManager = Provider.of<BackgroundManager>(context);
    final bgImage = backgroundManager.getBackgroundPath(isDark);

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              bgImage,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) =>
                  Container(color: isDark ? Colors.black : Colors.white),
            ),
          ),
          Container(
            color: isDark
                ? Colors.black.withOpacity(0.5)
                : Colors.white.withOpacity(0.3),
          ),
          SafeArea(child: _screens[_currentIndex]),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: _navItems,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.black.withOpacity(0.8),
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
