import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jkb_sept/modules/chat/all_chat/view_model/all_chat_view_model.dart';
import 'package:jkb_sept/modules/chat/chat/model/recent_chat_model.dart';
import 'package:jkb_sept/modules/chat/chat/view/chat_screen_provider.dart';
import 'package:provider/provider.dart';

class RecentChatListBuilder extends StatelessWidget {
  const RecentChatListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return FirestoreListView<RecentChatModel>(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      query: context.read<AllChatViewModel>().getAllRecentChatsQuery(),
      itemBuilder: (context, snapshot) {
        final recentChat = snapshot.data();
        return ListTile(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>
                    ChatScreenProvider(reciever: recentChat.user),
              ),
            );
          },
          title: Text(recentChat.user.userName ?? recentChat.user.email ?? '-'),
          subtitle: Text(recentChat.message.value),
          trailing: Text(
            DateFormat('hh:mm aa').format(recentChat.message.createdAt),
          ),
          leading: CircleAvatar(
            child: Image(
              image: NetworkImage(recentChat.user.photoURL ?? ''),
            ),
          ),
        );
      },
    );
  }
}
