import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses%20list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses, required this.onDeleteExpense});

  final List<Expense> expenses;
  final void Function(Expense expense) onDeleteExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) {
        return Dismissible(
          key: ValueKey(expenses[index]),
          onDismissed: (direction) => onDeleteExpense(expenses[index]), //direction is not important here.
          child: ExpenseItem(expenses[index]),
        );
      },
    );
  }
}
