import 'package:cloud_firestore/cloud_firestore.dart';
import '../../data/models/message_model.dart';
import '../constants/firestore_constants.dart';

class MessagingService {
  final FirebaseFirestore _firestore;

  MessagingService(this._firestore);

  Future<void> sendMessage(MessageModel message) async {
    await _firestore
        .collection(FirestoreConstants.messagesCollection)
        .add(message.toMap());
  }

  Stream<List<MessageModel>> getMessages(
    String userId,
    String otherUserId,
  ) {
    return _firestore
        .collection(FirestoreConstants.messagesCollection)
        .where(Filter.or(
          Filter.and(
            Filter(FirestoreConstants.senderIdField, isEqualTo: userId),
            Filter(FirestoreConstants.receiverIdField, isEqualTo: otherUserId),
          ),
          Filter.and(
            Filter(FirestoreConstants.senderIdField, isEqualTo: otherUserId),
            Filter(FirestoreConstants.receiverIdField, isEqualTo: userId),
          ),
        ))
        .orderBy(FirestoreConstants.timestampField, descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => MessageModel.fromMap(doc.data(), doc.id))
            .toList());
  }

  Future<void> markAsRead(String messageId) async {
    await _firestore
        .collection(FirestoreConstants.messagesCollection)
        .doc(messageId)
        .update({FirestoreConstants.readField: true});
  }
}
