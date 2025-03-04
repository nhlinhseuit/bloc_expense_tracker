import 'package:bloc/bloc.dart';
import 'package:bloc_expenses_tracker/app.dart';
import 'package:bloc_expenses_tracker/simple_bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = SimpleBlocObserver();

  runApp(const MyApp());
}
