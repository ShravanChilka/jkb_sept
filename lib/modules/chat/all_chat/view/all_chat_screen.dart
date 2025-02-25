import 'package:flutter/material.dart';
import 'package:jkb_sept/modules/chat/all_chat/view/widgets/search_user_delegate.dart';
import 'package:jkb_sept/modules/chat/all_chat/view_model/all_chat_view_model.dart';
import 'package:provider/provider.dart';

import 'widgets/search_user_list_builder.dart';
import 'widgets/recent_chat_list_builder.dart';

class AllChatScreen extends StatelessWidget {
  const AllChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All chats'),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: SearchUserDelegate(
                  viewModel: context.read<AllChatViewModel>(),
                ),
              );
            },
            icon: const Icon(Icons.search),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: const RecentChatListBuilder(),
    );
  }
}
