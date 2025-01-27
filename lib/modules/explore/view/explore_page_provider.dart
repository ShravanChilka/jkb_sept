import 'package:flutter/material.dart';
import 'package:jkb_sept/modules/explore/view/explore_page.dart';
import 'package:jkb_sept/modules/explore/view_model/explore_view_model.dart';
import 'package:provider/provider.dart';

class ExplorePageProvider extends StatelessWidget {
  const ExplorePageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ExploreViewModel(),
      child: const ExplorePage(),
    );
  }
}
