import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';

class Utils {
  Future<bool> getDarkMode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("darkMode") ?? false;
  }

  Future<void> changeDarkMode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool darkMode = await getDarkMode();
    prefs.setBool("darkMode", !darkMode);
  }

  Future<Locale> getLocale() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? localeCode = prefs.getString("locale");
    return Locale(localeCode ?? "en"); // mặc định là tiếng Anh
  }

  Future<void> changeLocale() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String current = prefs.getString("locale") ?? "en";

    final String newLocale = current == "en" ? "vi" : "en";
    await prefs.setString("locale", newLocale);
  }
}
