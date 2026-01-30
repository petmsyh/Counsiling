class AppConstants {
  // App Information
  static const String appName = 'Student Counseling';
  static const String appVersion = '1.0.0';

  // Timeouts
  static const int connectionTimeout = 30;
  static const int receiveTimeout = 30;

  // Pagination
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;

  // Message Limits
  static const int maxMessageLength = 1000;
  static const int maxSessionNoteLength = 5000;

  // Follow-up Settings
  static const int defaultFollowUpDays = 7;
  static const int reminderHoursBefore = 24;

  // Group Settings
  static const int maxGroupParticipants = 50;
  static const int minGroupParticipants = 2;
}
