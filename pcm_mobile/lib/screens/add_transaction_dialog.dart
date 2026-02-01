import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/transaction_model.dart';

class AddTransactionDialog extends StatefulWidget {
  final Function(FinanceTransaction) onAdd;

  const AddTransactionDialog({super.key, required this.onAdd});

  @override
  State<AddTransactionDialog> createState() => _AddTransactionDialogState();
}

class _AddTransactionDialogState extends State<AddTransactionDialog> {
  final descCtrl = TextEditingController();
  final amountCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Thêm giao dịch"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: descCtrl,
            decoration: const InputDecoration(labelText: "Mô tả"),
          ),
          TextField(
            controller: amountCtrl,
            decoration: const InputDecoration(
              labelText: "Số tiền (+ thu / - chi)",
            ),
            keyboardType: TextInputType.number,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Hủy"),
        ),
        ElevatedButton(
          onPressed: () {
            final amount = int.tryParse(amountCtrl.text) ?? 0;

            widget.onAdd(
              FinanceTransaction(
                date: DateFormat("dd/MM/yyyy").format(DateTime.now()),
                type: amount >= 0 ? "Thu" : "Chi",
                category: "Khác",
                description: descCtrl.text,
                amount: amount,
                creator: "Admin PCM",
              ),
            );

            Navigator.pop(context);
          },
          child: const Text("Thêm"),
        ),
      ],
    );
  }
}
