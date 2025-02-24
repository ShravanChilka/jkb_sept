import 'package:flutter/material.dart';
import 'package:jkb_sept/modules/auth/model/user_model.dart';
import 'package:jkb_sept/modules/chat/chat/model/message_model.dart';
import 'package:jkb_sept/modules/chat/chat/service/chat_firestore_service.dart';

class ChatViewModel extends ChangeNotifier {
  ChatViewModel(this.reciever);

  final UserModel reciever;
  String? chatId;
  final _service = ChatFirestoreService();

  bool get isChatCreated => chatId != null;

  String get appBarTitle => reciever.userName ?? reciever.email ?? '-';

  Stream<List<MessageModel>> messages = Stream.empty();

  Future<void> sendMessageEvent(String message) async {
    if (!isChatCreated) return;
    await _service.sendMessage(message, chatId!);
  }

  void loadChatMessages() async {
    messages = _service.getAllChats(chatId);
    notifyListeners();
  }

  void init() async {
    chatId = await _service.getChatId(reciever);
    loadChatMessages();
  }
}
