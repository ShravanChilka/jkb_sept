import 'package:flutter/material.dart';
import 'package:jkb_sept/auth/view_model/create_account_view_model.dart';
import 'package:provider/provider.dart';

class CreateAccountFullScreenLoader extends StatelessWidget {
  const CreateAccountFullScreenLoader({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoading = context.watch<CreateAccountViewModel>().isLoading;
    if (isLoading) {
      return Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: Colors.black.withOpacity(0.8),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return const SizedBox.shrink();
  }
}
