import 'package:flutter/material.dart';
import 'package:jkb_sept/modules/todo/view_model/todo_view_model.dart';
import 'package:provider/provider.dart';

import '../../model/todo_priority.dart';

class TodoPriorityBuilder extends StatelessWidget {
  const TodoPriorityBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedPriority = context.watch<TodoViewModel>().priority;
    return Row(
      children: [
        Text(
          'Priority',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const Spacer(),
        ...TodoPriority.values.map((priority) {
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: InputChip(
              selected: selectedPriority == priority,
              label: Text(
                priority.name,
              ),
              onSelected: (value) {
                _onSelectedEvent(value, context, priority);
              },
            ),
          );
        })
      ],
    );
  }

  void _onSelectedEvent(
    bool value,
    BuildContext context,
    TodoPriority priority,
  ) {
    if (value) {
      context.read<TodoViewModel>().changeTodoPriorityEvent(priority);
    }
  }
}
