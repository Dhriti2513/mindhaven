import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/background_manager.dart';

class MemoryScreen extends StatelessWidget {
  const MemoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final backgroundManager = Provider.of<BackgroundManager>(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bgImage = backgroundManager.getBackgroundPath(isDark);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Memory Lane 🕰️",
          style: TextStyle(
            color: isDark ? Colors.white : Colors.black87,
          ),
        ),
        backgroundColor: isDark
            ? Colors.black.withOpacity(0.7)
            : Colors.white.withOpacity(0.7),
        iconTheme: IconThemeData(color: isDark ? Colors.white : Colors.black87),
      ),
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
          SafeArea(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Text(
                  "Revisit Your Saved Memories",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : Colors.black87,
                  ),
                ),
                const SizedBox(height: 16),
                _memoryCard(
                  context,
                  title: "A Walk in the Rain",
                  content:
                      "The way droplets slid down my face, it felt like peace washing over pain...",
                  date: "June 24, 2024",
                ),
                _memoryCard(
                  context,
                  title: "Exam Day Tears",
                  content:
                      "The paper was tough but the resilience was tougher. I still showed up.",
                  date: "May 10, 2024",
                ),
                _memoryCard(
                  context,
                  title: "He Looked at Me",
                  content:
                      "Just once, but it felt like the world paused. I wish I could hold onto that forever.",
                  date: "April 5, 2024",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _memoryCard(BuildContext context,
      {required String title, required String content, required String date}) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: isDark
            ? Colors.white.withOpacity(0.1)
            : Colors.black.withOpacity(0.05),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isDark ? Colors.white24 : Colors.black12,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: isDark ? Colors.purple[100] : Colors.deepPurple,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            content,
            style: TextStyle(
              color: isDark ? Colors.white70 : Colors.black87,
              fontSize: 14,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            date,
            style: TextStyle(
              color: isDark ? Colors.grey[400] : Colors.grey[700],
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}
