import 'package:flutter/material.dart';
import 'package:jkb_sept/modules/explore/model/wallapaper_model.dart';
import 'package:jkb_sept/modules/wallpaper/view/wallpaper_screen.dart';
import 'package:jkb_sept/modules/wallpaper/view_model/wallpaper_view_model.dart';
import 'package:provider/provider.dart';

class WallpaperScreenProvider extends StatelessWidget {
  const WallpaperScreenProvider({
    super.key,
    required this.model,
  });

  final WallapaperModel model;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WallpaperViewModel(model: model),
      child: const WallpaperScreen(),
    );
  }
}
