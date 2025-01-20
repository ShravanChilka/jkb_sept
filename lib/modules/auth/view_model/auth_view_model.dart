import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jkb_sept/modules/auth/service/auth_service.dart';

class AuthViewModel extends ChangeNotifier {
  bool isLoading = false;
  User? _user;

  final _service = AuthService();

  bool get isAuthenticatied => _user != null;

  void loginWithGoogleClickEvent() async {
    isLoading = true;
    notifyListeners();
    _user = await _service.signInWithGoogle();
    log('Login sucess : $_user');
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
