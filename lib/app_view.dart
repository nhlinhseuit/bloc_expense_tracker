import 'package:bloc_expenses_tracker/screens/home/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import thêm để dùng SystemChrome

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.grey.shade100, // Hoặc thay thế bằng hàm của bạn
        statusBarIconBrightness: Brightness.dark, // Dành cho Android
        statusBarBrightness: Brightness.light, // Dành cho iOS
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Expense Tracker",
        theme: ThemeData(
            colorScheme: ColorScheme.light(
          surface: Colors.grey.shade100,
          onSurface: Colors.black,
          primary: const Color(0xFF00B2E7),
          secondary: const Color(0xFFE064F7),
          tertiary: const Color(0xFFFF8D6C),
          outline: Colors.grey,
        )),
        home: const HomeScreen(),
      ),
    );
  }
}
