import 'package:flutter/material.dart';
import 'package:jkb_sept/modules/todo/utils/todo_strings.dart';

class DeleteTodoConfirmationDialog extends StatelessWidget {
  const DeleteTodoConfirmationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(TodoStrings.deleteDialogTitle),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          child: const Text('Delete'),
        )
      ],
    );
  }
}
