import 'package:expense_repository/expense_repository.dart';
import 'package:expense_repository/src/models/expense.dart';

abstract class ExpenseRepository {
  Future<void> createCategory(Category category);
  Future<List<Category>> getCategory();
  Future<void> createExpense(Expense expense);
  Future<List<Expense>> getExpenses();
}
