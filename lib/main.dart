import 'package:flutter/material.dart';
import 'package:jkb_sept/application.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:jkb_sept/core/env_service.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EnvService.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Application());
}
