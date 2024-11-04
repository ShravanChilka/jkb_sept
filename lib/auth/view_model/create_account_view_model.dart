import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:jkb_sept/database/local_database.dart';

import '../model/create_account_request_model.dart';

class CreateAccountViewModel extends ChangeNotifier {
  bool isLoading = false;

  void createAccount(CreateAccountRequestModel request) async {
    try {
      isLoading = true;
      notifyListeners();
      await Future.delayed(const Duration(seconds: 10));
      final id = await LocalDatabase.instance.database.insert(
        'users',
        {
          'name': request.name,
          'email': request.email,
          'password': request.password,
          'createdAt': DateTime.now().millisecondsSinceEpoch
        },
      );
      log('Account created $id', name: '$runtimeType');

      isLoading = false;
      notifyListeners();
    } catch (e, s) {
      log('createAccount', name: '$runtimeType', error: e, stackTrace: s);
    }
  }
}
