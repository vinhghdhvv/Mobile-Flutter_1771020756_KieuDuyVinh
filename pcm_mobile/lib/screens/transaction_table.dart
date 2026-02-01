import 'package:flutter/material.dart';
import '../models/transaction_model.dart';

class TransactionTable extends StatelessWidget {
  final List<FinanceTransaction> transactions;

  const TransactionTable({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    if (transactions.isEmpty) {
      return const Center(
        child: Text("Chưa có giao dịch nào"),
      );
    }

    return DataTable(
      columns: const [
        DataColumn(label: Text("Ngày")),
        DataColumn(label: Text("Loại")),
        DataColumn(label: Text("Danh mục")),
        DataColumn(label: Text("Mô tả")),
        DataColumn(label: Text("Số tiền")),
        DataColumn(label: Text("Người tạo")),
      ],
      rows: transactions.map((t) {
        return DataRow(cells: [
          DataCell(Text(t.date)),
          DataCell(Text(t.type)),
          DataCell(Text(t.category)),
          DataCell(
            Text(
              t.amount >= 0 ? "+${t.amount}" : t.amount.toString(),
              style: TextStyle(
                color: t.amount >= 0 ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          DataCell(Text(t.description)),
          DataCell(Text(t.creator)),
        ]);
      }).toList(),
    );
  }
}
