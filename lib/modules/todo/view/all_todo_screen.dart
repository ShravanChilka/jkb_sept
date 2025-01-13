import 'package:flutter/material.dart';
import 'package:jkb_sept/modules/todo/view/create_todo_screen.dart';
import 'package:jkb_sept/modules/todo/view/todo_filter_screen.dart';
import 'package:jkb_sept/modules/todo/view_model/todo_view_model.dart';
import 'package:provider/provider.dart';

import 'widgets/all_todo_list_builder.dart';
import 'widgets/todo_search_text_field.dart';

class AllTodoScreen extends StatelessWidget {
  const AllTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final total = context.watch<TodoViewModel>().total;
    final totalFilters = context.watch<TodoViewModel>().totalFilters;
    return Scaffold(
      appBar: AppBar(
        title: Text('Todos (${total.toString()})'),
        actions: [
          Badge(
            label: Text(totalFilters.toString()),
            isLabelVisible: totalFilters > 0,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => ChangeNotifierProvider.value(
                      value: context.read<TodoViewModel>(),
                      child: const TodoFilterScreen(),
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.filter_alt_rounded),
            ),
          ),
          const SizedBox(width: 24),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Create'),
        onPressed: () {
          _navigateToCreateTodoScreen(context);
        },
        icon: const Icon(Icons.add),
      ),
      body: const Column(
        children: [
          TodoSearchTextField(),
          Expanded(
            child: AllTodoListBuilder(),
          ),
        ],
      ),
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
