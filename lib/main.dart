import 'package:flutter/material.dart';
import 'package:jkb_sept/application.dart';
import 'package:jkb_sept/database/local_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalDatabase.instance.createDatabase();
  runApp(
    const Application(),
  );
}
