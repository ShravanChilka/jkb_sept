import 'package:flutter/material.dart';
import 'package:jkb_sept/modules/todo/model/get_todo_request_model.dart';
import 'package:jkb_sept/modules/todo/model/todo_category.dart';
import 'package:jkb_sept/modules/todo/model/todo_priority.dart';
import 'package:jkb_sept/modules/todo/model/todo_status.dart';
import 'package:jkb_sept/modules/todo/view_model/todo_view_model.dart';
import 'package:provider/provider.dart';

class TodoFilterScreen extends StatelessWidget {
  const TodoFilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final request = context.watch<TodoViewModel>().request;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.read<TodoViewModel>().applyFilterEvent();
          Navigator.of(context).pop();
        },
        icon: const Icon(Icons.save_rounded),
        label: const Text('Apply filter'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Status',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Wrap(
                children: TodoStatus.values.map(
                  (e) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: InputChip(
                        label: Text(e.name),
                        onPressed: () {
                          context
                              .read<TodoViewModel>()
                              .selectStatusFilterEvent(e);
                        },
                        selected: _getStatusIsSelected(e, request),
                      ),
                    );
                  },
                ).toList(),
              ),
              const SizedBox(height: 16),
              Text(
                'Priority',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Wrap(
                children: TodoPriority.values.map(
                  (e) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: InputChip(
                        label: Text(e.name),
                        onPressed: () {
                          context
                              .read<TodoViewModel>()
                              .selectPriorityFilterEvent(e);
                        },
                        selected: _getPriorityIsSelected(e, request),
                      ),
                    );
                  },
                ).toList(),
              ),
              const SizedBox(height: 16),
              Text(
                'Category',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Wrap(
                children: TodoCategory.values.map(
                  (e) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: InputChip(
                        label: Text(e.name),
                        onPressed: () {
                          context
                              .read<TodoViewModel>()
                              .selectCategoryFilterEvent(e);
                        },
                        selected: _getCategoryIsSelected(e, request),
                      ),
                    );
                  },
                ).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _getStatusIsSelected(TodoStatus e, GetTodoRequestModel request) {
    if (request.filter.status.contains(e)) {
      return true;
    }
    return false;
  }

  bool _getPriorityIsSelected(TodoPriority e, GetTodoRequestModel request) {
    if (request.filter.priority.contains(e)) {
      return true;
    }
    return false;
  }

  bool _getCategoryIsSelected(TodoCategory e, GetTodoRequestModel request) {
    if (request.filter.category.contains(e)) {
      return true;
    }
    return false;
  }
}
