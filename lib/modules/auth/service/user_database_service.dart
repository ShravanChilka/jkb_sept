import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jkb_sept/modules/auth/model/user_model.dart';

class UserDatabaseService {
  final _client = FirebaseFirestore.instance;

  Future<UserModel?> createUser(UserModel model) async {
    try {
      final ref = _client.collection('users').doc(model.id);
      await ref.set(model.toMap());
      return model;
    } catch (e, s) {
      log('createUser', name: '$runtimeType', error: e, stackTrace: s);
      return null;
    }
  }
}
