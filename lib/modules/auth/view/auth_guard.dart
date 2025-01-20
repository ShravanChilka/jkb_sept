import 'package:flutter/material.dart';
import 'package:jkb_sept/modules/auth/view/auth_screen.dart';
import 'package:jkb_sept/modules/auth/view_model/auth_view_model.dart';
import 'package:jkb_sept/modules/home/view/home_screen.dart';
import 'package:provider/provider.dart';

class AuthGuard extends StatefulWidget {
  const AuthGuard({super.key});

  @override
  State<AuthGuard> createState() => _AuthGuardState();
}

class _AuthGuardState extends State<AuthGuard> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () {
        if (mounted) context.read<AuthViewModel>().getUser();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Selector<AuthViewModel, bool>(
      selector: (context, viewModel) => viewModel.isAuthenticatied,
      builder: (context, isAuthenticatied, child) {
        if (!isAuthenticatied) return const AuthScreen();
        return const HomeScreen();
      },
    );
  }
}
