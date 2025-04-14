import 'package:bloc_expenses_tracker/app_view.dart';
import 'package:bloc_expenses_tracker/app_view_login.dart';
import 'package:bloc_expenses_tracker/screens/base/app_wrapper.dart';
import 'package:bloc_expenses_tracker/screens/login/login_bloc/login_bloc.dart';
import 'package:bloc_expenses_tracker/simple_bloc_observer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = SimpleBlocObserver();

  // ✅ Kiểm tra user đã login chưa
  final user = FirebaseAuth.instance.currentUser;

  const String green = '\x1B[32m';
  const String reset = '\x1B[0m';

  print('$green user $user $reset');

  final bool isLoggedIn = user != null;

  runApp(
    isLoggedIn
        ? const AppWrapper(
            child: MyAppView(),
          )
        : BlocProvider(
            create: (context) => LoginBloc(),
            child: const MyAppViewLogin(),
          ),
  );

  
}
