import 'dart:developer';

import 'package:jkb_sept/core/database/local_database.dart';
import 'package:jkb_sept/modules/todo/model/get_todo_response_model.dart';
import 'package:jkb_sept/modules/todo/model/todo_model.dart';
import 'package:sqflite/sqflite.dart';

class TodoLocalDatabaseService {
  final _db = LocalDatabase.instance.database;

  Future<TodoModel?> createTodo(TodoModel model) async {
    try {
      final id = await _db.insert(
        'todos',
        model.toDatabaseMap(),
      );
      log('Created todo id : $id');
      return model.copyWith(
        id: id,
      );
    } catch (e, s) {
      log('createTodo', error: e, stackTrace: s, name: '$runtimeType');
      return null;
    }
  }

  Future<GetTodoResponseModel?> getAllTodos({
    int limit = 14,
    int offset = 0,
  }) async {
    try {
      final total = Sqflite.firstIntValue(
        await _db.rawQuery('SELECT COUNT(*) FROM todos'),
      );
      final result = await _db.query(
        'todos',
        limit: limit,
        offset: offset,
        orderBy: 'id DESC',
      );
      await Future.delayed(const Duration(seconds: 1));
      final todos = result.map((map) {
        return TodoModel.fromDatabaseMap(map);
      }).toList();
      return GetTodoResponseModel(
        todos: todos,
        total: total ?? 0,
      );
    } catch (e, s) {
      log('getAllTodos', error: e, stackTrace: s, name: '$runtimeType');
      return null;
    }
  }

  Future<TodoModel?> updateTodo(int id, TodoModel model) async {
    try {
      final result = await _db.update(
        'todos',
        model.toDatabaseMap(),
        where: 'id = ?',
        whereArgs: [id],
      );
      log('Updated $result todo');
      return model;
    } catch (e, s) {
      log('updateTodo', error: e, stackTrace: s, name: '$runtimeType');
      return null;
    }
  }

  Future<void> deleteTodo(int id) async {
    try {
      final result = await _db.delete(
        'todos',
        where: 'id = ?',
        whereArgs: [id],
      );
      log('Deleted $result todo');
    } catch (e, s) {
      log('deleteTodo', error: e, stackTrace: s, name: '$runtimeType');
    }
  }
}
