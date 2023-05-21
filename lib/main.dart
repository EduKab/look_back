import 'package:flutter/material.dart';
import 'package:look_back/routes.dart';
import 'package:look_back/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LookBack();
  }
}

class LookBack extends StatelessWidget {
  const LookBack({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LoginScreen(),
      routes: getApplicationRoutes(),
    );
  }
}