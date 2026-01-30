class FirestoreConstants {
  // Collection names
  static const String usersCollection = 'users';
  static const String messagesCollection = 'messages';
  static const String sessionsCollection = 'sessions';
  static const String groupsCollection = 'groups';
  static const String assignmentsCollection = 'assignments';
  static const String followUpsCollection = 'followUps';

  // Field names
  static const String roleField = 'role';
  static const String timestampField = 'timestamp';
  static const String senderIdField = 'senderId';
  static const String receiverIdField = 'receiverId';
  static const String messageField = 'message';
  static const String readField = 'read';
  static const String encryptedField = 'encrypted';

  // User fields
  static const String userIdField = 'userId';
  static const String anonymousIdField = 'anonymousId';
  static const String createdAtField = 'createdAt';
  static const String lastActiveField = 'lastActive';

  // Assignment fields
  static const String studentIdField = 'studentId';
  static const String psychiatristIdField = 'psychiatristId';
  static const String assignedAtField = 'assignedAt';
  static const String statusField = 'status';
}
