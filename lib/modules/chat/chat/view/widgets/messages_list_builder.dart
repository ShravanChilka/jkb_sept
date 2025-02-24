import 'package:flutter/material.dart';
import 'package:jkb_sept/modules/chat/chat/model/message_model.dart';
import 'package:jkb_sept/modules/chat/chat/view_model/chat_view_model.dart';
import 'package:provider/provider.dart';

class MessagesListBuilder extends StatelessWidget {
  const MessagesListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<MessageModel>>(
      stream: context.read<ChatViewModel>().messages,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final messages = snapshot.requireData;
          return ListView.separated(
            reverse: true,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            separatorBuilder: (context, index) {
              return const SizedBox(height: 2);
            },
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final screenWidth = MediaQuery.of(context).size.width;
              final message = messages[index];
              return Align(
                alignment: message.isSender
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Container(
                  width: screenWidth * 0.6,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                        bottomLeft:
                            message.isSender ? Radius.circular(8) : Radius.zero,
                        bottomRight: !message.isSender
                            ? Radius.circular(8)
                            : Radius.zero,
                      )),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Text(
                    message.value,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              );
            },
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
