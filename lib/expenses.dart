import 'package:flutter/material.dart';
import 'package:expenses_app/models/expense.dart';
import 'package:expenses_app/widgets/expenses/expenses_list.dart';
import 'package:expenses_app/widgets/expenses/add_expense_modal.dart';
import 'package:expenses_app/widgets/chart/chart.dart';
import 'package:expenses_app/data/expenses_data.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registerdExpenses = expensesData;

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
    final expenseIndex = _registerdExpenses.indexOf(expenseToRemove);

    setState(() => _registerdExpenses.remove(expenseToRemove));

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: Text('"${expenseToRemove.title}" supprimée !'),
        action: SnackBarAction(
          label: 'Annuler',
          onPressed: () {
            setState(
                () => _registerdExpenses.insert(expenseIndex, expenseToRemove));
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent =
        const Center(child: Text('No expenses found. Start adding some !'));

    if (_registerdExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registerdExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Chart(expenses: _registerdExpenses),
          Expanded(child: mainContent),
        ],
      ),
    );
  }
}
