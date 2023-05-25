import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:look_back/settings/model_theme.dart';
import 'package:look_back/settings/theme_config.dart';

class ThemeTop extends StatefulWidget {
  const ThemeTop({super.key});

  @override
  State<ThemeTop> createState() => _ThemeTopState();
}

class _ThemeTopState extends State<ThemeTop> {
  
  TextStyle textStyle = const TextStyle(
    letterSpacing: 4,
    fontFamily: 'Decipher',
    fontWeight: FontWeight.bold,
    fontSize: 30,
    shadows: [
      Shadow(
        blurRadius: 20.0, // shadow blur
        color: Color.fromARGB(255, 233, 30, 209), // shadow color
        offset: Offset(-2.0, 2.0), // how much shadow will be shown
      ),
    ],
  );

  String? getCurrentTheme(ModelTheme themeNotifier) {
    int nTheme = themeNotifier.chooseTheme;
    String? txt;
    switch (nTheme) {
      case 0:
        txt = 'Light Theme';
        break;
      case 1:
        txt = 'Dark Theme';
        break;
      case 2:
        txt = 'Pink Theme';
        break;
      case 3:
        txt = 'DarkBlue Theme';
        break;
      case 4:
        txt = 'Purple Theme';
        break;
    }
    return txt;
  }

  Color getBorder(ModelTheme themeNotifier) {
    int n = themeNotifier.chooseTheme;
    if(n==0 || n==2 || n==4){
      return Colors.white;
    }else{
      return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ModelTheme>(
        builder: (context, ModelTheme themeNotifier, child) {
        String txt = getCurrentTheme(themeNotifier) !=null ? getCurrentTheme(themeNotifier)! : ':c';
        return Column(
        children: [
          const SizedBox(height: defaultPadding),
          const Text(
            "Select your favorite theme",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: defaultPadding),
          Column(
            children: [
              const Text('Current theme:'),
              const SizedBox(height: defaultPadding),
              Stack(
                alignment: Alignment.center,
                children: [
                  Text(
                    txt,
                    style: textStyle.copyWith(
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..color = getBorder(themeNotifier)
                        ..strokeWidth = 5,
                      color: null,
                    ),
                  ),
                  Text(txt, style: textStyle),
                ],
              ),
            ],
          ),
          const SizedBox(height: defaultPadding * 2),
        ],
      );
    });
  }
}

class ThemeBody extends StatefulWidget {
  const ThemeBody({super.key});

  @override
  State<ThemeBody> createState() => _ThemeBodyState();
}

class _ThemeBodyState extends State<ThemeBody> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ModelTheme>(
        builder: (context, ModelTheme themeNotifier, child) {
      return IntrinsicWidth(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Default Themes',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: defaultPadding / 2),
            ElevatedButton.icon(
              onPressed: () {
                themeNotifier.chooseTheme == 1
                    ? themeNotifier.chooseTheme = 0
                    : themeNotifier.chooseTheme = 1;
              },
              icon: Icon(themeNotifier.chooseTheme == 1
                  ? Icons.nightlight_round
                  : Icons.wb_sunny),
              label: Text(
                  themeNotifier.chooseTheme == 1 ? "Dark Mode" : "Light Mode"),
            ),
            const SizedBox(height: defaultPadding / 2),
            const Text(
              'Custom Themes',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: defaultPadding / 2),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: pinkPrimaryColor,
                //onPrimary: Colors.black,
              ),
              onPressed: () {
                themeNotifier.chooseTheme = 2;
              },
              icon: const Icon(Icons.brightness_5_sharp),
              label: const Text('Pink'),
            ),
            const SizedBox(height: defaultPadding / 2),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: bluePrimaryColor,
                //onPrimary: Colors.black,
              ),
              onPressed: () {
                themeNotifier.chooseTheme = 3;
              },
              icon: const Icon(Icons.brightness_6_sharp),
              label: const Text('Dark Blue'),
            ),
            const SizedBox(height: defaultPadding / 2),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: purplePrimaryColor,
                //onPrimary: Colors.black,
              ),
              onPressed: () {
                themeNotifier.chooseTheme = 4;
              },
              icon: const Icon(Icons.brightness_7_sharp),
              label: const Text('Purple'),
            ),
            const SizedBox(height: defaultPadding),
          ],
        ),
      );
    });
  }
}
