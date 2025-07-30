import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(expense.title),
            const SizedBox(height: 4.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${expense.amount.toStringAsFixed(2)}',

                  // 12.99572 => 12.99 (inly 2 digits after a comma)
                ),
                const Spacer(),
                Row(
                  children: [
                    Icon(Icons.calendar_today),
                    const SizedBox(width: 10.0),
                    //Text('${expense.date.day}/${expense.date.month}/${expense.date.year}'),
                    Text(expense.date.toString()),
                    // Date Picker
                    // TextField(
                    //   decoration: InputDecoration(
                    //     labelText: 'Date',
                    //     border: OutlineInputBorder(),
                    //     filled: true,
                    //     prefix: Icon(Icons.calendar_month),
                    //     enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade400)),
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
