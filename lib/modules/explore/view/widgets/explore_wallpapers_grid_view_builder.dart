import 'package:flutter/material.dart';
import 'package:jkb_sept/modules/explore/model/wallapaper_model.dart';
import 'package:jkb_sept/modules/explore/view_model/explore_view_model.dart';
import 'package:provider/provider.dart';

import 'explore_wallapaper_grid_view.dart';

class ExploreWallpapersGridViewBuilder extends StatefulWidget {
  const ExploreWallpapersGridViewBuilder({super.key});

  @override
  State<ExploreWallpapersGridViewBuilder> createState() =>
      _ExploreWallpapersGridViewBuilderState();
}

class _ExploreWallpapersGridViewBuilderState
    extends State<ExploreWallpapersGridViewBuilder> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (mounted) context.read<ExploreViewModel>().fetchWallpaper();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Selector<ExploreViewModel, List<WallapaperModel>>(
      selector: (_, vm) => vm.wallpapers,
      builder: (context, wallpapers, child) {
        return ExploreWallapaperGridView(
          wallpapers: wallpapers,
        );
      },
    );
  }
}
