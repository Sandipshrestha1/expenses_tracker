import 'package:expense_tracker/widgets/expenses_lists/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
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

  _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(
        onAddExpense: _addExpense,
      ),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
   
   final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);

    });
    ScaffoldMessenger.of(context).clearSnackBars();


      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(

          duration: const Duration(seconds: 3),
          content: Text('Expense Deleted'),
        action: SnackBarAction(
          label: "Undo",
          onPressed: (){  
setState(() {
  _registeredExpenses.insert(expenseIndex, expense);
});


          },)
        
        ),
      );
    
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent =
        Center(child: const Text("No Expenses found. Start adding some!"));
    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter ExpenseTracker "),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(" The Chart"),
          Expanded(
            child: mainContent,

            // child: ExpensesList(
            //   expenses: _registeredExpenses,
            //   onRemoveExpense: _removeExpense,
            // ),
          ),
        ],
      ),
    );
  }
}
