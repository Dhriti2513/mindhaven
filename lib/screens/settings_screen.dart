import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme_manager.dart';
import '../utils/background_manager.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    final backgroundManager = Provider.of<BackgroundManager>(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bgImage = backgroundManager.getBackgroundPath(isDark);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              bgImage,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: isDark
                ? Colors.black.withOpacity(0.6)
                : Colors.white.withOpacity(0.4),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: ListView(
              children: [
                const Text("Theme Mode",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ChoiceChip(
                      label: const Text("Light"),
                      selected: themeManager.themeMode == ThemeMode.light,
                      onSelected: (_) =>
                          themeManager.toggleTheme(ThemeMode.light),
                    ),
                    ChoiceChip(
                      label: const Text("Dark"),
                      selected: themeManager.themeMode == ThemeMode.dark,
                      onSelected: (_) =>
                          themeManager.toggleTheme(ThemeMode.dark),
                    ),
                    ChoiceChip(
                      label: const Text("System"),
                      selected: themeManager.themeMode == ThemeMode.system,
                      onSelected: (_) =>
                          themeManager.toggleTheme(ThemeMode.system),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                const Text("Background Theme",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 16,
                  runSpacing: 12,
                  alignment: WrapAlignment.center,
                  children: [
                    _bgChip(context, "Default", "", backgroundManager),
                    _bgChip(context, "Calm", "calm", backgroundManager),
                    _bgChip(context, "Forest", "forest", backgroundManager),
                    _bgChip(context, "Galaxy", "galaxy", backgroundManager),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _bgChip(BuildContext context, String label, String value,
      BackgroundManager backgroundManager) {
    return ChoiceChip(
      label: Text(label),
      selected: backgroundManager.backgroundTheme == value,
      onSelected: (_) => backgroundManager.changeBackgroundTheme(value),
      selectedColor: Colors.deepPurpleAccent.withOpacity(0.2),
      backgroundColor: Colors.grey.shade200,
      labelStyle: const TextStyle(fontWeight: FontWeight.bold),
      elevation: 2,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    );
  }
}
