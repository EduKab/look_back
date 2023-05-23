import 'package:flutter/material.dart';
import 'package:look_back/screens/dashboard_screen.dart';
import 'package:look_back/screens/login_screen.dart';
import 'package:look_back/screens/register_screen.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/login': (BuildContext context) => const LoginScreen(),
    '/register': (BuildContext context) => const RegisterScreen(),
    '/dashboard': (BuildContext context) => const DashboardScreen()
  };
}