import 'package:flutter_test/flutter_test.dart';
import 'package:counseling_app/data/models/user_model.dart';
import 'package:counseling_app/core/constants/user_roles.dart';

void main() {
  group('UserModel Tests', () {
    test('UserModel should be created from map', () {
      final map = {
        'anonymousId': 'test123',
        'role': 'student',
        'createdAt': DateTime.now().toIso8601String(),
        'lastActive': DateTime.now().toIso8601String(),
      };

      final user = UserModel.fromMap(map, 'user123');

      expect(user.id, 'user123');
      expect(user.anonymousId, 'test123');
      expect(user.role, UserRole.student);
    });

    test('UserModel should convert to map', () {
      final user = UserModel(
        id: 'user123',
        anonymousId: 'test123',
        role: UserRole.student,
        createdAt: DateTime.now(),
        lastActive: DateTime.now(),
      );

      final map = user.toMap();

      expect(map['anonymousId'], 'test123');
      expect(map['role'], 'student');
      expect(map.containsKey('createdAt'), true);
      expect(map.containsKey('lastActive'), true);
    });
  });
}
