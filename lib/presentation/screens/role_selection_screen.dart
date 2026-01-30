import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/constants/user_roles.dart';
import '../providers/auth_provider.dart';
import '../widgets/role_card_widget.dart';
import 'home_screen.dart';

class RoleSelectionScreen extends StatefulWidget {
  const RoleSelectionScreen({super.key});

  @override
  State<RoleSelectionScreen> createState() => _RoleSelectionScreenState();
}

class _RoleSelectionScreenState extends State<RoleSelectionScreen> {
  bool _isLoading = false;

  Future<void> _selectRole(UserRole role) async {
    setState(() => _isLoading = true);

    try {
      await context.read<AuthProvider>().signInAnonymously(role);
      
      if (!mounted) return;
      
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    } catch (e) {
      if (!mounted) return;
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.psychology,
                size: 80,
                color: Colors.blue,
              ),
              const SizedBox(height: 20),
              const Text(
                'Select Your Role',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Your identity remains anonymous',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 40),
              RoleCard(
                title: 'Student',
                icon: Icons.school,
                onTap: () => _selectRole(UserRole.student),
                isLoading: _isLoading,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
