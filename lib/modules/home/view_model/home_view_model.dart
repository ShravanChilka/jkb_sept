import 'package:flutter/material.dart';
import 'package:jkb_sept/modules/favourites/view/favourites_page.dart';
import 'package:jkb_sept/modules/home/model/bottom_nav_model.dart';

import '../../explore/view/explore_page.dart';

class HomeViewModel extends ChangeNotifier {
  final navigationItems = const [
    BottomNavModel(
      name: 'Explore',
      icon: Icon(Icons.search),
      page: ExplorePage(),
    ),
    BottomNavModel(
      name: 'Favourites',
      icon: Icon(Icons.favorite),
      page: FavouritesPage(),
    ),
  ];

  int selectedIndex = 0;

  void indexChangedEvent(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  Widget get selectedPage => navigationItems[selectedIndex].page;
}
