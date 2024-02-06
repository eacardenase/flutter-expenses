import 'package:flutter/material.dart';

import 'package:expense_tracker/widgets/expenses.dart';
import 'package:expense_tracker/models/expense.dart';

class ExpensesScreen extends StatelessWidget {
  ExpensesScreen({super.key});

  final List<Expense> _registeredExpenses = [
    Expense(
      title: "NU",
      amount: 1475900,
      category: Category.work,
      date: DateTime.now(),
    ),
    Expense(
      title: "Udemy Courses",
      amount: 59800,
      category: Category.work,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Expense Tracker",
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
            )
          ],
        ),
        body: Expenses(
          expenses: _registeredExpenses,
        ),
      ),
    );
  }
}
