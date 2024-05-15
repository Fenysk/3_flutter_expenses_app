import 'package:flutter/material.dart';
import 'package:expenses_app/models/expense.dart';

class Expenses extends StatefulWidget {
  Expenses({super.key});

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
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Text('Chart'),
          Text('Expenses list'),
        ],
      ),
    );
  }
}
