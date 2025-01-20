import 'package:flutter/material.dart';
import 'package:jkb_sept/modules/auth/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.read<AuthViewModel>().loginWithGoogleClickEvent();
          },
          child: const Text('Login with Google'),
        ),
      ),
    );
  }
}
