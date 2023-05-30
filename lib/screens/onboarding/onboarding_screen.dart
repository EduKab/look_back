import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return OnBoardingSlider(
      totalPage: 3,
      finishButtonStyle: const FinishButtonStyle(backgroundColor: Color.fromARGB(255, 255, 53, 120)),
      headerBackgroundColor: Colors.black,
      pageBackgroundColor: Colors.black,
      background: [Container(), Container(), Container()],
      speed: 1,
      pageBodies: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset('assets/images/backgrounds/Fondo playeras.png',
                height: 500, width: 500),
            const Text(
              'GET THE BEST FLOW IN CLOTHES!!!',
              style: TextStyle(
                  fontFamily: 'Kafeine', fontSize: 30, color: Colors.white),
              textAlign: TextAlign.center,
            )
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/backgrounds/Fondo mundo.png',
              height: 500,
              width: 500,
            ),
            const Text(
              'THE SHOP WITH BEST COMMUNITY IN THE WORLD',
              style: TextStyle(
                  fontFamily: 'Kafeine', fontSize: 30, color: Colors.white),
              textAlign: TextAlign.center,
            )
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/backgrounds/Fondo_metodos.png',
              height: 500,
              width: 500,
            ),
            const Text(
              'PAY WITH THE METHOD THAT YOU WANT ;)',
              style: TextStyle(
                  fontFamily: 'Kafeine', fontSize: 30, color: Colors.white),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ],
      finishButtonText: 'Start!!!',
      onFinish: () {
        Navigator.pushNamed(context, '/login');
      },
    );
  }
}
