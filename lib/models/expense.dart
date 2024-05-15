import 'package:uuid/uuid.dart';

const uuid = Uuid();

String get _generatedNewId => 'exps_${uuid.v4().replaceAll('-', '')}';

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.createdAt,
  }) : id = _generatedNewId;

  final String id; // exps_12345678
  final String title; // Assurance
  final double amount; // 45.50
  final DateTime createdAt;
}
