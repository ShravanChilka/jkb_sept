import 'package:flutter/material.dart';
import 'package:jkb_sept/auth/model/create_account_request_model.dart';
import 'package:jkb_sept/auth/model/login_request_model.dart';
import 'package:jkb_sept/auth/view/create_account_page.dart';
import 'package:jkb_sept/auth/view/create_account_screen.dart';
import 'package:jkb_sept/auth/view_model/create_account_view_model.dart';
import 'package:jkb_sept/auth/view_model/login_view_model.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'Enter email',
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Password',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              obscuringCharacter: '•',
              decoration: const InputDecoration(
                hintText: 'Enter password',
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FilledButton(
                    onPressed: loginClickEvent,
                    child: const Text('Login'),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const CreateAccountPage(),
                        ),
                      );
                    },
                    child: const Text('Create account'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void loginClickEvent() {
    context.read<LoginViewModel>().login(
          LoginRequestModel(
            email: emailController.text,
            password: passwordController.text,
          ),
        );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
