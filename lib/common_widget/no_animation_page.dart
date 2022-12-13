import 'package:flutter/material.dart';

class NoAnimationPage<T> extends MaterialPage<T> {
  const NoAnimationPage({required Widget child}) : super(child: child);

  @override
  Route<T> createRoute(BuildContext context) {
    return NoAnimationPageRoute<T>(page: this);
  }
}

class NoAnimationPageRoute<T> extends PageRoute<T>
    with MaterialRouteTransitionMixin<T> {
  NoAnimationPageRoute({
    required MaterialPage<T> page,
  }) : super(settings: page) {
    assert(opaque);
  }

  MaterialPage<T> get _page => settings as MaterialPage<T>;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 500);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return child;
  }

  @override
  Widget buildContent(BuildContext context) {
    return _page.child;
  }

  @override
  bool get maintainState => _page.maintainState;

  @override
  bool get fullscreenDialog => _page.fullscreenDialog;
}
