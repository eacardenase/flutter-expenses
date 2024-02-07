import 'package:flutter/material.dart';

import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends State<ExpensesScreen> {
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

  void _addNewExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense({required Expense expense, required int index}) {
    setState(() {
      _registeredExpenses.remove(expense);
    });

    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(index, expense);
            });
          },
        ),
        duration: const Duration(seconds: 3),
        content: const Text('Expense deleted!'),
      ),
    );
  }

  void openAddExpenseOverlay(context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (ctx) => NewExpense(onAddExpense: _addNewExpense),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Expense Tracker",
        ),
        actions: [
          IconButton(
            onPressed: () => openAddExpenseOverlay(
              context,
            ),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Expenses(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      ),
    );
  }
}
