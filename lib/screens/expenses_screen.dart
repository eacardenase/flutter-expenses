import 'package:flutter/material.dart';

import 'package:expense_tracker/widgets/expenses.dart';

class ExpensesScreen extends StatelessWidget {
  const ExpensesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Expenses(),
      ),
    );
  }
}
