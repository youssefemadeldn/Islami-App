import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode mode = ThemeMode.light;
  bool isLight = true;
  changeThemeMode(ThemeMode themeMode) {
    mode = themeMode;

    mode == ThemeMode.light ? isLight = true : isLight = false;

    notifyListeners();
  }
}



// 1 create class Feather_Provider extends ChangeNotifier
// 2 write logic
// 3 notifyListeners
// 4 provider the provider in place that all pages will changed cloud see the provider
// declare object and use it in place i want
// 5 trigger provider