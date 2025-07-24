import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Save a journal entry
  Future<void> saveJournal(String title, String content) async {
    await _db.collection('journals').add({
      'title': title,
      'content': content,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  // Get all journal entries
  Stream<QuerySnapshot> getJournals() {
    return _db
        .collection('journals')
        .orderBy('timestamp', descending: true)
        .snapshots();
  }
}
