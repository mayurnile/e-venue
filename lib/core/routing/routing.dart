import 'package:flutter/material.dart';

import "./routing_animations.dart";

import "../core.dart";

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.defaultRoute:
      return getCupertinoSlideRoute(const HomeScreen(), settings);
    case AppRoutes.homeRoute:
      return getCupertinoSlideRoute(const HomeScreen(), settings);
    case AppRoutes.venueDetails:
      final Map<String, dynamic>? args = settings.arguments as Map<String, dynamic>?;
      return getCupertinoSlideRoute(VenueDetails(venue: args!["venue"]), settings);
    default:
      return getCupertinoSlideRoute(const HomeScreen(), settings);
  }
}
