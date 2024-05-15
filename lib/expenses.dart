import 'package:flutter/material.dart';
import 'package:expenses_app/models/expense.dart';
import 'package:expenses_app/widgets/expenses_list/expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registerdExpenses = [
    Expense(
      title: 'Sushi Academy',
      amount: 61.50,
      createdAt: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: 'Chat GPT',
      amount: 24,
      createdAt: DateTime.now(),
      category: Category.work,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Expense Tracker'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text('Chart'),
          const Text('Expenses list'),
          Expanded(
            child: ExpensesList(expenses: _registerdExpenses),
          )
        ],
      ),
    );
  }
}
