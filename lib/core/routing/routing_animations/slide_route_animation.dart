import "package:flutter/material.dart";

class SlideRoute extends PageRouteBuilder<SlideRoute> {
  final Widget child;
  final String routeName;

  SlideRoute({required this.child, required this.routeName})
      : super(
          settings: RouteSettings(name: routeName),
          barrierColor: Colors.black,
          barrierDismissible: true,
          fullscreenDialog: false,
          opaque: false,
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            final Animatable<Offset> kOffsetTween = Tween<Offset>(
              begin: const Offset(0.0, 1.0),
              end: Offset.zero,
            );

            final Animation<Offset> offsetAnimation = CurvedAnimation(
              parent: animation,
              curve: Curves.linearToEaseOut,
              reverseCurve: Curves.easeInToLinear,
            ).drive(kOffsetTween);

            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 700),
          reverseTransitionDuration: const Duration(milliseconds: 700),
        );
}
