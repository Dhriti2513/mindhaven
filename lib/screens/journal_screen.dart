import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/background_manager.dart';
import '../services/firestore_service.dart';

class JournalScreen extends StatefulWidget {
  const JournalScreen({super.key});

  @override
  State<JournalScreen> createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
  final TextEditingController _controller = TextEditingController();
  List<String> _entries = [];
  final FirestoreService _firestoreService = FirestoreService();

  @override
  void initState() {
    super.initState();
    _loadEntries();
  }

  Future<void> _loadEntries() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _entries = prefs.getStringList('journal_entries') ?? [];
    });
  }

  Future<void> _saveEntry() async {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _entries.insert(0, text);
      _controller.clear();
    });

    await prefs.setStringList('journal_entries', _entries);

    // 💌 Save to Firestore too
    await _firestoreService.saveJournal("Journal Entry", text);
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundManager = Provider.of<BackgroundManager>(context);
    final bgImage = backgroundManager.getBackgroundPath(isDark);
    final overlayColor =
        isDark ? Colors.black.withOpacity(0.4) : Colors.white.withOpacity(0.3);
    final textColor = isDark ? Colors.white : Colors.black87;

    return Scaffold(
      appBar: AppBar(
        title: Text("Journal ✍️", style: TextStyle(color: textColor)),
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
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  TextField(
                    controller: _controller,
                    maxLines: 4,
                    style: TextStyle(color: textColor),
                    decoration: InputDecoration(
                      hintText: 'What’s on your mind today?',
                      hintStyle: TextStyle(color: textColor.withOpacity(0.6)),
                      filled: true,
                      fillColor: isDark
                          ? Colors.white.withOpacity(0.1)
                          : Colors.black.withOpacity(0.05),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: _saveEntry,
                    icon: const Icon(Icons.save),
                    label: const Text("Save Entry"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 14),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: _entries.isEmpty
                        ? Center(
                            child: Text(
                              "No journal entries yet 😌",
                              style: TextStyle(
                                  color: textColor.withOpacity(0.8),
                                  fontStyle: FontStyle.italic),
                            ),
                          )
                        : ListView.builder(
                            itemCount: _entries.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.symmetric(vertical: 8),
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: isDark
                                      ? Colors.white.withOpacity(0.1)
                                      : Colors.black.withOpacity(0.05),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  _entries[index],
                                  style:
                                      TextStyle(color: textColor, fontSize: 15),
                                ),
                              );
                            },
                          ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
