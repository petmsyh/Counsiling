import '../core/constants/user_roles.dart';

class UserModel {
  final String id;
  final String anonymousId;
  final UserRole role;
  final DateTime createdAt;
  final DateTime lastActive;

  UserModel({
    required this.id,
    required this.anonymousId,
    required this.role,
    required this.createdAt,
    required this.lastActive,
  });

  factory UserModel.fromMap(Map<String, dynamic> map, String id) {
    return UserModel(
      id: id,
      anonymousId: map['anonymousId'] ?? '',
      role: UserRoleExtension.fromString(map['role'] ?? 'student'),
      createdAt: DateTime.parse(map['createdAt'] ?? DateTime.now().toIso8601String()),
      lastActive: DateTime.parse(map['lastActive'] ?? DateTime.now().toIso8601String()),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'anonymousId': anonymousId,
      'role': role.name,
      'createdAt': createdAt.toIso8601String(),
      'lastActive': lastActive.toIso8601String(),
    };
  }
}
