import 'config.dart';

class DevConfig implements Config {
  @override
  String get apiBaseUrl => 'http://api-stg.combros.tech:10103';

  @override
  String get apiKey => 'your-stag-api-key-here';

  @override
  int get connectTimeout => 7000;

  @override
  int get receiveTimeout => 4000;
}
