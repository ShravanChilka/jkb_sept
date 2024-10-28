import 'package:flutter/material.dart';
import 'package:jkb_sept/material_app_widget.dart';

import 'global_provider.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return const GlobalProvider(
      child: MaterialAppWidget(),
    );
  }
}
