// import 'package:bloc_expenses_tracker/utils/utils.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class ThemeProvider extends ChangeNotifier {
//   ThemeMode _themeMode = ThemeMode.light;

//   ThemeMode get themeMode => _themeMode;

//   ThemeProvider() {
//     _loadTheme();
//   }

//   void toggleTheme() async {
//     final isDarkToggle = await Utils().getDarkMode();

//     _themeMode = isDarkToggle ? ThemeMode.dark : ThemeMode.light;
//     _saveTheme();
//     notifyListeners();
//   }

//   Future<void> _loadTheme() async {
//     final isDark = await Utils().getDarkMode();
//     _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
//     notifyListeners();
//   }

//   Future<void> _saveTheme() async {
//     await Utils().getDarkMode();
//   }
// }
