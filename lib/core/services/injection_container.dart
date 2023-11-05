import 'package:get_it/get_it.dart';
import 'package:recipesharing/core/blocs/theme/theme_bloc.dart';
import 'package:recipesharing/core/services/navigation.dart';
import 'package:recipesharing/core/services/shared_preference.dart';
import 'package:recipesharing/core/utils/global.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../src/splash/presentation/cubit/splash_cubit.dart';
import '../blocs/locale/locale_bloc.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupInjector() async {
  final shared = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => SharedPreference(shared));

  getIt.registerSingleton<Navigation>(Navigation());
  getIt.registerSingleton<Global>(Global());

  getIt.registerLazySingleton(() => ThemeBloc(getIt()));
  getIt.registerLazySingleton(() => LocaleBloc(getIt()));
  getIt.registerLazySingleton(() => SplashCubit());
}
