import 'package:flutter/material.dart';
import 'package:jkb_sept/modules/explore/model/wallapaper_model.dart';
import 'package:jkb_sept/modules/explore/service/explore_remote_service.dart';

class ExploreViewModel extends ChangeNotifier {
  List<WallapaperModel> wallpapers = [];

  final _service = ExploreRemoteService();

  void fetchWallpaper() async {
    final response = await _service.getWallpapers();
    response.fold(
      (l) {},
      (r) {
        wallpapers = r.photos;

        notifyListeners();
      },
    );
  }
}
