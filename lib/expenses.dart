import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses%20list/expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(title: 'Travel', amount: 13.90, date: DateTime.now(), category: ExpenseCategory.transport),
    Expense(title: 'Tasheeeeh', amount: 7.5, date: DateTime.now(), category: ExpenseCategory.entertainment),
    Expense(title: 'Hot Restaurant ', amount: 20.5, date: DateTime.now(), category: ExpenseCategory.food),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white
      body: Column(
        children: [
          // Text('Expenses Tracker App', style: Theme.of(context).textTheme.headlineMedium),
          //Text('Chart...', style: Theme.of(context).textTheme.headlineMedium),
          Expanded(child: ExpensesList(expenses: _registeredExpenses)),
        ],
      ),
    );
  }
}
