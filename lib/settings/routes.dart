import 'package:flutter/material.dart';
import 'package:look_back/screens/login/login_screen.dart';
import 'package:look_back/screens/onboarding/onboarding_screen.dart';
import 'package:look_back/screens/signup/signup_screen.dart';
import 'package:look_back/screens/theme/theme_screen.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{

    '/': (BuildContext context) => OnboardingScreen(),
    //'/': (BuildContext context) => LoginScreen(),
    '/login': (BuildContext context) => const LoginScreen(),
    '/signup': (BuildContext context) => const SignUpScreen(),
    '/theme': (BuildContext context) => const ThemeScreen(),
  };
}
