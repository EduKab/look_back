import 'package:flutter/material.dart';
import 'package:look_back/settings/theme_config.dart';
// import 'package:lottie/lottie.dart';

class ForgotScreenTopImage extends StatelessWidget {
  const ForgotScreenTopImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: defaultPadding * 2),
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
        SizedBox(height: defaultPadding * 2),
      ],
    );
  }
}
