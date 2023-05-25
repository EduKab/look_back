import 'package:flutter/material.dart';
import 'package:look_back/settings/responsive.dart';
import 'package:look_back/components/background.dart';
import 'login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Background(
      child: SingleChildScrollView(
        child: Responsive(
          mobile: MobileLoginScreen(),
          desktop: DesktopLoginScreen()
        ),
      ),
    );
  }
}

class MobileLoginScreen extends StatelessWidget {
  const MobileLoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const LoginScreenTopImage(),
        Row(
          children: const [
            Spacer(),
            Expanded(
              flex: 8,
              child: LoginForm(),
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}

class DesktopLoginScreen extends StatelessWidget {
  const DesktopLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: LoginScreenTopImage(),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 450,
                child: LoginForm(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class LoginScreenTopImage extends StatelessWidget {
  const LoginScreenTopImage({
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