import 'package:flutter/material.dart';

import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final List<Expense> expenses;
  final void Function(Expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    // better alternative to columns if children widgets length get long
    // all column's children get rendered/created once the build method runs
    return ListView.builder(
      itemCount: expenses.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        final expense = expenses[index];

        return Dismissible(
          key: ValueKey(expense),
          direction: DismissDirection.endToStart,
          background: Card(
            color: Colors.red,
            child: Container(
              padding: const EdgeInsets.only(right: 16),
              alignment: Alignment.centerRight,
              child: const Icon(Icons.delete),
            ),
          ),
          confirmDismiss: (direction) async {
            if (direction == DismissDirection.endToStart) {
              onRemoveExpense(expense);

              return true;
            }

            return false;
          },
          child: ExpenseItem(
            expense: expense,
          ),
        );
      },
    );
  }
}
