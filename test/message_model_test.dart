import 'package:flutter_test/flutter_test.dart';
import 'package:counseling_app/data/models/message_model.dart';

void main() {
  group('MessageModel Tests', () {
    test('MessageModel should be created from map', () {
      final now = DateTime.now();
      final map = {
        'senderId': 'sender123',
        'receiverId': 'receiver123',
        'message': 'Hello',
        'timestamp': now.toIso8601String(),
        'read': false,
        'encrypted': true,
      };

      final message = MessageModel.fromMap(map, 'msg123');

      expect(message.id, 'msg123');
      expect(message.senderId, 'sender123');
      expect(message.receiverId, 'receiver123');
      expect(message.message, 'Hello');
      expect(message.read, false);
      expect(message.encrypted, true);
    });

    test('MessageModel should convert to map', () {
      final message = MessageModel(
        id: 'msg123',
        senderId: 'sender123',
        receiverId: 'receiver123',
        message: 'Hello',
        timestamp: DateTime.now(),
      );

      final map = message.toMap();

      expect(map['senderId'], 'sender123');
      expect(map['receiverId'], 'receiver123');
      expect(map['message'], 'Hello');
      expect(map.containsKey('timestamp'), true);
    });
  });
}
