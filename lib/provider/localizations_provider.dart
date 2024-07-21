import 'package:flutter/material.dart';

class LocalizationsProvider extends ChangeNotifier {
  Locale loc = Locale('ar');

  changeLanguage(Locale locale) {
    loc = locale;
    notifyListeners();
  }
}
