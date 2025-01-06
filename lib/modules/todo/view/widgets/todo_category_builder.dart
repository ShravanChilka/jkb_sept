import 'package:flutter/material.dart';
import 'package:jkb_sept/modules/todo/model/todo_category.dart';
import 'package:jkb_sept/modules/todo/view_model/todo_view_model.dart';
import 'package:provider/provider.dart';

class TodoCategoryBuilder extends StatelessWidget {
  const TodoCategoryBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedCategory = context.watch<TodoViewModel>().category;
    return Row(
      children: [
        Text(
          'Category',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const Spacer(),
        ...TodoCategory.values.map((category) {
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: InputChip(
              selected: selectedCategory == category,
              label: Text(
                category.name,
              ),
              onSelected: (value) {
                _onSelectedEvent(value, context, category);
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
    TodoCategory category,
  ) {
    if (value) {
      context.read<TodoViewModel>().changeTodoCategoryEvent(category);
    }
  }
}
