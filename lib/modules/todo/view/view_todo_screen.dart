import 'package:flutter/material.dart';
import 'package:jkb_sept/modules/todo/model/todo_model.dart';
import 'package:jkb_sept/modules/todo/view/create_todo_screen.dart';
import 'package:jkb_sept/modules/todo/view/dialog/todo_dialog_helper.dart';
import 'package:jkb_sept/modules/todo/view_model/todo_view_model.dart';
import 'package:provider/provider.dart';

import 'widgets/create_todo_loader_overlay.dart';

class ViewTodoScreen extends StatelessWidget {
  const ViewTodoScreen({
    super.key,
    required this.model,
  });

  final TodoModel model;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text('Todo'),
            actions: [
              IconButton(
                onPressed: () => _onTapDelete(context),
                icon: const Icon(Icons.delete_outline_rounded),
              ),
              const SizedBox(width: 16),
              IconButton(
                onPressed: () => _onTapEdit(context),
                icon: const Icon(Icons.edit),
              ),
              const SizedBox(width: 24),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                if (model.description != null)
                  Text(
                    model.description!,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
              ],
            ),
          ),
        ),
        const CreateTodoLoaderOverlay(),
      ],
    );
  }

  void _onTapDelete(BuildContext context) {
    TodoDialogHelper.showDeleteConfirmationDialog(
      context,
      () {
        context.read<TodoViewModel>().deleteTodoEvent(
              todo: model,
              onCompleted: () {
                Navigator.of(context).pop();
              },
            );
      },
    );
  }

  void _onTapEdit(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ChangeNotifierProvider.value(
          value: context.read<TodoViewModel>(),
          child: const CreateTodoScreen(),
        ),
      ),
    );
  }
}
