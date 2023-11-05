import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class Language {
  final Locale locale;

  Language(this.locale);

  static Language of(BuildContext context) {
    return Localizations.of<Language>(context, Language)!;
  }

  static const supportedLocales = [
    Locale('en', 'US'), // English
    Locale('vi', 'VN'), // Spanish
    // Add other supported locales
  ];

  static Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates = const [
    LocalizationDelegate(),
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'hello': 'Hello',
      'welcome': 'Welcome',
    },
    'vi': {
      'hello': 'Xin chào',
      'welcome': 'Bienvenido',
    },
  };

  String get hello {
    return _localizedValues[locale.languageCode]!['hello']!;
  }

  String get welcome {
    return _localizedValues[locale.languageCode]!['welcome']!;
  }
}

class LocalizationDelegate extends LocalizationsDelegate<Language> {
  const LocalizationDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'vi'].contains(locale.languageCode);

  @override
  Future<Language> load(Locale locale) {
    return SynchronousFuture<Language>(Language(locale));
  }

  @override
  bool shouldReload(LocalizationDelegate old) => false;
}
