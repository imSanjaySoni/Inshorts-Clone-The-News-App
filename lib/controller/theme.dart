import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDarkThemeOn = Hive.box('themeMode').get('isDarkModeOn') ?? false;

  void darkTheme(bool status) {
    isDarkThemeOn = status;

    final themeBox = Hive.box('themeMode');
    themeBox.put('isDarkModeOn', status);
    print(themeBox.get('isDarkModeOn'));

    notifyListeners();
  }
}
