import 'package:flutter/material.dart';
import 'package:jkb_sept/modules/todo/model/todo_category.dart';
import 'package:jkb_sept/modules/todo/model/todo_model.dart';
import 'package:jkb_sept/modules/todo/model/todo_priority.dart';
import 'package:jkb_sept/modules/todo/model/todo_status.dart';
import 'package:jkb_sept/modules/todo/service/todo_local_database_service.dart';

class TodoViewModel extends ChangeNotifier {
  TodoCategory category = TodoCategory.personal;
  TodoPriority priority = TodoPriority.low;
  TodoStatus status = TodoStatus.pending;
  bool isLoading = false;
  bool isLoadingMore = false;

  int limit = 15;

  List<TodoModel> todos = [];
  int total = 0;

  final service = TodoLocalDatabaseService();

  void changeTodoCategoryEvent(TodoCategory category) {
    this.category = category;
    notifyListeners();
  }

  void changeTodoPriorityEvent(TodoPriority priority) {
    this.priority = priority;
    notifyListeners();
  }

  void changeTodoStatusEvent(TodoStatus status) {
    this.status = status;
    notifyListeners();
  }

  void createTodoEvent({
    required String title,
    String? description,
    required Function(TodoModel? result) onCompleted,
  }) async {
    final model = TodoModel(
      title: title,
      description: description,
      category: category,
      priority: priority,
      status: status,
      createdAt: DateTime.now(),
    );
    isLoading = true;
    notifyListeners();
    final result = await service.createTodo(model);
    onCompleted.call(result);
    isLoading = false;
    notifyListeners();
    fetchAllTodosEvent();
  }

  void fetchAllTodosEvent() async {
    isLoading = true;
    notifyListeners();
    final result = await service.getAllTodos();
    todos = result?.todos ?? [];
    total = result?.total ?? 0;
    isLoading = false;
    notifyListeners();
  }

  void fetchMoreTodos() async {
    if (isLoadingMore) return;
    if (todos.length >= total) return;
    isLoadingMore = true;
    notifyListeners();
    final result = await service.getAllTodos(
      offset: todos.length,
    );
    todos = [...todos, ...result?.todos ?? []];
    total = result?.total ?? 0;
    isLoadingMore = false;
    notifyListeners();
  }

  void deleteTodoEvent({
    required TodoModel todo,
    required VoidCallback onCompleted,
  }) async {
    if (todo.id == null) return;
    isLoading = true;
    notifyListeners();
    await service.deleteTodo(todo.id!);
    isLoading = false;
    _removeTodoFromList(todo);
    onCompleted.call();
    notifyListeners();
  }

  void _removeTodoFromList(TodoModel todo) {
    todos.remove(todo);
    total = total - 1;
    notifyListeners();
  }
}
