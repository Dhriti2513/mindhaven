import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme_manager.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final themeManager = Provider.of<ThemeManager>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              isDark ? Icons.wb_sunny_rounded : Icons.nightlight_round,
              color: isDark ? Colors.amberAccent : Colors.deepPurple.shade400,
            ),
            onPressed: () {
              final newMode = isDark ? ThemeMode.light : ThemeMode.dark;
              themeManager.toggleTheme(newMode);
            },
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            isDark
                ? 'assets/images/bg_welcome_dark.jpeg'
                : 'assets/images/bg_welcome.jpg',
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(
              color: isDark ? Colors.black : Colors.white,
            ),
          ),
          Container(
            color: isDark
                ? Colors.black.withOpacity(0.6)
                : Colors.white.withOpacity(0.3),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Welcome to Haven 💜',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: isDark ? Colors.white : Colors.deepPurple.shade800,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/nav');
                  },
                  icon: const Icon(Icons.arrow_forward_ios_rounded),
                  label: const Text('Enter Haven'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple.shade400,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 14),
                    textStyle: const TextStyle(fontSize: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 8,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
