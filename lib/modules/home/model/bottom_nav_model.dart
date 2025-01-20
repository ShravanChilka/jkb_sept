import 'package:flutter/material.dart';

class BottomNavModel {
  final String name;
  final Icon icon;
  final Widget page;

  const BottomNavModel({
    required this.name,
    required this.icon,
    required this.page,
  });
}
