import 'package:uuid/uuid.dart';

const uuid = Uuid();

String get _generatedNewId => 'exps_${uuid.v4().replaceAll('-', '')}';

enum Category { food, travel, leisure, work }

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
}
