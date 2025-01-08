import 'package:flutter/material.dart';
import 'package:jkb_sept/modules/todo/view/dialog/delete_todo_confirmation_dialog.dart';

class TodoDialogHelper {
  const TodoDialogHelper._();

  static void showDeleteConfirmationDialog(
    BuildContext context,
    VoidCallback onDelete,
  ) {
    showDialog<bool>(
      context: context,
      builder: (context) {
        return const DeleteTodoConfirmationDialog();
      },
    ).then(
      (shouldDelete) {
        if (shouldDelete == true) {
          onDelete.call();
        }
      },
    );
  }
}
