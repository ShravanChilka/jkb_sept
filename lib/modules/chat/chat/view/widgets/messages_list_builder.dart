import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jkb_sept/modules/chat/chat/model/message_model.dart';
import 'package:jkb_sept/modules/chat/chat/view/dialogs/chat_dialog_helper.dart';
import 'package:jkb_sept/modules/chat/chat/view/widgets/image_full_screen.dart';
import 'package:jkb_sept/modules/chat/chat/view_model/chat_view_model.dart';
import 'package:provider/provider.dart';

class MessagesListBuilder extends StatefulWidget {
  const MessagesListBuilder({super.key});

  @override
  State<MessagesListBuilder> createState() => _MessagesListBuilderState();
}

class _MessagesListBuilderState extends State<MessagesListBuilder> {
  @override
  Widget build(BuildContext context) {
    return FirestoreListView<MessageModel>(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      pageSize: 15,
      reverse: true,
      query: context.read<ChatViewModel>().getAllChatsQuery(),
      itemBuilder: (context, snapshot) {
        final message = snapshot.data();
        print(message.isSender);
        final screenWidth = MediaQuery.of(context).size.width;

        return Align(
          alignment:
              message.isSender ? Alignment.centerRight : Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: InkWell(
              onLongPress: () {
                ChatDialogHelper.showDeleteMessageDialog(context, message);
              },
              child: Ink(
                width: screenWidth * 0.6,
                decoration: BoxDecoration(
                    color: message.isSender
                        ? Theme.of(context).colorScheme.primaryContainer
                        : Theme.of(context).colorScheme.tertiaryContainer,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(8),
                      topRight: const Radius.circular(8),
                      bottomLeft: message.isSender
                          ? const Radius.circular(8)
                          : Radius.zero,
                      bottomRight: !message.isSender
                          ? const Radius.circular(8)
                          : Radius.zero,
                    )),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (message.type == MessageType.text)
                      Text(
                        message.value,
                        style: Theme.of(context).textTheme.bodyLarge,
                      )
                    else if (message.type == MessageType.image)
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return ImageFullScreen(imageUrl: message.value);
                            },
                          ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: Image(
                            image: NetworkImage(message.value),
                            width: 200,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    Text(
                      DateFormat('hh:mm aa').format(message.createdAt),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
