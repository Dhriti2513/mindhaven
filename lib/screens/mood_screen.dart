import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/background_manager.dart';

class MoodScreen extends StatefulWidget {
  const MoodScreen({super.key});

  @override
  State<MoodScreen> createState() => _MoodScreenState();
}

class _MoodScreenState extends State<MoodScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  Map<String, String> _moodMap = {};
  final List<String> _emojis = ['😊', '😔', '😡', '😐', '😭', '💖', '🤯', '😴'];

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _loadMoodMap();
  }

  Future<void> _loadMoodMap() async {
    final prefs = await SharedPreferences.getInstance();
    final map = prefs.getString('mood_map');
    if (map != null) {
      try {
        _moodMap = Map<String, String>.from(jsonDecode(map));
      } catch (e) {
        _moodMap = {};
      }
    }
    setState(() {});
  }

  Future<void> _saveMood(String mood) async {
    final prefs = await SharedPreferences.getInstance();
    final date = _selectedDay!.toIso8601String().split("T").first;
    _moodMap[date] = mood;
    await prefs.setString('mood_map', jsonEncode(_moodMap));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final backgroundManager = Provider.of<BackgroundManager>(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bgImage = backgroundManager.getBackgroundPath(isDark);
    final textColor = isDark ? Colors.white : Colors.black87;
    final overlayColor =
        isDark ? Colors.black.withOpacity(0.4) : Colors.white.withOpacity(0.2);
    final todayKey = _selectedDay?.toIso8601String().split("T").first ?? '';
    final todayMood = _moodMap[todayKey];

    return Scaffold(
      appBar: AppBar(
        title: Text("Mood Tracker 💖", style: TextStyle(color: textColor)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: textColor),
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
          Container(color: overlayColor),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                children: [
                  TableCalendar(
                    firstDay: DateTime.utc(2020, 1, 1),
                    lastDay: DateTime.utc(2100, 12, 31),
                    focusedDay: _focusedDay,
                    selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                    calendarFormat: CalendarFormat.month,
                    onDaySelected: (selected, focused) {
                      setState(() {
                        _selectedDay = selected;
                        _focusedDay = focused;
                      });
                    },
                    calendarStyle: CalendarStyle(
                      todayDecoration: BoxDecoration(
                        color: Colors.deepPurple.shade300,
                        shape: BoxShape.circle,
                      ),
                      selectedDecoration: BoxDecoration(
                        color: Colors.amber.shade400,
                        shape: BoxShape.circle,
                      ),
                      defaultTextStyle: TextStyle(color: textColor),
                      weekendTextStyle: TextStyle(color: textColor),
                    ),
                    daysOfWeekStyle: DaysOfWeekStyle(
                      weekdayStyle: TextStyle(color: textColor),
                      weekendStyle: TextStyle(color: textColor),
                    ),
                    headerStyle: HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                      titleTextStyle: TextStyle(color: textColor, fontSize: 18),
                      leftChevronIcon:
                          Icon(Icons.chevron_left, color: textColor),
                      rightChevronIcon:
                          Icon(Icons.chevron_right, color: textColor),
                    ),
                    calendarBuilders: CalendarBuilders(
                      defaultBuilder: (context, day, _) {
                        final dateKey = day.toIso8601String().split("T").first;
                        final emoji = _moodMap[dateKey];
                        if (emoji != null) {
                          return Center(
                            child: Text(
                              emoji,
                              style: const TextStyle(fontSize: 18),
                            ),
                          );
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "How are you feeling today?",
                    style: TextStyle(color: textColor, fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 10,
                    children: _emojis.map((emoji) {
                      return GestureDetector(
                        onTap: () => _saveMood(emoji),
                        child:
                            Text(emoji, style: const TextStyle(fontSize: 32)),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),
                  if (todayMood != null)
                    _infoCard("You're feeling $todayMood today 🫂", context)
                  else
                    _infoCard("No mood logged for today 😶", context),
                  const SizedBox(height: 16),
                  _buildMoodHistory(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoCard(String text, BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark
            ? Colors.black.withOpacity(0.6)
            : Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          color: isDark ? Colors.white : Colors.black87,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }

  Widget _buildMoodHistory(BuildContext context) {
    final sortedKeys = _moodMap.keys.toList()..sort((a, b) => b.compareTo(a));

    if (sortedKeys.isEmpty) {
      return _infoCard("No mood history yet 💭", context);
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: sortedKeys.length,
      itemBuilder: (context, index) {
        final date = sortedKeys[index];
        final mood = _moodMap[date]!;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.grey.withOpacity(0.3)
                  : Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(date, style: const TextStyle(fontSize: 14)),
                Text(mood, style: const TextStyle(fontSize: 20)),
              ],
            ),
          ),
        );
      },
    );
  }
}
