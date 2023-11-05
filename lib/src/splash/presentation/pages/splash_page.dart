import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:recipesharing/core/services/injection_container.dart';
import 'package:recipesharing/src/auth/presentation/pages/login_page.dart';
import 'package:recipesharing/src/splash/presentation/cubit/splash_cubit.dart';
import '../../../../core/services/navigation.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});
  static const String routeName = '/splash';

  @override
  Widget build(BuildContext context) {
    getIt<SplashCubit>().loadData();

    return BlocListener<SplashCubit, SplashState>(
      bloc: getIt<SplashCubit>(),
      listener: (context, state) {
        if (state is SplashLoadedState) {
          getIt<Navigation>()
              .pushNamedAndRemoveUntil(LoginPage.routeName, (route) => false);
          FlutterNativeSplash.remove();
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
