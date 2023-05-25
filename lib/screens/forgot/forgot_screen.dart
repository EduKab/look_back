import 'package:flutter/material.dart';
import 'package:look_back/settings/responsive.dart';
import 'package:look_back/components/background.dart';
import 'forgot_form.dart';

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
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          children: [
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
    return const Row(
      children: [
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