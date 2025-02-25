import 'package:flutter/material.dart';

class DeleteMessageDialog extends StatelessWidget {
  const DeleteMessageDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Delete messsage'),
      content: const Text(
        'Are you sure you want to delete this message?',
      ),
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
