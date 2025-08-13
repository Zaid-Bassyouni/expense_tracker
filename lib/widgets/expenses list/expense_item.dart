import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(159, 255, 172, 172),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(expense.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
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
                    Icon(categoryIcons[expense.category]),
                    const SizedBox(width: 10.0),
                    //Text('${expense.date.day}/${expense.date.month}/${expense.date.year}'),
                    Text(expense.formattedDate), //we dont use () bcuz it is getter not a method.
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
