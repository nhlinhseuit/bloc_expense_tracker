import 'package:bloc/bloc.dart';
import 'package:bloc_expenses_tracker/app_view.dart';
import 'package:bloc_expenses_tracker/providers/theme_provider.dart';
import 'package:bloc_expenses_tracker/simple_bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = SimpleBlocObserver();

  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider()..toggleTheme(),
      child: const MyAppView(),
    ),
  );
}
