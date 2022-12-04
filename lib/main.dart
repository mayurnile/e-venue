import 'package:flutter/material.dart';
import "package:get/get.dart";

import "./core/core.dart";
import "./di/locator.dart" as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Venue Booking",
      theme: AppTheme.getThemeData(),
      navigatorKey: di.locator<NavigationService>().navigatorKey,
      onGenerateRoute: generateRoute,
    );
  }
}
