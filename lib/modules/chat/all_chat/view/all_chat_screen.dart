import 'package:flutter/material.dart';
import 'package:jkb_sept/modules/chat/all_chat/view_model/all_chat_view_model.dart';
import 'package:provider/provider.dart';

import 'widgets/all_chat_list_builder.dart';

class AllChatScreen extends StatelessWidget {
  const AllChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All chats'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: Column(
          children: [
            TextField(
              onChanged:
                  context.read<AllChatViewModel>().onSearchQueryChangeEvent,
              onTapOutside: (event) {
                FocusScope.of(context).unfocus();
              },
              decoration: const InputDecoration(
                hintText: 'Search by name',
              ),
            ),
            const Expanded(
              child: AllChatListBuilder(),
            ),
          ],
        ),
      ),
    );
  }
}
