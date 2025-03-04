import 'dart:math';

import 'package:bloc_expenses_tracker/screens/add_expense/blocs/create_category_bloc/create_category_bloc.dart';
import 'package:bloc_expenses_tracker/screens/add_expense/blocs/create_expense_bloc/create_expense_bloc.dart';
import 'package:bloc_expenses_tracker/screens/add_expense/blocs/get_categories_bloc/get_categories_bloc.dart';
import 'package:bloc_expenses_tracker/screens/add_expense/views/add_expense.dart';
import 'package:bloc_expenses_tracker/screens/home/get_expenses_blocs/bloc/get_expenses_bloc.dart';
import 'package:bloc_expenses_tracker/screens/home/views/main_screen.dart';
import 'package:bloc_expenses_tracker/screens/stats/views/stats_screen.dart';
import 'package:expense_repository/expense_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  Color selectedItem = Colors.blue;
  Color unselectedItem = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetExpensesBloc, GetExpensesState>(
      builder: (context, state) {
        if (state is GetExpensesSuccess) {
          return Scaffold(
            body: index == 0 ? MainScreen(state.expenses) : const StatsScreen(),
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(30), // Bo góc trên
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1), // Đổ bóng nhẹ
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                  child: BottomNavigationBar(
                    backgroundColor: Colors.white,
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    elevation: 0, // Xóa bóng mặc định để tránh xung đột
                    onTap: (value) {
                      setState(() {
                        index = value;
                      });
                    },
                    items: [
                      BottomNavigationBarItem(
                        icon: Icon(
                          CupertinoIcons.home,
                          color: index == 0 ? selectedItem : unselectedItem,
                        ),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(
                          CupertinoIcons.graph_square,
                          color: index == 1 ? selectedItem : unselectedItem,
                        ),
                        label: 'Stats',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                var newExpense = await Navigator.push(
                  context,
                  MaterialPageRoute<Expense>(
                    builder: (BuildContext context) => MultiBlocProvider(
                      providers: [
                        BlocProvider(
                          create: (context) =>
                              CreateCategoryBloc(FirebaseExpenseRepo()),
                        ),
                        BlocProvider(
                          create: (context) =>
                              GetCategoriesBloc(FirebaseExpenseRepo())
                                ..add(GetCategories()),
                        ),
                        BlocProvider(
                          create: (context) =>
                              CreateExpenseBloc(FirebaseExpenseRepo()),
                        ),
                      ],
                      child: const AddExpense(),
                    ),
                  ),
                );

                if (newExpense != null) {
                  setState(() {
                    state.expenses.insert(0, newExpense);
                  });
                }
              },
              shape: const CircleBorder(),
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        Theme.of(context).colorScheme.tertiary,
                        Theme.of(context).colorScheme.secondary,
                        Theme.of(context).colorScheme.primary,
                      ],
                      transform: const GradientRotation(pi / 4),
                    )),
                child: const Icon(CupertinoIcons.add),
              ),
            ),
          );
        } else {
          return const Scaffold(
              body: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}
