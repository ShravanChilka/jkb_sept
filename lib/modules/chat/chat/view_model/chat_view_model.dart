import 'package:flutter/material.dart';
import 'package:jkb_sept/modules/auth/model/user_model.dart';
import 'package:jkb_sept/modules/chat/chat/service/chat_firestore_service.dart';

class ChatViewModel extends ChangeNotifier {
  ChatViewModel(this.reciever);

  final UserModel reciever;
  String? chatId;
  final _service = ChatFirestoreService();

  bool get isChatCreated => chatId != null;

  String get appBarTitle => reciever.userName ?? reciever.email ?? '-';

  void sendMessageEvent(String message) {
    if (!isChatCreated) return;
    _service.sendMessage(message, chatId!);
  }

  void init() async {
    chatId = await _service.getChatId(reciever);
    notifyListeners();
  }
}
