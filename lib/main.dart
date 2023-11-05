import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:recipesharing/app.dart';
import 'package:recipesharing/core/environments/config_manager.dart';
import 'package:recipesharing/core/services/bloc_observer.dart';
import 'package:recipesharing/core/services/error_handler.dart';
import 'package:recipesharing/core/services/injection_container.dart';

Future<void> main() async {
  // Handler error global
  await runZonedGuarded(() async {
    FlutterError.onError = (FlutterErrorDetails details) {
      ErrorHandler.handleException(details.exception, details.stack);
    };
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    ConfigManager.setEnvironment(Environment.dev);
    // Set up injector
    await setupInjector();
    // Set up bloc observer
    Bloc.observer = BlocObservers();
    runApp(const App());
  }, (error, stackTrace) {
    ErrorHandler.handleException(error, stackTrace);
  });
}
