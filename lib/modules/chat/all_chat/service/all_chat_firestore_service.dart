import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jkb_sept/modules/auth/model/user_model.dart';
import 'package:jkb_sept/modules/auth/service/auth_service.dart';
import 'package:jkb_sept/modules/chat/chat/model/recent_chat_model.dart';

class AllChatFirestoreService {
  final _client = FirebaseFirestore.instance;

  final _authService = AuthService();

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

  Query<RecentChatModel> getAllRecentChatsQuery() {
    final user = _authService.getUser();
    return _client
        .collection('users')
        .doc(user!.uid)
        .collection('recentChats')
        .withConverter(
      fromFirestore: (snapshot, options) {
        return RecentChatModel.fromMap(snapshot.data()!);
      },
      toFirestore: (value, options) {
        return value.toMap();
      },
    );
  }
}
