import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  Future<void> initialize() async {
    // Request permission for iOS
    await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    // Get FCM token
    String? token = await _messaging.getToken();
    print('FCM Token: $token');

    // Handle foreground messages
    FirebaseMessaging.onMessage.listen(_handleMessage);

    // Handle background messages
    FirebaseMessaging.onBackgroundMessage(_backgroundMessageHandler);
  }

  void _handleMessage(RemoteMessage message) {
    print('Received message: ${message.notification?.title}');
  }

  static Future<void> _backgroundMessageHandler(
    RemoteMessage message,
  ) async {
    print('Background message: ${message.notification?.title}');
  }

  Future<String?> getToken() async {
    return await _messaging.getToken();
  }
}
