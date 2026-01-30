import 'dart:convert';
import 'package:crypto/crypto.dart';

class EncryptionService {
  // Simple hash-based encryption for demo
  // In production, use proper encryption libraries
  
  String encrypt(String plainText) {
    final bytes = utf8.encode(plainText);
    final hash = sha256.convert(bytes);
    return base64.encode(utf8.encode('$plainText::$hash'));
  }

  String decrypt(String encryptedText) {
    try {
      final decoded = utf8.decode(base64.decode(encryptedText));
      final parts = decoded.split('::');
      return parts.isNotEmpty ? parts[0] : encryptedText;
    } catch (e) {
      return encryptedText;
    }
  }

  String hashData(String data) {
    final bytes = utf8.encode(data);
    final hash = sha256.convert(bytes);
    return hash.toString();
  }
}
