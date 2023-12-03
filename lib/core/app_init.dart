import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:veegil/core/database/database.dart';

/// a simple class that handles every app initializations
class AppInitialization {
  ///  All app's startup initializations that need to run before app runs
  static Future<void> setup() async {
    WidgetsFlutterBinding.ensureInitialized();
    await DatabaseService.instance.initialize();
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}
