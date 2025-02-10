import 'package:flutter/material.dart';
import 'package:jkb_sept/modules/chat/chat/view_model/chat_view_model.dart';
import 'package:provider/provider.dart';

class ChatScreenBody extends StatefulWidget {
  const ChatScreenBody({super.key});

  @override
  State<ChatScreenBody> createState() => _ChatScreenBodyState();
}

class _ChatScreenBodyState extends State<ChatScreenBody> {
  final messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            color: Colors.red,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                child: TextField(
                  controller: messageController,
                  onChanged: (value) {},
                  decoration: const InputDecoration(
                    hintText: 'Type your message...',
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                final message = messageController.text.trim();
                context.read<ChatViewModel>().sendMessageEvent(message);
              },
              icon: const Icon(Icons.send),
            )
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    messageController.dispose();
  }
}
