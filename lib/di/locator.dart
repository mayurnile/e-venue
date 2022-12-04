import "package:get_it/get_it.dart";

import './services_injection.dart';
import './controller_injection.dart';

final GetIt locator = GetIt.instance;

void init() {
  // initialies services
  initServices();

  // initialize controllers
  initControllers();
}
