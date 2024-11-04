import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:jkb_sept/auth/model/login_request_model.dart';
import 'package:jkb_sept/auth/model/user_model.dart';
import 'package:jkb_sept/database/local_database.dart';

class LoginViewModel extends ChangeNotifier {
  void login(LoginRequestModel request) async {
    try {
      final response = await LocalDatabase.instance.database.query(
        'users',
        columns: ['id', 'name', 'email', 'createdAt'],
        where: 'email = ? AND password = ?',
        whereArgs: [request.email, request.password],
      );
      if (response.isNotEmpty) {
        final first = response.first;
        final userModel = UserModel(
          name: first['name'] as String,
          email: first['email'] as String,
          createdAt: DateTime.fromMillisecondsSinceEpoch(
            first['createdAt'] as int,
          ),
        );
        log('login $userModel', name: '$runtimeType');
      }
    } catch (e, s) {
      log('login', name: '$runtimeType', error: e, stackTrace: s);
    }
  }
}
