class MoodEntry {
  final DateTime date;
  final String mood;

  MoodEntry({required this.date, required this.mood});

  Map<String, dynamic> toJson() => {
        'date': date.toIso8601String(),
        'mood': mood,
      };

  static MoodEntry fromJson(Map<String, dynamic> json) {
    return MoodEntry(
      date: DateTime.parse(json['date']),
      mood: json['mood'],
    );
  }
}
