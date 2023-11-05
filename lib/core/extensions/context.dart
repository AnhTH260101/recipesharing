import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  Size get size => mediaQuery.size;
  double get width => size.width;
  double get height => size.height;
  double get statusBarHeight => mediaQuery.padding.top;
  void showSnackBar(SnackBar snackBar) =>
      ScaffoldMessenger.of(this).showSnackBar(snackBar);
  // Locale extensions
  Locale get locale => Localizations.localeOf(this);
  // Accessibility extensions
  bool get isAccessibleNavigation => mediaQuery.accessibleNavigation;
  // Safe area related extensions
  EdgeInsets get safeAreaInsets => mediaQuery.viewPadding;
  // Device orientation
  Orientation get orientation => mediaQuery.orientation;
  // Checks if the keyboard is visible
  bool get isKeyboardOpen => mediaQuery.viewInsets.bottom > 0;
  // Retrieve the primary FocusNode of the current context
  FocusNode get focusNode => FocusScope.of(this);
  // Convenience method to unfocus current FocusNode
  void unfocus() => focusNode.unfocus();
  // ScaffoldMessenger related extensions
  void hideCurrentSnackBar({
    SnackBarClosedReason reason = SnackBarClosedReason.hide,
  }) =>
      ScaffoldMessenger.of(this).hideCurrentSnackBar(reason: reason);
  // Check if dark mode is enabled
  bool get isDarkMode => theme.brightness == Brightness.dark;
  // Device Pixel Ratio
  double get devicePixelRatio => mediaQuery.devicePixelRatio;
  // Retrieves an inherited widget of the exact type T<InheritedWidget> (or closest subtype).
  T? dependOnInheritedWidgetOfExactType<T extends InheritedWidget>() =>
      dependOnInheritedWidgetOfExactType<T>();
  // Retrieves the MaterialLocalizations instance, which provides localizations for Material Components widgets.
  MaterialLocalizations get materialLocalizations =>
      MaterialLocalizations.of(this);
  // Retrieves the closest ancestor Scaffold widget's state.
  ScaffoldState? get scaffold => Scaffold.maybeOf(this);
  // Gets the bottom view inset which usually represents keyboard height.
  double get bottomInset => mediaQuery.viewInsets.bottom;
}
