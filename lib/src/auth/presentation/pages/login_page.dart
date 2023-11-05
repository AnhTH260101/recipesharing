import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:recipesharing/core/common/widgets/gradient_button_widget.dart';
import 'package:recipesharing/core/common/widgets/logo_widget.dart';
import 'package:recipesharing/core/common/widgets/text_field_widget.dart';
import 'package:recipesharing/core/extensions/context.dart';
import 'package:recipesharing/core/res/assets.dart';
import 'package:recipesharing/core/services/injection_container.dart';
import 'package:recipesharing/src/auth/presentation/pages/register_page.dart';
import 'package:recipesharing/src/manage/presentation/pages/bottom_bar_page.dart';

import '../../../../core/common/widgets/icon_button_widget.dart';
import '../../../../core/services/logger.dart';
import '../../../../core/services/navigation.dart';
import '../../../../core/utils/constants.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const String routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    final TextEditingController emailTextController = TextEditingController();
    final FocusScopeNode node = FocusScopeNode();
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Constants.padding),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(Assets.logoPng, height: 180.w, width: 180.w,),
              Gap(30),
              Text(
                "Welcome back",
                style: context.textTheme.displayMedium,
              ),
              Gap(4),
              Text(
                "To continue, please verify its you",
                style: context.textTheme.displaySmall,
              ),
              Gap(40),
              TextFieldWidget(
                textEditingController: emailTextController,
                node: node,
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.black38,
                ),
                hintText: "Email address",
              ),
              Gap(4),
              TextFieldWidget(
                textEditingController: emailTextController,
                node: node,
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.black38,
                ),
                hintText: "Password",
                hidden: true,
              ),
              Gap(0),
              Row(
                children: [
                  Icon(Icons.check_box_outline_blank),
                  Gap(10),
                  Text(
                    "Remember me",
                    style: context.textTheme.bodyMedium,
                  ),
                  Spacer(),
                  Text(
                    "Forgot password",
                    style: context.textTheme.bodyMedium!
                        .copyWith(color: Constants.primaryLightColor),
                  ),
                ],
              ),
              Gap(30),
              GradientButtonWidget(label: "Sign In", onPressed: () {
                getIt<Navigation>().pushNamedAndRemoveUntil(BottomBarPage.routeName, (route) => false);
              }),
              Gap(30),
              Text(
                "or connect with",
                style: context.textTheme.displaySmall,
              ),
              Gap(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButtonWidget(
                    label: "Google",
                    onPressed: () {},
                      color: Colors.red,
                    icon: FaIcon(FontAwesomeIcons.google, color: Colors.white,)
                  ),
                  Gap(10),
                  IconButtonWidget(
                    label: "Facebook",
                    onPressed: () {},
                    icon: FaIcon(FontAwesomeIcons.apple, color: Colors.white,),
                    color: Colors.black,
                  ),
                  Gap(10),
                  IconButtonWidget(
                    label: "Facebook",
                    onPressed: () {},
                    icon: FaIcon(FontAwesomeIcons.facebookF, color: Colors.white,),
                    color: Colors.blueAccent,
                  ),
                ],
              ),
              Gap(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have account? ",
                    style: context.textTheme.bodyMedium,
                  ),
                  GestureDetector(
                      onTap: () {
                        getIt<Navigation>().pushNamedAndRemoveUntil(RegisterPage.routeName, // This is the named route you want to navigate to.
                              (Route<dynamic> route) => false,);
                      },
                      child: Text(
                        "Sign Up",
                        style: context.textTheme.bodyMedium!
                            .copyWith(color: Constants.primaryLightColor),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
