import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jkb_sept/modules/auth/model/user_model.dart';

class AllChatFirestoreService {
  final _client = FirebaseFirestore.instance;

  Future<List<UserModel>> searchUsers(String query) async {
    final response = await _client
        .collection('users')
        .where(
          'userName',
          isLessThanOrEqualTo: query.trim().toLowerCase(),
        )
        .get();
    log(response.docs.toString());
    return response.docs
        .map((snapshot) => UserModel.fromMap(snapshot.data()))
        .toList();
  }
}
