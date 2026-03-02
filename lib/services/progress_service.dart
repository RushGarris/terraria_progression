import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProgressService {
  static final _db = FirebaseFirestore.instance;

  static String get _uid {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw StateError('Not logged in');
    }
    return user.uid;
  }

  static DocumentReference<Map<String, dynamic>> get _userDoc =>
      _db.collection('users').doc(_uid);

 
  static Future<void> saveProgress({
    String? selectedClass,
    List<String>? completedStages,
  }) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) throw StateError('Not logged in');

    final data = <String, dynamic>{
      'email': user.email,
      'updatedAt': FieldValue.serverTimestamp(),
    };

    if (selectedClass != null) data['selectedClass'] = selectedClass;
    if (completedStages != null) data['completedStages'] = completedStages;

    await _userDoc.set(data, SetOptions(merge: true));
  }

  static Future<void> markStageComplete(String stageId) async {
    await _userDoc.set({
      'completedStages': FieldValue.arrayUnion([stageId]),
      'updatedAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }

    static Stream<Map<String, dynamic>?> progressStream() {
    return _userDoc.snapshots().map((doc) => doc.data());
  }
  
}

