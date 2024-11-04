import 'package:flutter/material.dart';
import 'package:jkb_sept/auth/view/widgets/create_account_full_screen_loader.dart';
import 'package:provider/provider.dart';

import '../model/create_account_request_model.dart';
import '../view_model/create_account_view_model.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final isLoading = context.watch<CreateAccountViewModel>().isLoading;

    return PopScope(
      canPop: !isLoading,
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              title: const Text('Create account'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      hintText: 'Enter name',
                    ),
                  ),
                  const SizedBox(height: 16),
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
                          onPressed: _createAccountClickEvent,
                          child: const Text('Create account'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const CreateAccountFullScreenLoader(),
        ],
      ),
    );
  }

  void _createAccountClickEvent() {
    context.read<CreateAccountViewModel>().createAccount(
          CreateAccountRequestModel(
            name: nameController.text,
            email: emailController.text,
            password: passwordController.text,
          ),
        );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
