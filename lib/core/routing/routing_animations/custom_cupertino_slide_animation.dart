import "package:flutter/material.dart";

class CustomCupertinoSlideRoute extends PageRouteBuilder<CustomCupertinoSlideRoute> {
  final Widget child;
  final String routeName;
  final bool isFromBottom;

  CustomCupertinoSlideRoute({
    required this.child,
    required this.routeName,
    this.isFromBottom = false,
  }) : super(
          settings: RouteSettings(name: routeName),
          barrierColor: Colors.black,
          barrierDismissible: isFromBottom,
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
            // Offset from offscreen to the right to fully on screen.
            final Animatable<Offset> kRightMiddleTween = Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            );

            // Offset from offscreen to the center from bottom
            final Animatable<Offset> kBottomMiddleTween = Tween<Offset>(
              begin: const Offset(0.0, 1.0),
              end: Offset.zero,
            );

            // Scale down to 80% from the original size
            final Animatable<double> kScaleDown = Tween<double>(begin: 1.0, end: 0.87);

            final Animation<Offset> primaryPositionAnimation = isFromBottom
                ? CurvedAnimation(
                    parent: animation,
                    curve: Curves.linearToEaseOut,
                    reverseCurve: Curves.easeInToLinear,
                  ).drive(kBottomMiddleTween)
                : CurvedAnimation(
                    parent: animation,
                    curve: Curves.linearToEaseOut,
                    reverseCurve: Curves.easeInToLinear,
                  ).drive(kRightMiddleTween);

            final Animation<double> scaleAnimation = CurvedAnimation(
              parent: secondaryAnimation,
              curve: Curves.linearToEaseOut,
              reverseCurve: Curves.easeInToLinear,
            ).drive(kScaleDown);

            final TextDirection textDirection = Directionality.of(context);

            return ScaleTransition(
              scale: scaleAnimation,
              alignment: Alignment.bottomCenter,
              child: SlideTransition(
                position: primaryPositionAnimation,
                textDirection: textDirection,
                child: child,
              ),
            );
          },
          transitionDuration: const Duration(milliseconds: 700),
          reverseTransitionDuration: const Duration(milliseconds: 700),
        );
}
