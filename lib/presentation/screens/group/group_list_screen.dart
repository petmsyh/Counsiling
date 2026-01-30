import 'package:flutter/material.dart';

class GroupListScreen extends StatelessWidget {
  const GroupListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Group Venting'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'Anonymous Group Sessions',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          _buildGroupCard(
            'General Support',
            'Open discussion for all students',
            12,
          ),
          const SizedBox(height: 12),
          _buildGroupCard(
            'Academic Stress',
            'Share your academic challenges',
            8,
          ),
          const SizedBox(height: 12),
          _buildGroupCard(
            'Social Anxiety',
            'Connect with others facing similar issues',
            5,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildGroupCard(String title, String description, int members) {
    return Card(
      child: ListTile(
        leading: const CircleAvatar(
          child: Icon(Icons.group),
        ),
        title: Text(title),
        subtitle: Text(description),
        trailing: Text('$members members'),
        onTap: () {},
      ),
    );
  }
}
