import 'package:cloud_firestore/cloud_firestore.dart';
import '../../data/models/assignment_model.dart';
import '../constants/firestore_constants.dart';

class AssignmentService {
  final FirebaseFirestore _firestore;

  AssignmentService(this._firestore);

  Future<void> assignPsychiatrist(
    String studentId,
    String psychiatristId,
  ) async {
    final assignment = AssignmentModel(
      id: '',
      studentId: studentId,
      psychiatristId: psychiatristId,
      assignedAt: DateTime.now(),
    );

    await _firestore
        .collection(FirestoreConstants.assignmentsCollection)
        .add(assignment.toMap());
  }

  Future<AssignmentModel?> getStudentAssignment(String studentId) async {
    final snapshot = await _firestore
        .collection(FirestoreConstants.assignmentsCollection)
        .where(FirestoreConstants.studentIdField, isEqualTo: studentId)
        .where(FirestoreConstants.statusField, isEqualTo: 'active')
        .limit(1)
        .get();

    if (snapshot.docs.isEmpty) return null;

    return AssignmentModel.fromMap(
      snapshot.docs.first.data(),
      snapshot.docs.first.id,
    );
  }

  Future<List<AssignmentModel>> getPsychiatristAssignments(
    String psychiatristId,
  ) async {
    final snapshot = await _firestore
        .collection(FirestoreConstants.assignmentsCollection)
        .where(FirestoreConstants.psychiatristIdField, isEqualTo: psychiatristId)
        .where(FirestoreConstants.statusField, isEqualTo: 'active')
        .get();

    return snapshot.docs
        .map((doc) => AssignmentModel.fromMap(doc.data(), doc.id))
        .toList();
  }
}
