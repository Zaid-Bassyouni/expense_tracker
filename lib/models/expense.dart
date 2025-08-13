import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum ExpenseCategory { food, transport, entertainment, utilities, healthcare, education, shopping, other }

final dateFormatter = DateFormat.yMd();

const categoryIcons = {
  ExpenseCategory.food: Icons.fastfood,
  ExpenseCategory.transport: Icons.directions_car,
  ExpenseCategory.entertainment: Icons.movie,
  ExpenseCategory.utilities: Icons.lightbulb,
  ExpenseCategory.healthcare: Icons.local_hospital,
  ExpenseCategory.education: Icons.school,
  ExpenseCategory.shopping: Icons.shopping_cart,
  ExpenseCategory.other: Icons.help_outline,
};

class Expense {
  // this is a templet class for a single expense model.
  Expense({required this.title, required this.amount, required this.date, required this.category}) : id = generateRandomId();

  final String title;
  final double amount;
  final int id;
  final DateTime date;
  final ExpenseCategory category;

  String get formattedDate {
    return dateFormatter.format(date);
  }
}

int generateRandomId() {
  return DateTime.now().microsecond + Random().nextInt(1000000);
}
