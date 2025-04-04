import 'package:bloc_expenses_tracker/screens/add_expense/blocs/language_bloc/language_bloc.dart';
import 'package:bloc_expenses_tracker/screens/add_expense/blocs/theme_bloc/theme_bloc.dart';
import 'package:bloc_expenses_tracker/screens/home_expense/get_expenses_blocs/bloc/get_expenses_bloc.dart';
import 'package:expense_repository/expense_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppWrapper extends StatelessWidget {
  final Widget child;

  const AppWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeBloc()..add(const LoadTheme())),
        BlocProvider(
            create: (_) => GetExpensesBloc(FirebaseExpenseRepo())
              ..add(GetExpenses())),
        BlocProvider(create: (_) => LanguageBloc()..add(const LoadLanguage())),
      ],
      child: child,
    );
  }
}
