import 'package:flutter/material.dart';
import 'package:jkb_sept/modules/todo/model/todo_priority.dart';
import 'package:jkb_sept/modules/todo/view/view_todo_screen.dart';
import 'package:jkb_sept/modules/todo/view_model/todo_view_model.dart';
import 'package:provider/provider.dart';

class AllTodoListBuilder extends StatefulWidget {
  const AllTodoListBuilder({super.key});

  @override
  State<AllTodoListBuilder> createState() => _AllTodoListBuilderState();
}

class _AllTodoListBuilderState extends State<AllTodoListBuilder> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (mounted) context.read<TodoViewModel>().fetchAllTodosEvent();
    });
  }

  @override
  Widget build(BuildContext context) {
    final todos = context.watch<TodoViewModel>().todos;
    final isLoadingMore = context.read<TodoViewModel>().isLoadingMore;
    return Column(
      children: [
        Expanded(
          child: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification.metrics.pixels ==
                  notification.metrics.maxScrollExtent) {
                // log('reached at the end!');
                context.read<TodoViewModel>().fetchMoreTodos();
              }

              return false;
            },
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return const Divider(height: 1);
              },
              padding: const EdgeInsets.symmetric(
                vertical: 16,
              ),
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return ListTile(
                  leading: Icon(
                    Icons.circle,
                    size: 20,
                    color: _getColor(todo.priority),
                  ),
                  title: Text(
                    todo.title,
                    style: Theme.of(context).textTheme.titleLarge,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: todo.description != null
                      ? Text(
                          todo.description!,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        )
                      : null,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => ChangeNotifierProvider.value(
                        value: context.read<TodoViewModel>(),
                        child: ViewTodoScreen(model: todo),
                      ),
                    ));
                  },
                );
              },
            ),
          ),
        ),
        if (isLoadingMore)
          const SizedBox(
            width: 24,
            height: 24,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
      ],
    );
  }

  Color _getColor(TodoPriority priority) {
    switch (priority) {
      case TodoPriority.low:
        return Colors.greenAccent;
      case TodoPriority.medium:
        return Colors.yellowAccent;
      case TodoPriority.high:
        return Colors.redAccent;
    }
  }
}
