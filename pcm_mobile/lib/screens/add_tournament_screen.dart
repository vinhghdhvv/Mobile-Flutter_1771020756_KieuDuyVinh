import 'package:flutter/material.dart';
import '../models/tournament.dart';

class AddTournamentScreen extends StatefulWidget {
  const AddTournamentScreen({super.key});

  @override
  State<AddTournamentScreen> createState() => _AddTournamentScreenState();
}

class _AddTournamentScreenState extends State<AddTournamentScreen> {
  final nameCtrl = TextEditingController();
  final entryCtrl = TextEditingController();
  final prizeCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tạo giải đấu')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameCtrl,
              decoration: const InputDecoration(labelText: 'Tên giải'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: entryCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Phí tham gia'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: prizeCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Tiền thưởng'),
            ),
            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: const Text('Tạo giải'),
                onPressed: () {
                  final tournament = Tournament(
                    name: nameCtrl.text,
                    type: 'Mini-game',
                    entryFee: int.parse(entryCtrl.text),
                    prize: int.parse(prizeCtrl.text),
                    status: 'Đang mở',
                    participants: 0,
                  );

                  Navigator.pop(context, tournament); // ⭐ TRẢ VỀ
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
