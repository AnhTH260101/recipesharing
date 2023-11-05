import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:recipesharing/core/common/widgets/gradient_button_widget.dart';
import 'package:recipesharing/core/common/widgets/logo_widget.dart';
import 'package:recipesharing/core/common/widgets/text_field_widget.dart';
import 'package:recipesharing/core/extensions/context.dart';
import 'package:recipesharing/core/services/injection_container.dart';
import 'package:recipesharing/core/services/navigation.dart';
import 'package:recipesharing/src/auth/presentation/pages/login_page.dart';

import '../../../../core/common/widgets/icon_button_widget.dart';
import '../../../../core/utils/constants.dart';

class VerifyEmailPage extends StatelessWidget {
  const VerifyEmailPage({super.key});

  static const String routeName = '/verify_email';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            getIt<Navigation>().pop();
          },
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SafeArea(
        child: _buildBody(context),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar();
  }

  Widget _buildBody(BuildContext context) {
    final TextEditingController emailTextController = TextEditingController();
    final FocusScopeNode node = FocusScopeNode();
    return Padding(
      padding: const EdgeInsets.all(Constants.padding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Verify code",
            style: context.textTheme.displayMedium,
          ),
          Gap(4),
          Text(
            "An authentication code has been sent to your email",
            style: context.textTheme.displaySmall,
          ),
          Gap(30),
          TextFieldWidget(
            textEditingController: emailTextController,
            node: node,
            hidden: false,
            prefixIcon: Icon(
              Icons.send_to_mobile,
              color: Colors.black38,
            ),
            hintText: "Code",
          ),
          Gap(20),
          GradientButtonWidget(label: "Verify", onPressed: () {
            getIt<Navigation>().pushNamed(VerifyEmailPage.routeName);
          }),
          Gap(20),
        ],
      ),
    );
  }
}
