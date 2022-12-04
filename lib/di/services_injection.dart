import './locator.dart';

import "../services/navigation_service.dart";
import "../services/http_services.dart";

void initServices() {
  // Navigation Service
  locator.registerLazySingleton(() => NavigationService());

  // HTTP Services
  locator.registerLazySingleton<HttpServices>(() => HttpServicesImpl());
}
