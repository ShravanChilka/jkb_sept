import 'package:flutter/material.dart';
import 'package:jkb_sept/modules/chat/chat/view/dialogs/chat_dialog_helper.dart';
import 'package:jkb_sept/modules/chat/chat/view/widgets/select_photo_bottom_sheet.dart';
import 'package:jkb_sept/modules/chat/chat/view_model/chat_view_model.dart';
import 'package:provider/provider.dart';

import 'messages_list_builder.dart';

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
        const Expanded(
          child: MessagesListBuilder(),
        ),
        Container(
          color: Theme.of(context).colorScheme.surface,
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  ChatDialogHelper.showImageBottomSheet(context);
                },
                icon: const Icon(Icons.add_photo_alternate_outlined),
              ),
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
                onPressed: () async {
                  final message = messageController.text.trim();
                  await context
                      .read<ChatViewModel>()
                      .sendMessageEvent(message)
                      .then(
                        (r) => messageController.text = '',
                      );
                },
                icon: const Icon(Icons.send),
              )
            ],
          ),
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
