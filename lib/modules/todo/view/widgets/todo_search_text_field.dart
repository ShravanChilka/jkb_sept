import 'package:flutter/material.dart';
import 'package:jkb_sept/modules/todo/view_model/todo_view_model.dart';
import 'package:provider/provider.dart';

class TodoSearchTextField extends StatelessWidget {
  const TodoSearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 8,
      ),
      child: TextField(
        onChanged: (text) {
          context.read<TodoViewModel>().searchQueryChangedEvent(text);
        },
        decoration: const InputDecoration(
          hintText: 'Search by title',
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}
