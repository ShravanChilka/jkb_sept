import 'package:flutter/material.dart';
import 'package:jkb_sept/modules/todo/view/all_todo_provider.dart';

import 'modules/todo/view/all_todo_screen.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      home: const AllTodoProvider(),
    );
  }
}
