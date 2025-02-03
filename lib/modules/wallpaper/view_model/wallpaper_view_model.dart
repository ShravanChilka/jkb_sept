import 'package:flutter/foundation.dart';

import 'package:jkb_sept/modules/explore/model/wallapaper_model.dart';
import 'package:jkb_sept/modules/wallpaper/service/wallpaper_database_service.dart';

class WallpaperViewModel extends ChangeNotifier {
  WallpaperViewModel({
    required this.model,
  });

  final WallapaperModel model;
  bool? isFavourite;

  final _service = WallpaperDatabaseService();

  void checkIsFavourite() async {
    isFavourite = await _service.checkIsFavourite(model);
    notifyListeners();
  }

  void addToFavouriteClickEvent() async {
    if (isFavourite == true) {
      await _service.removeFromFavourites(model);
      isFavourite = false;
    } else {
      await _service.addToFavourites(model);
      isFavourite = true;
    }
    notifyListeners();
  }
}
