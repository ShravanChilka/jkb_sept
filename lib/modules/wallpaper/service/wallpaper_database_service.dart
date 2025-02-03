import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jkb_sept/modules/auth/service/auth_service.dart';
import 'package:jkb_sept/modules/explore/model/wallapaper_model.dart';

class WallpaperDatabaseService {
  final _client = FirebaseFirestore.instance;
  final _authService = AuthService();

  DocumentReference<Map<String, dynamic>>? wallpaperRef(WallapaperModel model) {
    final currentUser = _authService.getUser();
    if (currentUser == null) return null;
    return _client
        .collection('users')
        .doc(currentUser.uid)
        .collection('favourites')
        .doc(model.id.toString());
  }

  Future<bool?> checkIsFavourite(WallapaperModel model) async {
    final ref = wallpaperRef(model);
    if (ref == null) return null;
    return await ref.get().then((value) => value.exists);
  }

  Future<void> addToFavourites(WallapaperModel model) async {
    final ref = wallpaperRef(model);
    if (ref == null) return;

    await ref.set(model.toMap());
  }

  Future<void> removeFromFavourites(WallapaperModel model) async {
    final ref = wallpaperRef(model);
    if (ref == null) return;
    await ref.delete();
  }
}
