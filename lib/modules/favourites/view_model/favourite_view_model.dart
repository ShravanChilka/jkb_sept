import 'package:flutter/material.dart';
import 'package:jkb_sept/modules/explore/model/wallapaper_model.dart';
import 'package:jkb_sept/modules/favourites/service/favourite_database_service.dart';

class FavouriteViewModel extends ChangeNotifier {
  final _service = FavouriteDatabaseService();

  List<WallapaperModel> wallpapers = [];

  Future<void> fetchWallpapers() async {
    final result = await _service.getAllFavourites();
    wallpapers = result ?? [];
    notifyListeners();
  }
}
