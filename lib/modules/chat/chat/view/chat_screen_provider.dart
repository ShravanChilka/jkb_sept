import 'package:flutter/material.dart';
import 'package:jkb_sept/modules/auth/model/user_model.dart';
import 'package:jkb_sept/modules/chat/chat/view/chat_screen.dart';
import 'package:jkb_sept/modules/chat/chat/view_model/chat_view_model.dart';
import 'package:provider/provider.dart';

class ChatScreenProvider extends StatelessWidget {
  const ChatScreenProvider({
    super.key,
    required this.reciever,
  });

  final UserModel reciever;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChatViewModel(reciever),
      child: const ChatScreen(),
    );
  }
}
