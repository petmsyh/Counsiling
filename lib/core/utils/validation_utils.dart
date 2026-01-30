class ValidationUtils {
  static bool isValidMessage(String? message) {
    if (message == null || message.trim().isEmpty) {
      return false;
    }
    return message.trim().length <= 1000;
  }

  static bool isValidSessionNote(String? note) {
    if (note == null || note.trim().isEmpty) {
      return false;
    }
    return note.trim().length <= 5000;
  }

  static bool isValidGroupName(String? name) {
    if (name == null || name.trim().isEmpty) {
      return false;
    }
    return name.trim().length >= 3 && name.trim().length <= 50;
  }

  static String? validateMessage(String? message) {
    if (message == null || message.trim().isEmpty) {
      return 'Message cannot be empty';
    }
    if (message.trim().length > 1000) {
      return 'Message too long (max 1000 characters)';
    }
    return null;
  }

  static String? validateSessionNote(String? note) {
    if (note == null || note.trim().isEmpty) {
      return 'Note cannot be empty';
    }
    if (note.trim().length > 5000) {
      return 'Note too long (max 5000 characters)';
    }
    return null;
  }

  static String? validateGroupName(String? name) {
    if (name == null || name.trim().isEmpty) {
      return 'Group name cannot be empty';
    }
    if (name.trim().length < 3) {
      return 'Group name too short (min 3 characters)';
    }
    if (name.trim().length > 50) {
      return 'Group name too long (max 50 characters)';
    }
    return null;
  }
}
