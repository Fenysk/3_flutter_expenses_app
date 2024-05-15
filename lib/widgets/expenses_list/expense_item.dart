import 'package:flutter/material.dart';
import 'package:expenses_app/models/expense.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        child: Column(
          children: [
            Text(
              expense.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Row(
                  children: [
                    const Icon(Icons.alarm),
                    Text(expense.category.name.toUpperCase()),
                    const SizedBox(width: 8),
                    Text(expense.createdAt.toString())
                  ],
                ),
                const Spacer(),
                Text('€ ${expense.amount.toStringAsFixed(2)}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
