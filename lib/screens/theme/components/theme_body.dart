import 'package:flutter/material.dart';
//import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:provider/provider.dart';
import 'package:look_back/settings/model_theme.dart';
import 'package:look_back/settings/theme_config.dart';

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
            Text('Default Themes', textAlign: TextAlign.center,),
            SizedBox(height: defaultPadding / 2),
            ElevatedButton.icon(
              onPressed: () {
                themeNotifier.chooseTheme == 1
                  ? themeNotifier.chooseTheme = 0
                  : themeNotifier.chooseTheme = 1;
              },
              icon: Icon(themeNotifier.chooseTheme == 1
                ? Icons.nightlight_round
                : Icons.wb_sunny
              ),
              label: Text(themeNotifier.chooseTheme == 1 ? "Dark Mode" : "Light Mode"),
            ),
            SizedBox(height: defaultPadding / 2),
            Text('Custom Themes', textAlign: TextAlign.center,),
            SizedBox(height: defaultPadding / 2),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: pinkPrimaryColor,
                //onPrimary: Colors.black,
              ),
              onPressed: () {
                themeNotifier.chooseTheme = 2;
              },
              icon: Icon(Icons.brightness_5_sharp),
              label: Text('Pink'),
            ),
            SizedBox(height: defaultPadding / 2),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: bluePrimaryColor,
                //onPrimary: Colors.black,
              ),
              onPressed: () {
                themeNotifier.chooseTheme = 3;
              },
              icon: Icon(Icons.brightness_6_sharp),
              label: Text('Dark Blue'),
            ),
            SizedBox(height: defaultPadding / 2),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: purplePrimaryColor,
                //onPrimary: Colors.black,
              ),
              onPressed: () {
                themeNotifier.chooseTheme = 4;
              },
              icon: Icon(Icons.brightness_7_sharp),
              label: Text('Purple'),
            ),
            SizedBox(height: defaultPadding),
          ],
        ),
      );
    });
  }
}
