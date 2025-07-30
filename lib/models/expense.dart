import 'dart:math';

enum ExpenseCategory { food, transport, entertainment, utilities, healthcare, education, shopping, other }

class Expense {
  // this is a templet class for a single expense model.

  Expense({required this.title,
   required this.amount, 
   required this.date, 
   required this.category}
   ) : id = generateRandomId();

  final String title;
  final double amount;
  final int id;
  final DateTime date;
  final ExpenseCategory category;
}

int generateRandomId() {
  return DateTime.now().microsecond + Random().nextInt(1000000); 
}
