class AssignmentModel {
  final String id;
  final String studentId;
  final String psychiatristId;
  final DateTime assignedAt;
  final String status;

  AssignmentModel({
    required this.id,
    required this.studentId,
    required this.psychiatristId,
    required this.assignedAt,
    this.status = 'active',
  });

  factory AssignmentModel.fromMap(Map<String, dynamic> map, String id) {
    return AssignmentModel(
      id: id,
      studentId: map['studentId'] ?? '',
      psychiatristId: map['psychiatristId'] ?? '',
      assignedAt: DateTime.parse(map['assignedAt'] ?? DateTime.now().toIso8601String()),
      status: map['status'] ?? 'active',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'studentId': studentId,
      'psychiatristId': psychiatristId,
      'assignedAt': assignedAt.toIso8601String(),
      'status': status,
    };
  }
}
