import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/background_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final backgroundManager = Provider.of<BackgroundManager>(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
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
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: ListView(
                children: [
                  Text(
                    "Welcome Back 🌸",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Your haven for healing, peace & reflection 💭",
                    style: TextStyle(
                      fontSize: 16,
                      color: isDark ? Colors.white70 : Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _quickCard(
                    context,
                    icon: Icons.edit_note_rounded,
                    title: 'Write a Journal',
                    subtitle: 'Reflect your thoughts ✍️',
                    route: '/journal',
                    color: Colors.tealAccent.withOpacity(0.2),
                  ),
                  _quickCard(
                    context,
                    icon: Icons.emoji_emotions_outlined,
                    title: 'Track Mood',
                    subtitle: 'Check in with your emotions 💗',
                    route: '/mood',
                    color: Colors.pinkAccent.withOpacity(0.15),
                  ),
                  _quickCard(
                    context,
                    icon: Icons.self_improvement,
                    title: 'Start Meditation',
                    subtitle: 'Calm your breath 🧘',
                    route: '/mindfulness',
                    color: Colors.deepPurpleAccent.withOpacity(0.15),
                  ),
                  _quickCard(
                    context,
                    icon: Icons.auto_stories_rounded,
                    title: 'Memory Lane',
                    subtitle: 'Read past memories 🕰️',
                    route: '/memory',
                    color: Colors.amberAccent.withOpacity(0.2),
                  ),
                  const SizedBox(height: 30),
                  _summaryBox(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _quickCard(BuildContext context,
      {required IconData icon,
      required String title,
      required String subtitle,
      required String route,
      required Color color}) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              blurRadius: 4,
              color: Colors.black26,
              offset: Offset(0, 2),
            )
          ],
        ),
        child: Row(
          children: [
            Icon(icon, size: 30, color: Colors.deepPurple),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          )),
                  const SizedBox(height: 4),
                  Text(subtitle,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontStyle: FontStyle.italic, color: Colors.black54)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _summaryBox(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark
            ? Colors.grey.withOpacity(0.3)
            : Colors.white.withOpacity(0.7),
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(blurRadius: 6, offset: Offset(0, 2), color: Colors.black26)
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Today’s Task Track",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : Colors.black87)),
          const SizedBox(height: 12),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _summaryItem("Mood", "😊"),
              _summaryItem("Journal", "2 Entries"),
              _summaryItem("Mindful", "1 Session"),
            ],
          )
        ],
      ),
    );
  }
}

class _summaryItem extends StatelessWidget {
  final String title;
  final String value;
  const _summaryItem(this.title, this.value);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        Text(value,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.white : Colors.black)),
        const SizedBox(height: 4),
        Text(title,
            style: TextStyle(
              fontSize: 14,
              color: isDark ? Colors.white70 : Colors.black54,
            )),
      ],
    );
  }
}
