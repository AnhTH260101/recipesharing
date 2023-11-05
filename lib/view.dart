import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipesharing/core/blocs/theme/theme_bloc.dart';
import 'package:recipesharing/core/enums/enums.dart';
import 'package:recipesharing/core/language/language.dart';
import 'package:recipesharing/core/services/injection_container.dart';
import 'package:recipesharing/core/services/navigation.dart';
import 'package:recipesharing/core/services/router.dart';
import 'package:recipesharing/src/auth/presentation/pages/login_page.dart';
import 'package:recipesharing/src/splash/presentation/pages/splash_page.dart';

import 'core/blocs/locale/locale_bloc.dart';
import 'core/common/widgets/gradient_button_widget.dart';
import 'core/common/widgets/logo_widget.dart';
import 'core/common/widgets/text_field_widget.dart';

class View extends StatelessWidget {
  const View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      bloc: getIt<ThemeBloc>(),
      builder: (context,themeState) {
        return BlocBuilder<LocaleBloc, LocaleState>(
          bloc: getIt<LocaleBloc>(),
          builder: (context, localeState) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: const SplashPage(),
              navigatorKey: getIt<Navigation>().navigatorKey,
              onGenerateRoute: generateRoute,
              theme: themeState.themeData,
              locale: localeState.locale,
              localizationsDelegates: Language.localizationsDelegates,
              supportedLocales: Language.supportedLocales,
            );
          },
        );
      },
    );
  }
}

// class SplashPage extends StatelessWidget {
//   const SplashPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final language = Language.of(context);
//     final TextEditingController email = TextEditingController();
//     final TextEditingController password = TextEditingController();
//     final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//     final FocusScopeNode node = FocusScopeNode();
//     return  Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(language.hello),
//             ElevatedButton(onPressed: (){
//               getIt<ThemeBloc>().add(ChangeThemeEvent(theme: EnumTheme.light.name));
//               getIt<LocaleBloc>().add(ChangeLocaleEvent(locale: Locale(EnumLocale.vi.name)));
//             }, child: Text("clecik")),
//             ElevatedButton(onPressed: (){
//               getIt<ThemeBloc>().add(ChangeThemeEvent(theme: EnumTheme.dark.name));
//               getIt<LocaleBloc>().add(ChangeLocaleEvent(locale: Locale(EnumLocale.en.name)));
//             }, child: Text("clecik2")),
//             GradientButtonWidget(label: "Sign In", onPressed: (){},),
//             TextFieldWidget(textEditingController: email, node: node,),
//             LogoWidget()
//           ],
//         ),
//       ),
//     );
//   }
// }
