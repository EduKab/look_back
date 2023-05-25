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

class ForgotScreenTopImage extends StatelessWidget {
  const ForgotScreenTopImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 16 * 2),
        Row(
          children: [
            Spacer(),
            Expanded(
              flex: 8,
              // child: LottieBuilder.asset(
              //   "assets/animation/music_5.json",
              //   //height: 275,
              // ),
              child: Image(image: AssetImage('assets/images/Logo_Look_Back.png')),
            ),
            Spacer(),
          ],
        ),
        SizedBox(height: 16 * 2),
      ],
    );
  }
}