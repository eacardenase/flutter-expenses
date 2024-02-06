import 'package:flutter/material.dart';

import 'package:expense_tracker/screens/expenses_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ExpensesScreen(),
    ),
  );
}
