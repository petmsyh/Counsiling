import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../core/services/firebase_service.dart';
import '../../core/constants/user_roles.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseService _firebaseService;
  User? _user;
  UserRole? _userRole;
  bool _isLoading = false;

  AuthProvider(this._firebaseService) {
    _init();
  }

  User? get user => _user;
  UserRole? get userRole => _userRole;
  bool get isLoading => _isLoading;
  bool get isAuthenticated => _user != null;

  void _init() {
    _firebaseService.authStateChanges.listen((user) async {
      _user = user;
      if (user != null) {
        _userRole = await _firebaseService.getUserRole(user.uid);
      } else {
        _userRole = null;
      }
      notifyListeners();
    });
  }

  Future<void> signInAnonymously(UserRole role) async {
    _isLoading = true;
    notifyListeners();

    try {
      final credential = await _firebaseService.signInAnonymously();
      await _firebaseService.setUserRole(credential.user!.uid, role);
      _user = credential.user;
      _userRole = role;
    } catch (e) {
      print('Sign in error: $e');
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signOut() async {
    await _firebaseService.auth.signOut();
    _user = null;
    _userRole = null;
    notifyListeners();
  }
}
