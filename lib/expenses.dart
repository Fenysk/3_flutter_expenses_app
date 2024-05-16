import 'package:flutter/material.dart';
import 'package:expenses_app/models/expense.dart';
import 'package:expenses_app/widgets/expenses/expenses_list.dart';
import 'package:expenses_app/widgets/expenses/add_expense_modal.dart';

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

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (modalContext) => AddExpenseModal(
        onAddExpense: _addNewExpense,
      ),
      isScrollControlled: true,
    );
  }

  void _addNewExpense(Expense newExpense) =>
      setState(() => _registerdExpenses.add(newExpense));

  void _removeExpense(Expense expenseToRemove) {
    setState(() => _registerdExpenses.remove(expenseToRemove));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Expense Tracker'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text('Chart'),
          const Text('Expenses list'),
          Expanded(
            child: ExpensesList(
              expenses: _registerdExpenses,
              onRemoveExpense: _removeExpense,
            ),
          )
        ],
      ),
    );
  }
}
