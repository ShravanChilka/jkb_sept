import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jkb_sept/modules/auth/service/auth_service.dart';
import 'package:jkb_sept/modules/explore/model/wallapaper_model.dart';

class FavouriteDatabaseService {
  final _client = FirebaseFirestore.instance;
  final _authService = AuthService();

  Future<List<WallapaperModel>?> getAllFavourites() async {
    final currentUser = _authService.getUser();
    if (currentUser == null) return null;
    final ref = _client
        .collection('users')
        .doc(currentUser.uid)
        .collection('favourites');

    final snapshot = await ref.get();
    return snapshot.docs
        .map((doc) => WallapaperModel.fromMap(doc.data()))
        .toList();
  }
}
