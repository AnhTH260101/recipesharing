import 'package:flutter/material.dart';
import 'package:recipesharing/src/auth/presentation/pages/login_page.dart';
import 'package:recipesharing/src/auth/presentation/pages/verify_mail_page.dart';
import 'package:recipesharing/src/manage/presentation/pages/bottom_bar_page.dart';

import '../../src/auth/presentation/pages/register_page.dart';
import '../../src/splash/presentation/pages/splash_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashPage.routeName:
      return _pageBuilderAnimation(
            (_) => LoginPage(),
        settings: settings,
      );
    case LoginPage.routeName:
      return _pageBuilderAnimation(
        (_) => LoginPage(),
        settings: settings,
      );
    case RegisterPage.routeName:
      return _pageBuilderAnimation(
            (_) => RegisterPage(),
        settings: settings,
      );
    case VerifyEmailPage.routeName:
      return _pageBuilderAnimation(
            (_) => VerifyEmailPage(),
        settings: settings,
      );
    case BottomBarPage.routeName:
      return _pageBuilderAnimation(
            (_) => BottomBarPage(),
        settings: settings,
      );
    default:
      return _pageBuilderAnimation(
        (_) => Scaffold(
          body: Center(
            child: Text('Not found ${settings.name} page'),
          ),
        ),
        settings: settings,
      );
  }
}

PageRouteBuilder<dynamic> _pageBuilderAnimation(
  Widget Function(BuildContext) page, {
  required RouteSettings settings,
}) {
  return PageRouteBuilder<dynamic>(
    settings: settings,
    transitionsBuilder: (_, animation, __, child) {
      const begin = Offset(-1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;
      final tween =
          Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      final offsetAnimation = animation.drive(tween);
      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
    pageBuilder: (context, _, __) => page(context),
  );
}
