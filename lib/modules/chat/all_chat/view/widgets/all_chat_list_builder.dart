import 'package:flutter/material.dart';
import 'package:jkb_sept/modules/auth/model/user_model.dart';
import 'package:jkb_sept/modules/chat/all_chat/view_model/all_chat_view_model.dart';
import 'package:jkb_sept/modules/chat/chat/view/chat_screen_provider.dart';
import 'package:provider/provider.dart';

class AllChatListBuilder extends StatelessWidget {
  const AllChatListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<AllChatViewModel, List<UserModel>>(
      selector: (context, vm) => vm.users,
      builder: (context, users, child) {
        return ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            return ListTile(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ChatScreenProvider(
                      reciever: user,
                    ),
                  ),
                );
              },
              leading: user.photoURL != null
                  ? CircleAvatar(
                      child: Image.network(
                        user.photoURL.toString(),
                        width: 70,
                        height: 70,
                      ),
                    )
                  : const CircleAvatar(
                      child: Icon(Icons.person),
                    ),
              title: Text(user.userName ?? user.email ?? '-'),
            );
          },
        );
      },
    );
  }
}
