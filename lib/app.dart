import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipesharing/view.dart' as view;

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
      designSize: Size(412, 915),
      minTextAdapt: true,
      splitScreenMode: true,
      child: view.View(),
    );
  }
}
