import 'package:flutter/material.dart';

const double defaultPadding = 16.0;

const lightPrimaryColor = Color.fromARGB(255, 255, 0, 255);
const lightBackgroundColor = Color.fromARGB(255, 234, 206, 234);

const darkPrimaryColor = Color.fromARGB(255, 69, 123, 157);
const darkBackgroundColor = Color.fromARGB(255, 230, 245, 255);

/* Customs */

const pinkPrimaryColor = Color(0xFFF49FB6);
const pinkBackgroundColor = Color.fromARGB(255, 238, 213, 219);

const bluePrimaryColor = Color(0xFF1E1E2C);
const blueBackgroundColor = Color(0xFF2D2D44);

const purplePrimaryColor = Color.fromARGB(255, 99, 85, 112);
const purpleBackgroundColor = Color.fromARGB(255, 231, 198, 255);

/* 
  TRATE DE HACER UNA INTERPOLACIÓN DE ESTILOS Y LO CONSEGUÍ PERO ES INESTABLE COMO YO
*/

/*ThemeData custom = ThemeData(
  primaryColor: darkPrimaryColor,
  hintColor: Colors.deepPurple.shade300,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      primary: darkPrimaryColor,
      shape: const StadiumBorder(),
      maximumSize: const Size(double.infinity, 56),
      minimumSize: const Size(double.infinity, 56),
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    filled: true,
    fillColor: darkBackgroundColor,
    iconColor: darkPrimaryColor,
    prefixIconColor: darkPrimaryColor,
    contentPadding: EdgeInsets.symmetric(
        horizontal: defaultPadding, vertical: defaultPadding),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      borderSide: BorderSide.none,
    ),
  ),
); */
/*ThemeData lightTheme = ThemeData.lerp(ThemeData.light(), custom, 1).copyWith(
  primaryTextTheme: TextTheme(
    displayLarge: TextStyle(
        fontSize: 36.0, fontWeight: FontWeight.bold, color: Colors.black87),
    titleLarge: TextStyle(
        fontSize: 18.0, fontStyle: FontStyle.italic, color: Colors.black87),
    bodyMedium:
        TextStyle(fontSize: 14.0, fontFamily: 'Hind', color: Colors.black87),
  ),
);*/
/*ThemeData darkTheme = ThemeData.lerp(ThemeData.dark(), custom, 1).copyWith(
  primaryTextTheme: TextTheme(
    displayLarge: TextStyle(
        fontSize: 36.0, fontWeight: FontWeight.bold, color: Colors.white70),
    titleLarge: TextStyle(
        fontSize: 18.0, fontStyle: FontStyle.italic, color: Colors.white70),
    bodyMedium:
        TextStyle(fontSize: 14.0, fontFamily: 'Hind', color: Colors.white70),
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(color: Colors.black87),
  ),
);*/

ThemeData lightTheme = ThemeData.light().copyWith(
  textSelectionTheme:
      const TextSelectionThemeData(cursorColor: lightPrimaryColor),
  primaryColor: lightPrimaryColor,
  hintColor: lightPrimaryColor,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      primary: lightPrimaryColor,
      shape: const StadiumBorder(),
      maximumSize: const Size(double.infinity, 56),
      minimumSize: const Size(double.minPositive, 56),
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    filled: true,
    fillColor: lightBackgroundColor,
    iconColor: lightPrimaryColor,
    prefixIconColor: lightPrimaryColor,
    contentPadding: EdgeInsets.symmetric(
        horizontal: defaultPadding, vertical: defaultPadding),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      borderSide: BorderSide(width: 5, color: lightPrimaryColor),
    ),
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontFamily: 'SivarPro', 
      color: Colors.black, 
      letterSpacing: 1, 
      shadows: [Shadow(
        blurRadius: 20.0, // shadow blur
        color: Colors.white, // shadow color
        offset: Offset(-2.0, 2.0), // how much shadow will be shown
      )],
    ),
    bodyText2:TextStyle(
      fontFamily: 'SivarPro', 
      color: Colors.black, 
      letterSpacing: 1, 
      fontSize: 16, 
      shadows: [Shadow(
        blurRadius: 20.0, // shadow blur
        color: Colors.white, // shadow color
        offset: Offset(-2.0, 2.0), // how much shadow will be shown
      )],
    )
  ),
);

ThemeData darkTheme = ThemeData.dark().copyWith(
  textSelectionTheme:
      const TextSelectionThemeData(cursorColor: darkPrimaryColor),
  primaryColor: darkPrimaryColor,
  hintColor: darkPrimaryColor,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      primary: darkPrimaryColor,
      shape: const StadiumBorder(),
      maximumSize: const Size(double.infinity, 56),
      minimumSize: const Size(double.minPositive, 56),
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    filled: true,
    fillColor: darkBackgroundColor,
    iconColor: darkPrimaryColor,
    prefixIconColor: darkPrimaryColor,
    contentPadding: EdgeInsets.symmetric(
        horizontal: defaultPadding, vertical: defaultPadding),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      borderSide: BorderSide(width: 5, color: darkPrimaryColor),
    ),
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontFamily: 'SivarPro', 
      color: Colors.white, 
      letterSpacing: 1, 
      shadows: [Shadow(
        blurRadius: 20.0, // shadow blur
        color: Colors.black, // shadow color
        offset: Offset(-2.0, 2.0), // how much shadow will be shown
      )],
    ),
    bodyText2:TextStyle(
      fontFamily: 'SivarPro', 
      color: Colors.white, 
      letterSpacing: 1, 
      fontSize: 16, 
      shadows: [Shadow(
        blurRadius: 20.0, // shadow blur
        color: Colors.black, // shadow color
        offset: Offset(-2.0, 2.0), // how much shadow will be shown
      )],
    )
  ),
);

ThemeData pinkTheme = lightTheme.copyWith(
  primaryColor: pinkPrimaryColor,
  scaffoldBackgroundColor: pinkBackgroundColor,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    foregroundColor: Color(0xFF24737c),
    backgroundColor: Color(0xFFA6E0DE),
  ),
);

ThemeData darkBlueTheme = darkTheme.copyWith(
  primaryColor: bluePrimaryColor,
  scaffoldBackgroundColor: blueBackgroundColor,
);

ThemeData purpleTheme = lightTheme.copyWith(
  primaryColor: purplePrimaryColor,
  scaffoldBackgroundColor: purpleBackgroundColor,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    foregroundColor: Color(0xFFea8e71),
    backgroundColor: Color(0xFF2b2119),
  ),
);
