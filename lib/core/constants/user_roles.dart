enum UserRole {
  student,
  psychiatrist,
  administrator,
}

extension UserRoleExtension on UserRole {
  String get name {
    switch (this) {
      case UserRole.student:
        return 'student';
      case UserRole.psychiatrist:
        return 'psychiatrist';
      case UserRole.administrator:
        return 'administrator';
    }
  }

  static UserRole fromString(String role) {
    switch (role.toLowerCase()) {
      case 'student':
        return UserRole.student;
      case 'psychiatrist':
        return UserRole.psychiatrist;
      case 'administrator':
        return UserRole.administrator;
      default:
        throw ArgumentError('Invalid role: $role');
    }
  }
}
