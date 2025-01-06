import 'package:flutter/material.dart';
import 'package:jkb_sept/modules/todo/view/create_todo_screen.dart';
import 'package:jkb_sept/modules/todo/view_model/todo_view_model.dart';
import 'package:provider/provider.dart';

class AllTodoScreen extends StatelessWidget {
  const AllTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Create'),
        onPressed: () {
          _navigateToCreateTodoScreen(context);
        },
        icon: const Icon(Icons.add),
      ),
      body: Container(),
    );
  }

  void _navigateToCreateTodoScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (newContext) => ChangeNotifierProvider.value(
          value: context.read<TodoViewModel>(),
          child: const CreateTodoScreen(),
        ),
      ),
    );
  }
}
