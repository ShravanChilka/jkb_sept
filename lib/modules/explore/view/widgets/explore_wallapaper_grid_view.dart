import 'package:flutter/material.dart';
import 'package:jkb_sept/modules/explore/model/wallapaper_model.dart';

import 'explore_wallpaper_grid_view_item.dart';

class ExploreWallapaperGridView extends StatelessWidget {
  const ExploreWallapaperGridView({
    super.key,
    required this.wallpapers,
  });

  final List<WallapaperModel> wallpapers;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: wallpapers.length,
      padding: const EdgeInsetsDirectional.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.4,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemBuilder: (context, index) {
        final wallpaper = wallpapers[index];
        return ExploreWallpaperGridViewItem(
          wallpaper: wallpaper,
        );
      },
    );
  }
}
