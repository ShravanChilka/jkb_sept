import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:jkb_sept/modules/auth/model/user_model.dart';
import 'package:jkb_sept/modules/auth/service/auth_service.dart';
import 'package:jkb_sept/modules/chat/chat/model/chat_model.dart';
import 'package:jkb_sept/modules/chat/chat/model/message_model.dart';
import 'package:jkb_sept/modules/chat/chat/model/recent_chat_model.dart';

class ChatFirestoreService {
  final _client = FirebaseFirestore.instance;
  final _storageClient = FirebaseStorage.instance;

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
      type: MessageType.text,
    );
    await docRef.set(model.toMap());
    createRecentMessage(model, sender, reciever);
  }

  Future<void> sendImageMessage(
    String path,
    String chatId,
    UserModel reciever,
  ) async {
    final sender = UserModel.fromFirebaseUser(_authService.getUser()!);

    final imageUrl = await uploadImage(path, chatId);
    if (imageUrl == null) return;
    final ref = _client.collection('chats').doc(chatId).collection('messages');
    final docRef = ref.doc();
    final model = MessageModel(
      id: docRef.id,
      value: imageUrl,
      sentBy: sender.id,
      createdAt: DateTime.now(),
      isSender: true,
      type: MessageType.image,
    );
    await docRef.set(model.toMap());
    createRecentMessage(model, sender, reciever);
  }

  Future<String?> uploadImage(String path, String chatId) async {
    try {
      final fileName = path.split('/').last;
      final ref = _storageClient.ref().child(chatId).child(fileName);
      final uploadTask = ref.putFile(File(path));
      final imageUrl = await uploadTask.then((taskSnapshot) async {
        return await taskSnapshot.ref.getDownloadURL();
      });
      return imageUrl;
    } on Exception catch (e, s) {
      log('uploadImage', name: '$runtimeType', error: e, stackTrace: s);
      return null;
    }
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
    Reference? imageRef;
    if (message.type == MessageType.image) {
      imageRef = _storageClient.refFromURL(message.value);
    }
    final ref = _client
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .doc(message.id);
    await Future.wait([
      if (imageRef != null) imageRef.delete(),
      ref.delete(),
    ]);
  }
}
