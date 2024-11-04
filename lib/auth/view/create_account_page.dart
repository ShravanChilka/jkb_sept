import 'package:flutter/material.dart';
import 'package:jkb_sept/auth/view/create_account_screen.dart';
import 'package:jkb_sept/auth/view_model/create_account_view_model.dart';
import 'package:provider/provider.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CreateAccountViewModel(),
      child: const CreateAccountScreen(),
    );
  }
}
