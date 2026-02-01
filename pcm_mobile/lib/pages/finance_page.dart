import 'package:flutter/material.dart';
import '../models/transaction_model.dart';
import '../screens/add_transaction_dialog.dart';
import '../screens/transaction_table.dart';

class FinancePage extends StatefulWidget {
  const FinancePage({super.key});

  @override
  State<FinancePage> createState() => _FinancePageState();
}

class _FinancePageState extends State<FinancePage> {
  final List<FinanceTransaction> transactions = [];

  int get totalIncome =>
      transactions.where((t) => t.amount >= 0).fold(0, (a, b) => a + b.amount);

  int get totalExpense =>
      transactions.where((t) => t.amount < 0).fold(0, (a, b) => a + b.amount);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tài chính"),
        actions: [
          ElevatedButton.icon(
            onPressed: _openAddDialog,
            icon: const Icon(Icons.add),
            label: const Text("Thêm giao dịch"),
          ),
          const SizedBox(width: 12),
          ElevatedButton.icon(
            onPressed: _exportReport,
            icon: const Icon(Icons.download),
            label: const Text("Xuất báo cáo"),
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                _summaryCard("Tổng thu", totalIncome, Colors.green),
                _summaryCard("Tổng chi", totalExpense, Colors.red),
                _summaryCard(
                  "Số dư",
                  totalIncome + totalExpense,
                  Colors.blue,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: TransactionTable(transactions: transactions),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _summaryCard(String title, int value, Color color) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(title),
              const SizedBox(height: 8),
              Text(
                value.toString(),
                style: TextStyle(
                  fontSize: 18,
                  color: color,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openAddDialog() {
    showDialog(
      context: context,
      builder: (_) => AddTransactionDialog(
        onAdd: (transaction) {
          setState(() {
            transactions.add(transaction);
          });
        },
      ),
    );
  }

  void _exportReport() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Xuất báo cáo thành công (demo)")),
    );
  }
}
