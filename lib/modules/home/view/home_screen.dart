import 'package:flutter/material.dart';
import 'package:jkb_sept/modules/chat/all_chat/view/all_chat_provider.dart';
import 'package:jkb_sept/modules/chat/all_chat/view/all_chat_screen.dart';
import 'package:provider/provider.dart';

import '../../auth/view_model/auth_view_model.dart';
import 'widgets/home_navigation_bar.dart';
import 'widgets/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const HomeNavigationBar(),
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton.filledTonal(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AllChatProvider(),
                ),
              );
            },
            icon: const Icon(Icons.chat),
          ),
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: const Text('Log out'),
                  onTap: () {
                    context.read<AuthViewModel>().logoutClickEvent();
                  },
                ),
              ];
            },
          ),
        ],
      ),
      body: const HomeScreenBody(),
    );
  }
}
