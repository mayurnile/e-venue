import 'package:get/get.dart';

import './locator.dart';

import '../controllers/controllers.dart';

void initControllers() {
  // home controller
  final HomeController homeController = Get.put(
    HomeController(
      httpServices: locator(),
    ),
  );
  locator.registerLazySingleton(() => homeController);
}
