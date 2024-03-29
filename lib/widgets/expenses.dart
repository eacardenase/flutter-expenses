import 'package:flutter/material.dart';

import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final List<Expense> expenses;

  final void Function({required Expense expense, required int index})
      onRemoveExpense;

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    Widget mainContent = const Center(
      child: Text('No expenses found. Start adding some!'),
    );

    if (widget.expenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: widget.expenses,
        onRemoveExpense: widget.onRemoveExpense,
      );
    }

    return width > 600
        ? Row(
            children: [
              Expanded(child: Chart(expenses: widget.expenses)),
              Expanded(
                child: mainContent,
              ),
            ],
          )
        : Column(
            children: [
              Chart(expenses: widget.expenses),
              Expanded(
                child: mainContent,
              ),
            ],
          );
  }
}
