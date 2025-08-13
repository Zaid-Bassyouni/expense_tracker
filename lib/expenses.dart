import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses%20list/expenses_list.dart';
import 'package:intl/intl.dart';

final dateFormatter = DateFormat.yMd();

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  DateTime? _selectedDate;
  ExpenseCategory _selectedCategory = ExpenseCategory.other;

  var entredTitleValue = '';
  var entredAmountValue = '';

  final List<Expense> _registeredExpenses = [
    Expense(title: 'Travel', amount: 13.90, date: DateTime.now(), category: ExpenseCategory.transport),
    Expense(title: 'Tasheeeeh', amount: 7.5, date: DateTime.now(), category: ExpenseCategory.entertainment),
    Expense(title: 'Hot Restaurant ', amount: 20.5, date: DateTime.now(), category: ExpenseCategory.food),
  ];

  void _presentDatePicker() async {
    final DateTime now = DateTime.now();
    final DateTime FirstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(context: context, initialDate: now, firstDate: FirstDate, lastDate: now);

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitExpenseData() {
    //in case of empty input, show a error dialog.
    if (entredTitleValue.trim().isEmpty || entredAmountValue.trim().isEmpty || _selectedDate == null) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Invalid Input"),
            content: const Text("Please Ener a valid Title, Amount and Date. "),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Okay"),
              ),
            ],
          );
        },
      );
      return;
    }

    setState(() {
      _registeredExpenses.add(
        Expense(title: entredTitleValue, amount: double.parse(entredAmountValue), date: _selectedDate!, category: _selectedCategory),
      );
    });
    Navigator.pop(context);
    print(" All is Good!!!!!!!");
  }

  // When you splite this logic into a separate widget class, add a method to handle user input.
  void _addNewExpense() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext ctx) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return FractionallySizedBox(
              widthFactor: 1,
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 48, 20, 20),
                child: Column(
                  children: [
                    TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(labelText: 'Title'),
                      onChanged: (value) {
                        entredTitleValue = value;
                      },
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.numberWithOptions(),

                            decoration: InputDecoration(prefixText: '\$', labelText: 'Amount'),
                            onChanged: (value) {
                              entredAmountValue = value;
                            },
                          ),
                        ),

                        SizedBox(width: 20),

                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(_selectedDate == null ? 'No Date Chosen' : dateFormatter.format(_selectedDate!)),
                              IconButton(icon: const Icon(Icons.calendar_month_sharp), onPressed: _presentDatePicker),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    Row(
                      children: [
                        Flexible(
                          flex: 2,
                          child: Container(
                            width: double.infinity,
                            child: DropdownButton(
                              value: _selectedCategory,
                              isExpanded: true,
                              items:
                                  ExpenseCategory.values
                                      .map(
                                        (category) => DropdownMenuItem(
                                          value: category,
                                          child: Text(
                                            category.name.toUpperCase(),
                                            key: ValueKey(category.name),
                                            overflow: TextOverflow.visible,
                                          ),
                                        ),
                                      )
                                      .toList(),
                              onChanged: (value) {
                                if (value == null) {
                                  return;
                                }
                                setModalState(() {
                                  _selectedCategory = value;
                                });
                              },
                            ),
                          ),
                        ),

                        //Spacer(),
                        const Spacer(),

                        //Save Button
                        ElevatedButton(onPressed: _submitExpenseData, child: const Text('Save Expense')),

                        //Cancel Button
                        TextButton(
                          onPressed: () {
                            Navigator.of(ctx).pop();
                          },
                          child: const Text('Cancel'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(146, 243, 74, 74),
        title: const Text('Expenses Tracker'),
        centerTitle: true,
        actions: [IconButton(onPressed: _addNewExpense, icon: const Icon(Icons.add))],
      ),
      body: Column(
        children: [
          // Text('Expenses Tracker App', style: Theme.of(context).textTheme.headlineMedium),
          //Text('Chart...', style: Theme.of(context).textTheme.headlineMedium),
          //TODO: Add a chart here.
          Expanded(child: ExpensesList(expenses: _registeredExpenses)),
        ],
      ),
    );
  }
}
