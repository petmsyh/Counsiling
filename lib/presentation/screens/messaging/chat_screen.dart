import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import '../../widgets/message_input_widget.dart';
import '../../../core/services/firebase_service.dart';
import '../../../core/services/assignment_service.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  String? _psychiatristId;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadAssignment();
  }

  Future<void> _loadAssignment() async {
    final authProvider = context.read<AuthProvider>();
    final firebaseService = FirebaseService();
    final assignmentService = AssignmentService(
      firebaseService.firestore,
    );

    final assignment = await assignmentService.getStudentAssignment(
      authProvider.user!.uid,
    );

    setState(() {
      _psychiatristId = assignment?.psychiatristId;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (_psychiatristId == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Chat')),
        body: const Center(
          child: Text('No psychiatrist assigned yet'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat with Counselor'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.grey[100],
              child: const Center(
                child: Text('Messages will appear here'),
              ),
            ),
          ),
          MessageInputWidget(controller: _messageController),
        ],
      ),
    );
  }
}
