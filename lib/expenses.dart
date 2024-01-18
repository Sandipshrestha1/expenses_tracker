import 'package:expense_tracker/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter course',
      amount: 18.88,
      date: DateTime.now(),
      category: ExpenseCategory.work,
    ),
    Expense(
        title: 'Movies',
        amount: 18.0,
        date: DateTime.now(),
        category: ExpenseCategory.leisure),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(" The Chart"),

          Expanded(
            child: ExpensesList(expenses: _registeredExpenses),
          ), 
        ],
      ),
    );
  }
}
