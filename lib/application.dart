import 'package:flutter/material.dart';
import 'package:jkb_sept/modules/auth/view_model/auth_view_model.dart';
import 'package:jkb_sept/modules/home/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

import 'modules/auth/view/auth_guard.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeViewModel(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.green,
          ),
          useMaterial3: true,
        ),
        home: const AuthGuard(),
      ),
    );
  }
}
