class SessionModel {
  final String id;
  final String studentId;
  final String psychiatristId;
  final DateTime sessionDate;
  final String notes;
  final String observations;
  final List<String> followUpHistory;

  SessionModel({
    required this.id,
    required this.studentId,
    required this.psychiatristId,
    required this.sessionDate,
    required this.notes,
    required this.observations,
    required this.followUpHistory,
  });

  factory SessionModel.fromMap(Map<String, dynamic> map, String id) {
    return SessionModel(
      id: id,
      studentId: map['studentId'] ?? '',
      psychiatristId: map['psychiatristId'] ?? '',
      sessionDate: DateTime.parse(map['sessionDate'] ?? DateTime.now().toIso8601String()),
      notes: map['notes'] ?? '',
      observations: map['observations'] ?? '',
      followUpHistory: List<String>.from(map['followUpHistory'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'studentId': studentId,
      'psychiatristId': psychiatristId,
      'sessionDate': sessionDate.toIso8601String(),
      'notes': notes,
      'observations': observations,
      'followUpHistory': followUpHistory,
    };
  }
}
