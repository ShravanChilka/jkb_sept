import 'package:flutter/material.dart';
import 'package:jkb_sept/counter_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: const Center(
        child: MeraProviderWalaTextWidget(),
      ),
    );
  }
}
