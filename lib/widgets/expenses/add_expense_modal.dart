import 'package:flutter/material.dart';

class AddExpenseModal extends StatefulWidget {
  const AddExpenseModal({super.key});

  @override
  State<AddExpenseModal> createState() => _AddExpenseModalState();
}

class _AddExpenseModalState extends State<AddExpenseModal> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(
              label: Text('Sujet'),
            ),
            maxLength: 50,
          ),
          TextField(
            controller: _amountController,
            decoration: const InputDecoration(
              label: Text('Montant'),
              prefixText: '€ ',
            ),
            keyboardType: const TextInputType.numberWithOptions(
              signed: false,
              decimal: false,
            ),
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Annuler'),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  print(_titleController.text);
                  print(_amountController.text);
                  Navigator.pop(context);
                },
                child: const Text('Enregistrer la dépense'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
