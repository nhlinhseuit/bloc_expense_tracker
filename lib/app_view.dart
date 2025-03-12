import 'package:bloc_expenses_tracker/providers/theme_provider.dart';
import 'package:bloc_expenses_tracker/screens/home_expense/get_expenses_blocs/bloc/get_expenses_bloc.dart';
import 'package:bloc_expenses_tracker/screens/home_expense/views/home_screen.dart';
import 'package:expense_repository/expense_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      return AnnotatedRegion<SystemUiOverlayStyle>(
        value: themeProvider.themeMode == ThemeMode.dark
            ? SystemUiOverlayStyle.light.copyWith(
                statusBarColor: Colors.grey.shade900,
                statusBarIconBrightness: Brightness.light,
                systemNavigationBarColor: Colors.black,
                systemNavigationBarIconBrightness: Brightness.light,
              )
            : SystemUiOverlayStyle.dark.copyWith(
                statusBarColor: Colors.grey.shade100,
                statusBarIconBrightness: Brightness.dark,
                systemNavigationBarColor: Colors.white,
                systemNavigationBarIconBrightness: Brightness.dark,
              ),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "My Application",
          themeMode: themeProvider.themeMode, // Chế độ tự động theo hệ thống
          theme: _lightTheme(),
          darkTheme: _darkTheme(),
          home: BlocProvider(
            create: (context) =>
                GetExpensesBloc(FirebaseExpenseRepo())..add(GetExpenses()),
            child: const HomeScreenExpense(),
          ),
        ),
      );
    });
  }

  /// Theme cho Light Mode
  ThemeData _lightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      colorScheme: ColorScheme.light(
        primaryContainer: Colors.white,
        surface: Colors.grey.shade100,
        onSurface: Colors.black,
        primary: const Color(0xFF00B2E7),
        secondary: const Color(0xFFE064F7),
        tertiary: const Color(0xFFFF8D6C),
        outline: Colors.grey,
      ),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
    );
  }

  /// Theme cho Dark Mode
  ThemeData _darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(
        primaryContainer: Colors.grey.shade800,
        surface: Colors.grey.shade900,
        onSurface: Colors.white,
        primary: const Color(0xFF00B2E7),
        secondary: const Color(0xFFE064F7),
        tertiary: const Color(0xFFFF8D6C),
        outline: Colors.grey,
      ),
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
    );
  }
}
