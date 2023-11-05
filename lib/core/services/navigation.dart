import 'package:flutter/material.dart';

class Navigation {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<T?> push<T extends Object>(Route<T> route) {
    return navigatorKey.currentState!.push(route);
  }

  Future<T?> pushNamed<T extends Object>(String routeName,
      {Object? arguments}) {
    return navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  Future<T?> pushNamedAndRemoveUntil<T extends Object>(
      String newRouteName,
      RoutePredicate predicate, {
        Object? arguments,
      }) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
      newRouteName,
      predicate,
      arguments: arguments,
    );
  }

  Future<T?> replace<T extends Object, TO extends Object>(Route<T> newRoute) {
    return navigatorKey.currentState!.pushReplacement(newRoute);
  }

  Future<T?> replaceNamed<T extends Object, TO extends Object>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) {
    return navigatorKey.currentState!
        .pushReplacementNamed(routeName, result: result, arguments: arguments);
  }

  void pop<T extends Object>([T? result]) {
    navigatorKey.currentState!.pop(result);
  }

  void popToNamed(String routeName) {
    navigatorKey.currentState!
        .popUntil((route) => route.settings.name == routeName);
  }

  void popUntil(RoutePredicate predicate) {
    navigatorKey.currentState!.popUntil(predicate);
  }

  Future<T?> pushAndRemoveUntil<T extends Object>(
    Route<T> newRoute,
    RoutePredicate predicate,
  ) {
    return navigatorKey.currentState!.pushAndRemoveUntil(newRoute, predicate);
  }

  void popToRoot() {
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  BuildContext? getCurrentContext() {
    return navigatorKey.currentContext;
  }

  bool canPop() {
    return navigatorKey.currentState?.canPop() ?? false;
  }
}
