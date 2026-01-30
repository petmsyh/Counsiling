import 'package:cloud_firestore/cloud_firestore.dart';
import '../../data/models/session_model.dart';
import '../constants/firestore_constants.dart';

class SessionService {
  final FirebaseFirestore _firestore;

  SessionService(this._firestore);

  Future<void> createSession(SessionModel session) async {
    await _firestore
        .collection(FirestoreConstants.sessionsCollection)
        .add(session.toMap());
  }

  Future<void> updateSession(String sessionId, SessionModel session) async {
    await _firestore
        .collection(FirestoreConstants.sessionsCollection)
        .doc(sessionId)
        .update(session.toMap());
  }

  Future<List<SessionModel>> getStudentSessions(String studentId) async {
    final snapshot = await _firestore
        .collection(FirestoreConstants.sessionsCollection)
        .where(FirestoreConstants.studentIdField, isEqualTo: studentId)
        .orderBy(FirestoreConstants.timestampField, descending: true)
        .get();

    return snapshot.docs
        .map((doc) => SessionModel.fromMap(doc.data(), doc.id))
        .toList();
  }

  Future<SessionModel?> getLatestSession(String studentId) async {
    final snapshot = await _firestore
        .collection(FirestoreConstants.sessionsCollection)
        .where(FirestoreConstants.studentIdField, isEqualTo: studentId)
        .orderBy(FirestoreConstants.timestampField, descending: true)
        .limit(1)
        .get();

    if (snapshot.docs.isEmpty) return null;

    return SessionModel.fromMap(
      snapshot.docs.first.data(),
      snapshot.docs.first.id,
    );
  }
}
