import 'package:flutter/material.dart';
import 'package:jkb_sept/counter_page.dart';
import 'package:jkb_sept/theme_view_model.dart';
import 'package:provider/provider.dart';

class MaterialAppWidget extends StatelessWidget {
  const MaterialAppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = context.watch<ThemeViewModel>().themeData;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: const CounterPage(),
    );
  }
}
