import 'package:flutter/material.dart';

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
      ),
      body: const HomeScreenBody(),
      // Center(
      //   child: ElevatedButton(
      //     onPressed: () {
      //       context.read<AuthViewModel>().logoutClickEvent();
      //     },
      //     child: const Text('Logout'),
      //   ),
      // ),
    );
  }
}
