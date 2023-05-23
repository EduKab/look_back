import 'package:flutter/material.dart';
import 'mytheme_preference.dart';

class ModelTheme extends ChangeNotifier {
  late int _chooseTheme;
  late MyThemePreferences _preferences;
  int get chooseTheme => _chooseTheme;

  ModelTheme()  {
    _chooseTheme = 0;
    _preferences = MyThemePreferences();
     getPreferences();
  }

  set chooseTheme(int value) {
    _chooseTheme = value;
    _preferences.setTheme(value);
    notifyListeners();
  }

  getPreferences() async {
    _chooseTheme = await _preferences.getTheme();
    print(_chooseTheme);
    notifyListeners();
  }
}
