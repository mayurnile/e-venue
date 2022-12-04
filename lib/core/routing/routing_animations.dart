import "package:flutter/material.dart";

import "./route_names.dart";
import "./routing_animations/slide_route_animation.dart";
import "./routing_animations/custom_cupertino_slide_animation.dart";

PageRoute<CustomCupertinoSlideRoute> getCupertinoSlideRoute(
  Widget child,
  RouteSettings settings, {
  bool isFromBottom = false,
}) =>
    CustomCupertinoSlideRoute(
      child: child,
      routeName: settings.name ?? AppRoutes.defaultRoute,
      isFromBottom: isFromBottom,
    );

PageRoute<SlideRoute> getSlideRoute(Widget child, RouteSettings settings) => SlideRoute(
      child: child,
      routeName: settings.name ?? AppRoutes.defaultRoute,
    );
