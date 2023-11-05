import 'package:flutter/material.dart';

import '../environments/config_manager.dart';

class Constants {
  const Constants._();
  // SharedPreferences keys
  static const String sharedThemeKey = 'theme';
  static const String sharedLocaleKey = 'locale';
  static const String sharedUserKey = 'user';
  static const String sharedEmailKey = 'email';
  static const String sharedUsernameKey = 'username';
  static const String sharedPhoneKey = 'phone';
  static const String sharedExpiryKey = 'expiry';
  static const String sharedAccessTokenKey = 'access_token';
  static const String sharedRefreshTokenKey = 'refresh_token';
  static const String sharedListTopicDevice = 'list_device_topic';
  // Color
  static const Color primaryLightColor = Color(0xFF71B1A1);
  static const Color appBarColor = Color(0xFF53B175);
  static const Color buttonColor1 = Color(0xFFFB8F66);
  static const Color buttonColor2 = Color(0xFFB661B2);
  static const Color buttonColor3 = Color(0xFF7033FF);
  static const Color linkColor = Color(0xFF53B175);

  static const double padding = 24;

  // Endpoints
  static String apiLoginUrl = '${ConfigManager.config.apiBaseUrl}/iot/signIn';
}
