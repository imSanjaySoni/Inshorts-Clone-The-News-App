// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hive/hive.dart';

class SettingsProvider extends ChangeNotifier {
  bool isDarkThemeOn = Hive.box('settingsBox').get('isDarkModeOn') ?? false;
  String activeLanguge = Hive.box('settingsBox').get('activeLang') ?? "English";
  String localeCode = "en";

  String getActiveLanguageCode() {
    final value = Hive.box('settingsBox').get('activeLang');
    switch (value) {
      case "ಕನ್ನಡ":
        return "kn";
        break;
      case "हिंदी":
        return "hi";

        break;
      case "मराठी":
        return "mr";

        break;
      default:
        return "en";
    }
  }

  void darkTheme(bool status) {
    isDarkThemeOn = status;

    final themeBox = Hive.box('settingsBox');
    themeBox.put('isDarkModeOn', status);
    print(themeBox.get('isDarkModeOn'));

    notifyListeners();
  }

  void setLang(String value) {
    activeLanguge = value;

    final langBox = Hive.box('settingsBox');

    switch (value) {
      case "ಕನ್ನಡ":
        langBox.put('activeLang', "ಕನ್ನಡ");
        localeCode = "kn";
        notifyListeners();

        break;
      case "हिंदी":
        langBox.put('activeLang', "हिंदी");
        localeCode = "hi";
        notifyListeners();

        break;
      case "मराठी":
        langBox.put('activeLang', "मराठी");
        localeCode = "mr";
        notifyListeners();

        break;
      default:
        langBox.put('activeLang', "English");
        localeCode = "en";
        notifyListeners();
    }

    notifyListeners();
  }
}
