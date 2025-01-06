import 'package:jkb_sept/modules/todo/model/todo_status.dart';

import 'todo_category.dart';
import 'todo_priority.dart';

class TodoModel {
  const TodoModel({
    this.id,
    required this.title,
    this.description,
    required this.category,
    required this.priority,
    required this.status,
    required this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory TodoModel.fromDatabaseMap(Map<String, dynamic> map) {
    return TodoModel(
      id: map['id'] as int,
      title: map['title'] as String,
      description: map['description'] as String?,
      category: mapToTodoCategory(map['category'] as String),
      priority: mapToTodoPriority(map['priority'] as String),
      status: mapToTodoStatus(map['status'] as String),
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      updatedAt: (map['updatedAt'] as int?) != null
          ? DateTime.fromMillisecondsSinceEpoch(
              map['updatedAt'] as int,
            )
          : null,
      deletedAt: (map['deletedAt'] as int?) != null
          ? DateTime.fromMillisecondsSinceEpoch(
              map['deletedAt'] as int,
            )
          : null,
    );
  }

  final int? id;
  final String title;
  final String? description;
  final TodoCategory category;
  final TodoPriority priority;
  final TodoStatus status;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;

  Map<String, dynamic> toDatabaseMap() {
    return {
      'title': title.trim(),
      'description': description?.trim(),
      'category': category.name,
      'priority': priority.name,
      'status': status.name,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt?.millisecondsSinceEpoch,
      'deletedAt': deletedAt?.millisecondsSinceEpoch,
    };
  }

  TodoModel copyWith({
    int? id,
  }) {
    return TodoModel(
      id: id ?? this.id,
      title: title,
      description: description,
      category: category,
      priority: priority,
      status: status,
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
    );
  }
}
