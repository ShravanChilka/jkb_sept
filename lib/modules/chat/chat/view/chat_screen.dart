import 'package:flutter/material.dart';
import 'package:jkb_sept/modules/chat/chat/view/widgets/chat_screen_body.dart';
import 'package:jkb_sept/modules/chat/chat/view_model/chat_view_model.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () {
        if (mounted) context.read<ChatViewModel>().init();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.read<ChatViewModel>().appBarTitle,
        ),
      ),
      body: Selector<ChatViewModel, bool>(
        selector: (_, vm) => vm.isChatCreated,
        builder: (context, isChatCreated, child) {
          if (isChatCreated) return const ChatScreenBody();
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
