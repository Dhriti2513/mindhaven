import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/background_manager.dart';

class MindfulnessScreen extends StatefulWidget {
  const MindfulnessScreen({super.key});

  @override
  State<MindfulnessScreen> createState() => _MindfulnessScreenState();
}

class _MindfulnessScreenState extends State<MindfulnessScreen>
    with SingleTickerProviderStateMixin {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;
  String _selectedTrack = '';
  int _sessionDuration = 2;
  bool _sessionActive = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  final List<String> _tracks = [
    'Promise.mp3',
    'Still With You.mp3',
    'Winter-Bear.mp3',
    'rain.mp3',
    'forest.mp3',
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..addListener(() {
        if (!_sessionActive) _controller.stop();
      });

    _animation = Tween<double>(begin: 80, end: 140).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _startSession() async {
    if (_selectedTrack.isEmpty) return;

    setState(() {
      _sessionActive = true;
      _isPlaying = true;
    });

    _controller.repeat(reverse: true);
    await _audioPlayer.play(AssetSource('audio/$_selectedTrack'));

    await Future.delayed(Duration(minutes: _sessionDuration));
    if (mounted) {
      setState(() {
        _sessionActive = false;
        _isPlaying = false;
      });
    }
    _controller.stop();
    await _audioPlayer.stop();

    final prefs = await SharedPreferences.getInstance();
    int completed = prefs.getInt('mindful_sessions') ?? 0;
    prefs.setInt('mindful_sessions', completed + 1);
  }

  Future<void> _selectTrack(String track) async {
    if (_isPlaying) await _audioPlayer.stop();
    setState(() {
      _selectedTrack = track;
      _isPlaying = false;
      _sessionActive = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final backgroundManager = Provider.of<BackgroundManager>(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bgImage = backgroundManager.getBackgroundPath(isDark);
    final overlayColor =
        isDark ? Colors.black.withOpacity(0.4) : Colors.white.withOpacity(0.3);
    final textColor = isDark ? Colors.white : Colors.black87;

    return Scaffold(
      appBar: AppBar(
        title: Text("Mindfulness 🧘", style: TextStyle(color: textColor)),
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
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Text(
                    '🧘 Start Your Mindfulness Session',
                    style: TextStyle(
                      fontSize: 20,
                      color: textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Duration: $_sessionDuration min',
                    style: TextStyle(color: textColor.withOpacity(0.7)),
                  ),
                  Slider(
                    min: 1,
                    max: 10,
                    divisions: 9,
                    value: _sessionDuration.toDouble(),
                    activeColor: Colors.purpleAccent,
                    label: '$_sessionDuration min',
                    onChanged: (value) {
                      setState(() => _sessionDuration = value.toInt());
                    },
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    alignment: WrapAlignment.center,
                    children: _tracks.map((track) {
                      final name = track.replaceAll('.mp3', '');
                      final isSelected = _selectedTrack == track;
                      return ElevatedButton(
                        onPressed: () => _selectTrack(track),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isSelected
                              ? Colors.deepPurple.shade200
                              : Colors.white,
                          foregroundColor: Colors.black87,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text(name),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),
                  if (_sessionActive)
                    AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) => Container(
                        width: _animation.value,
                        height: _animation.value,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.2),
                        ),
                        child: Center(
                          child: Text(
                            'Breathe In\nBreathe Out',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: textColor,
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ),
                    ),
                  const SizedBox(height: 30),
                  ElevatedButton.icon(
                    onPressed: _startSession,
                    icon: const Icon(Icons.play_circle),
                    label: const Text('Start Mindfulness Session'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 14),
                      backgroundColor: Colors.deepPurple.shade300,
                      foregroundColor: Colors.white,
                      elevation: 10,
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
