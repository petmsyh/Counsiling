class FollowUpModel {
  final String id;
  final String studentId;
  final String psychiatristId;
  final DateTime scheduledDate;
  final String status;
  final String notes;

  FollowUpModel({
    required this.id,
    required this.studentId,
    required this.psychiatristId,
    required this.scheduledDate,
    this.status = 'pending',
    this.notes = '',
  });

  factory FollowUpModel.fromMap(Map<String, dynamic> map, String id) {
    return FollowUpModel(
      id: id,
      studentId: map['studentId'] ?? '',
      psychiatristId: map['psychiatristId'] ?? '',
      scheduledDate: DateTime.parse(map['scheduledDate'] ?? DateTime.now().toIso8601String()),
      status: map['status'] ?? 'pending',
      notes: map['notes'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'studentId': studentId,
      'psychiatristId': psychiatristId,
      'scheduledDate': scheduledDate.toIso8601String(),
      'status': status,
      'notes': notes,
    };
  }
}
