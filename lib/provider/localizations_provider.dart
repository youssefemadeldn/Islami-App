import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalizationsProvider extends ChangeNotifier {
  Locale loc = const Locale('en');
  bool isEnglish = true;

  LocalizationsProvider() {
    getLastLocal();
  }

  changeLanguage(Locale locale) async {
    loc = locale;
    loc == const Locale('ar') ? isEnglish = false : isEnglish = true;
    notifyListeners();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool('isEnglish', isEnglish);
  }

  void getLastLocal() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool state = sharedPreferences.getBool("isEnglish") ?? true;
    loc = state ? const Locale('en') : const Locale('ar');
  }
}
