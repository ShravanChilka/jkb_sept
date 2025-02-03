import 'package:flutter/material.dart';
import 'package:jkb_sept/modules/explore/view/widgets/explore_wallpapers_grid_view_builder.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {},
      child: const ExploreWallpapersGridViewBuilder(),
    );
  }
}
