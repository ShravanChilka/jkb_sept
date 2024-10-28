import 'package:flutter/material.dart';
import 'package:jkb_sept/theme_view_model.dart';
import 'package:provider/provider.dart';

class GlobalProvider extends StatelessWidget {
  const GlobalProvider({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeViewModel(),
      builder: (_, __) => child,
    );
  }
}
