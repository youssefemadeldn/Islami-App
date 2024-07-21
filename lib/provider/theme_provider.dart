import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeProvider() {
    getLastThemeMode();
  }
  ThemeMode mode = ThemeMode.light;

  void changeThemeMode(ThemeMode themeMode) async {
    mode = themeMode;

    notifyListeners();

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    sharedPreferences.setBool('isDark', mode == ThemeMode.dark);
  }

  void getLastThemeMode() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool isDark = sharedPreferences.getBool('isDark') ?? false;

    isDark ? (mode = ThemeMode.dark) : (mode = ThemeMode.light);

    notifyListeners();
  }
}



// 1 create class Feather_Provider extends ChangeNotifier
// 2 write logic
// 3 notifyListeners
// 4 provider the provider in place that all pages will changed cloud see the provider
// declare object and use it in place i want
// 5 trigger provider