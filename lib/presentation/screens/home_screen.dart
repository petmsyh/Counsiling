import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../../core/constants/user_roles.dart';
import 'student/student_home_screen.dart';
import 'psychiatrist/psychiatrist_home_screen.dart';
import 'admin/admin_home_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    final role = authProvider.userRole;

    if (role == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    switch (role) {
      case UserRole.student:
        return const StudentHomeScreen();
      case UserRole.psychiatrist:
        return const PsychiatristHomeScreen();
      case UserRole.administrator:
        return const AdminHomeScreen();
    }
  }
}
