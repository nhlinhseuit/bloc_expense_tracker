import 'package:bloc_expenses_tracker/app_view.dart';
import 'package:bloc_expenses_tracker/screens/add_expense/blocs/theme_bloc/theme_bloc.dart';
import 'package:bloc_expenses_tracker/screens/home_expense/get_expenses_blocs/bloc/get_expenses_bloc.dart';
import 'package:bloc_expenses_tracker/simple_bloc_observer.dart';
import 'package:expense_repository/expense_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = SimpleBlocObserver();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeBloc()..add(const LoadTheme()),
        ),
        BlocProvider(
          create: (context) =>
              GetExpensesBloc(FirebaseExpenseRepo())..add(GetExpenses()),
        ),
      ],
      child: const MyAppView(),
    ),
  );
}
