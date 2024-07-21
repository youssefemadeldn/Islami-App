import 'package:flutter/material.dart';

class LocalizationsProvider extends ChangeNotifier {
  Locale loc = Locale('en');
  bool isEnglish = true;

  changeLanguage(Locale locale) {
    loc = locale;
    loc == Locale('ar') ? isEnglish = false : isEnglish = true;
    notifyListeners();
  }
}
