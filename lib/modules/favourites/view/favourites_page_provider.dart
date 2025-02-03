import 'package:flutter/material.dart';
import 'package:jkb_sept/modules/favourites/view/favourites_page.dart';
import 'package:jkb_sept/modules/favourites/view_model/favourite_view_model.dart';
import 'package:provider/provider.dart';

class FavouritesPageProvider extends StatelessWidget {
  const FavouritesPageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavouriteViewModel(),
      child: const FavouritesPage(),
    );
  }
}
