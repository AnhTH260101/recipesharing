import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipesharing/core/res/colors.dart' as colors;
import 'package:recipesharing/core/res/fonts.dart';

class Theme {
  // Function to create material color from simple color
  static MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }

    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((r - 255).abs() * ds).round(),
        g + ((g - 255).abs() * ds).round(),
        b + ((b - 255).abs() * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }

  // Define common text styles
  static const TextStyle _baseTextStyle = TextStyle(fontFamily: Fonts.poppins);

  // Define the light theme text styles
  static final TextTheme _lightTextTheme = TextTheme(
    displayLarge: _baseTextStyle.copyWith(
      fontSize: 32.0.sp,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    displayMedium: _baseTextStyle.copyWith(
      fontSize: 28.0.sp,
        fontWeight: FontWeight.w600,
      color: Colors.black87,
    ),
    displaySmall: _baseTextStyle.copyWith(
      fontSize: 18.0.sp,
      fontWeight: FontWeight.w400,
      color: Colors.black45,
    ),
    bodyLarge: _baseTextStyle.copyWith(
      fontSize: 20.0.sp,
      color: Colors.black,
    ),
    bodyMedium: _baseTextStyle.copyWith(
      fontSize: 18.0.sp,
      color: Colors.black,
    ),
    bodySmall: _baseTextStyle.copyWith(
      fontSize: 16.0.sp,
      color: Colors.black,
    ),
    labelLarge: _baseTextStyle.copyWith(
      fontSize: 20.0.sp,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
      wordSpacing: 0.5,
      color: Colors.white,
    ),
    labelMedium: _baseTextStyle.copyWith(
      fontSize: 18.0.sp,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.4,
      wordSpacing: 0.4,
      color: Colors.white,
    ),
    labelSmall: _baseTextStyle.copyWith(
      fontSize: 16.0.sp,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
  );

  // Define the dark theme text styles
  static final TextTheme _darkTextTheme = TextTheme(
    displayLarge: _baseTextStyle.copyWith(
      fontSize: 32.0.sp,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    displayMedium: _baseTextStyle.copyWith(
      fontSize: 30.0.sp,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    displaySmall: _baseTextStyle.copyWith(
      fontSize: 18.0.sp,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    bodyLarge: _baseTextStyle.copyWith(
      fontSize: 20.0.sp,
      color: Colors.white,
    ),
    bodyMedium: _baseTextStyle.copyWith(
      fontSize: 18.0.sp,
      color: Colors.white,
    ),
    bodySmall: _baseTextStyle.copyWith(
      fontSize: 16.0.sp,
      color: Colors.white,
    ),
    labelLarge: _baseTextStyle.copyWith(
      fontSize: 20.0.sp,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.5,
      wordSpacing: 0.5,
      color: Colors.white,
    ),
    labelMedium: _baseTextStyle.copyWith(
      fontSize: 18.0.sp,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.4,
      wordSpacing: 0.4,
      color: Colors.white,
    ),
    labelSmall: _baseTextStyle.copyWith(
      fontSize: 16.0.sp,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  );

  // Define light theme colors
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: createMaterialColor(colors.Colors.white),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: _lightTextTheme,
    appBarTheme: AppBarTheme(elevation: 0, backgroundColor: Colors.white),
scaffoldBackgroundColor: colors.Colors.white,
  );

  // Define dark theme colors
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: createMaterialColor(colors.Colors.primaryDark),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: _darkTextTheme,
    appBarTheme: AppBarTheme(elevation: 0)
  );
}
