import 'package:flutter/material.dart';
import 'package:look_back/settings/responsive.dart';
import 'package:look_back/components/background.dart';

import 'components/forgot_form.dart';
import 'components/forgot_top.dart';

class ForgotScreen extends StatelessWidget {
  const ForgotScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Background(
      child: SingleChildScrollView(
        child: Responsive(
          mobile: MobileForgotScreen(),
          desktop: DesktopForgotScreen()
        ),
      ),
    );
  }
}

class MobileForgotScreen extends StatelessWidget {
  const MobileForgotScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const ForgotScreenTopImage(),
        Row(
          children: const [
            Spacer(),
            Expanded(
              flex: 8,
              child: ForgotForm(),
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}

class DesktopForgotScreen extends StatelessWidget {
  const DesktopForgotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ForgotScreenTopImage(),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 450,
                child: ForgotForm(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}