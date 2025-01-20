import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/home_view_model.dart';

class HomeNavigationBar extends StatelessWidget {
  const HomeNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<HomeViewModel, int>(
      selector: (context, viewModel) => viewModel.selectedIndex,
      builder: (context, selectedIndex, child) {
        return NavigationBar(
          selectedIndex: selectedIndex,
          onDestinationSelected: (index) {
            context.read<HomeViewModel>().indexChangedEvent(index);
          },
          destinations: context
              .read<HomeViewModel>()
              .navigationItems
              .map(
                (model) => NavigationDestination(
                  icon: model.icon,
                  label: model.name,
                ),
              )
              .toList(),
        );
      },
    );
  }
}
