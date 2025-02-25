import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jkb_sept/modules/auth/model/user_model.dart';
import 'package:jkb_sept/modules/auth/service/auth_service.dart';
import 'package:jkb_sept/modules/chat/chat/model/chat_model.dart';
import 'package:jkb_sept/modules/chat/chat/model/message_model.dart';
import 'package:jkb_sept/modules/chat/chat/model/recent_chat_model.dart';

class ChatFirestoreService {
  final _client = FirebaseFirestore.instance;

  final _authService = AuthService();

  Future<String?> getChatId(UserModel reciever) async {
    final sender = _authService.getUser();
    if (sender == null) return null;

    final senderId = sender.uid;
    final receiverId = reciever.id;

    final chatId = senderId.compareTo(receiverId) >= 0
        ? '${senderId}_$receiverId'
        : '${receiverId}_$senderId';

    final chatRef = _client.collection('chats').doc(chatId);
    final isChatCreated = await chatRef.get().then(
          (doc) => doc.exists,
        );
    if (isChatCreated) {
      return chatId;
    } else {
      final model = ChatModel(id: chatId);
      await chatRef.set(model.toMap());
      return chatId;
    }
  }

  Future<void> sendMessage(
      String message, String chatId, UserModel reciever) async {
    final sender = UserModel.fromFirebaseUser(_authService.getUser()!);

    final ref = _client.collection('chats').doc(chatId).collection('messages');
    final docRef = ref.doc();
    final model = MessageModel(
      id: docRef.id,
      value: message,
      sentBy: sender.id,
      createdAt: DateTime.now(),
      isSender: true,
    );
    await docRef.set(model.toMap());
    createRecentMessage(model, sender, reciever);
  }

  Future<void> createRecentMessage(
    MessageModel message,
    UserModel sender,
    UserModel reciever,
  ) async {
    // Sender ke recent chat mai add
    final senderRef = _client
        .collection('users')
        .doc(sender.id)
        .collection('recentChats')
        .doc(reciever.id);
    final senderRecentChatModel = RecentChatModel(
      user: reciever,
      message: message,
    );
    await senderRef.set(senderRecentChatModel.toMap());

    // Receiver ke recent chat mai add
    final receiverRef = _client
        .collection('users')
        .doc(reciever.id)
        .collection('recentChats')
        .doc(sender.id);
    final receiverRecentChatModel = RecentChatModel(
      user: sender,
      message: message,
    );
    await receiverRef.set(receiverRecentChatModel.toMap());
  }

  Query<MessageModel> getAllChatsQuery(String? chatId) {
    final sender = _authService.getUser()!;

    return _client
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('createdAt', descending: true)
        .withConverter(
      fromFirestore: (snapshot, options) {
        return MessageModel.fromMap(
          snapshot.data()!,
          isSender: snapshot.data()!['sentBy'] == sender.uid,
        );
      },
      toFirestore: (message, options) {
        return message.toMap();
      },
    );
  }

  Stream<List<MessageModel>> getAllChats(String? chatId) {
    final ref = _client
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('createdAt', descending: true);
    final sender = _authService.getUser();

    final streamSnapshot = ref.snapshots();
    final stream = streamSnapshot.asyncMap((snapshot) {
      final messages = snapshot.docs.map(
        (doc) {
          return MessageModel.fromMap(
            doc.data(),
            isSender: doc.data()['sentBy'] == sender?.uid,
          );
        },
      ).toList();
      return messages;
    });
    return stream;
  }

  Future<void> deleteMessage(String? chatId, MessageModel message) async {
    final ref = _client
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .doc(message.id);
    await ref.delete();
  }
}
