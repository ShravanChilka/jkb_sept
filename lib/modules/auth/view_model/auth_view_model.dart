import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jkb_sept/modules/auth/model/user_model.dart';
import 'package:jkb_sept/modules/auth/service/auth_service.dart';
import 'package:jkb_sept/modules/auth/service/user_database_service.dart';

class AuthViewModel extends ChangeNotifier {
  bool isLoading = false;
  User? _user;

  final _service = AuthService();
  final _userService = UserDatabaseService();

  bool get isAuthenticatied => _user != null;

  void loginWithGoogleClickEvent() async {
    isLoading = true;
    notifyListeners();
    _user = await _service.signInWithGoogle();
    if (_user != null) {
      final userModel = await _userService.createUser(
        UserModel.fromFirebaseUser(_user!),
      );
      log('Login sucess : $_user');
    }
    isLoading = false;
    notifyListeners();
  }

  void getUser() async {
    _user = await _service.getUser();
    notifyListeners();
  }

  void logoutClickEvent() async {
    await _service.logoutUser();
    _user = null;
    notifyListeners();
  }
}
