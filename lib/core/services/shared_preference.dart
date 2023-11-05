import 'package:recipesharing/core/enums/enums.dart';
import 'package:recipesharing/core/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  final SharedPreferences shared;

  SharedPreference(this.shared);

  Future<void> setTheme(String theme) async {
    await shared.setString(Constants.sharedThemeKey, theme);
  }

  String getTheme() {
    return shared.getString(Constants.sharedThemeKey) ?? EnumTheme.light.name;
  }

  Future<void> setLocale(String locale) async {
    await shared.setString(Constants.sharedLocaleKey, locale);
  }

  String getLocale() {
    return shared.getString(Constants.sharedLocaleKey) ?? 'vi';
  }

  Future<void> setAccessToken(String token) async {
    await shared.setString(Constants.sharedAccessTokenKey, token);
  }

  String getAccessToken() {
    return shared.getString(Constants.sharedAccessTokenKey) ?? '';
  }

  Future<void> setRefreshToken(String token) async {
    await shared.setString(Constants.sharedRefreshTokenKey, token);
  }

  String getRefreshToken() {
    return shared.getString(Constants.sharedRefreshTokenKey) ?? '';
  }

  Future<void> setUser(String userJson) async {
    await shared.setString(Constants.sharedUserKey, userJson);
  }

  String getUser() {
    return shared.getString(Constants.sharedUserKey) ?? '';
  }

  Future<void> setEmail(String userJson) async {
    await shared.setString(Constants.sharedEmailKey, userJson);
  }

  String getEmail() {
    return shared.getString(Constants.sharedEmailKey) ?? '';
  }

  Future<void> setUsername(String userJson) async {
    await shared.setString(Constants.sharedUsernameKey, userJson);
  }

  String getUsername() {
    return shared.getString(Constants.sharedUsernameKey) ?? '';
  }

  Future<void> setPhone(String userJson) async {
    await shared.setString(Constants.sharedPhoneKey, userJson);
  }

  String getPhone() {
    return shared.getString(Constants.sharedPhoneKey) ?? '';
  }

  Future<void> setExpiry(int expiry) async {
    await shared.setInt(Constants.sharedExpiryKey, expiry);
  }

  int getExpiry() {
    return shared.getInt(Constants.sharedExpiryKey) ?? 0;
  }

  void clearUser() async {
    shared.remove(Constants.sharedUserKey);
  }

  void clearTokens() async {
    shared.remove(Constants.sharedAccessTokenKey);
    shared.remove(Constants.sharedRefreshTokenKey);
  }

  void clearAll() async {
    shared.remove(Constants.sharedUserKey);
    shared.remove(Constants.sharedAccessTokenKey);
    shared.remove(Constants.sharedRefreshTokenKey);
    shared.remove(Constants.sharedExpiryKey);
    shared.remove(Constants.sharedEmailKey);
    shared.remove(Constants.sharedPhoneKey);
    shared.remove(Constants.sharedUsernameKey);
  }

  void setListDeviceTopic(List<String> listTopicDevice) async {
    shared.setStringList(Constants.sharedListTopicDevice, listTopicDevice);
  }

  Future<List<String>> getListDeviceTopic() async {
    return shared.getStringList(Constants.sharedListTopicDevice) ?? [];
  }
}
