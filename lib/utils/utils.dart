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
}
