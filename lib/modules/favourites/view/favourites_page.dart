import 'package:flutter/material.dart';
import 'package:jkb_sept/modules/explore/model/wallapaper_model.dart';
import 'package:jkb_sept/modules/explore/view/widgets/explore_wallapaper_grid_view.dart';
import 'package:jkb_sept/modules/favourites/view_model/favourite_view_model.dart';
import 'package:provider/provider.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({super.key});

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (mounted) context.read<FavouriteViewModel>().fetchWallpapers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Selector<FavouriteViewModel, List<WallapaperModel>>(
      selector: (_, vm) => vm.wallpapers,
      builder: (context, wallpapers, child) {
        return RefreshIndicator(
          onRefresh: context.read<FavouriteViewModel>().fetchWallpapers,
          child: ExploreWallapaperGridView(
            wallpapers: wallpapers,
          ),
        );
      },
    );
  }
}
