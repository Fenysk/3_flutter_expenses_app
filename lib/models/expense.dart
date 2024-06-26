import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

enum Category { food, travel, leisure, work }

final formatter = DateFormat.yMd();

Map<Category, IconData> categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.leisure: Icons.movie,
  Category.travel: Icons.flight_takeoff,
  Category.work: Icons.work,
};

const uuid = Uuid();
String get _generatedNewId => 'exps_${uuid.v4().replaceAll('-', '')}';

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.createdAt,
    required this.category,
  }) : id = _generatedNewId;

  final String id; // exps_123456789ABCDE
  final String title; // Assurance
  final double amount; // 45.50
  final DateTime createdAt;
  final Category category; // leisure Expense(categ)

  String get formattedDate => formatter.format(createdAt);
}

class ExpenseBucket {
  ExpenseBucket({
    required this.category,
    required this.expenses,
  });

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;

    for (Expense expense in expenses) {
      sum += expense.amount;
    }

    return sum;
  }
}
