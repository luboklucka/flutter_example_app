import 'package:flutter/widgets.dart';

class AppRoute {
  AppRoute.standard({
    bool showsBottomNavigation = false,
    bool opaque = true,
    RouteTransitionsBuilder? transitionsBuilder,
    required this.builder,
  }) : transitionPageRouteBuilder = (<T>(builder, arguments) {
          return defaultPageRouteBuilder(
            transitionsBuilder: transitionsBuilder,
            builder: builder,
            opaque: opaque,
          );
        });

  final WidgetBuilder builder;
  final PageRoute<T> Function<T>(WidgetBuilder, dynamic arguments)
      transitionPageRouteBuilder;
}

PageRoute<T> defaultPageRouteBuilder<T>({
  Duration transitionDuration = const Duration(milliseconds: 500),
  RouteTransitionsBuilder? transitionsBuilder,
  bool opaque = true,
  required WidgetBuilder builder,
  RouteObserver? routeObserver,
  RouteSettings settings = const RouteSettings(),
}) {
  return PageRouteBuilder(
    settings: settings,
    transitionDuration: transitionDuration,
    transitionsBuilder: transitionsBuilder ?? _transitionsBuilder,
    opaque: opaque,
    pageBuilder: (context, animation, secondaryAnimation) {
      return builder(context);
    },
  );
}

// Initial offset at 10% of route height.
// Will animate to 0% over the animation duration, moving upwards on the Y-axis.
const _startingOffset = Offset(0.0, 0.05);
const _endingOffset = Offset(0.0, 0.0);
final _offsetTween = Tween<Offset>(begin: _startingOffset, end: _endingOffset);
const _curve = Interval(0.000, 1.000, curve: Curves.ease);

Widget _transitionsBuilder(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  return _AnimationWrapper(
    animation: animation,
    child: child,
  );
}

class _AnimationWrapper extends StatelessWidget {
  const _AnimationWrapper({
    required this.animation,
    required this.child,
  });

  final Animation<double> animation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: CurvedAnimation(
        parent: animation,
        curve: Curves.ease,
      ),
      child: SlideTransition(
        position: _offsetTween.animate(
          CurvedAnimation(
            parent: animation,
            curve: _curve,
          ),
        ),
        child: child,
      ),
    );
  }
}
