import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../constants/user_roles.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  FirebaseAuth get auth => _auth;
  FirebaseFirestore get firestore => _firestore;

  Future<UserCredential> signInAnonymously() async {
    return await _auth.signInAnonymously();
  }

  Future<void> setUserRole(String userId, UserRole role) async {
    await _firestore.collection('users').doc(userId).set({
      'role': role.name,
      'anonymousId': userId,
      'createdAt': DateTime.now().toIso8601String(),
      'lastActive': DateTime.now().toIso8601String(),
    }, SetOptions(merge: true));
  }

  Future<UserRole?> getUserRole(String userId) async {
    final doc = await _firestore.collection('users').doc(userId).get();
    if (!doc.exists) return null;
    
    final roleStr = doc.data()?['role'] as String?;
    if (roleStr == null) return null;
    
    return UserRoleExtension.fromString(roleStr);
  }

  Stream<User?> get authStateChanges => _auth.authStateChanges();
}
