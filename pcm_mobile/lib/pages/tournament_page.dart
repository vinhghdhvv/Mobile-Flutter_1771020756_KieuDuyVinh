import 'package:flutter/material.dart';
import '../models/tournament.dart';
import '../screens/add_tournament_screen.dart';

class TournamentPage extends StatefulWidget {
  const TournamentPage({super.key});

  @override
  State<TournamentPage> createState() => _TournamentPageState();
}

class _TournamentPageState extends State<TournamentPage> {
  final List<Tournament> tournaments = [
    Tournament(
      name: 'Giải Mini T1/2026',
      type: 'Mini-game - Team Battle',
      entryFee: 50000,
      prize: 500000,
      status: 'Đang diễn ra',
      participants: 8,
    ),
    Tournament(
      name: 'Kèo Thách đấu Cuối tuần',
      type: 'Duel - N/A',
      entryFee: 0,
      prize: 0,
      status: 'Đang mở',
      participants: 5,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff6f7fb),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Giải đấu',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: ElevatedButton.icon(
              icon: const Icon(Icons.add),
              label: const Text('Tạo giải'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () async {
                final Tournament? newTournament =
                    await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const AddTournamentScreen(),
                  ),
                );

                if (newTournament != null) {
                  setState(() {
                    tournaments.add(newTournament);
                  });
                }
              },
            ),
          )
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: tournaments.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // web / desktop
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 1.6,
          ),
          itemBuilder: (context, index) {
            return _tournamentCard(tournaments[index]);
          },
        ),
      ),
    );
  }

  Widget _tournamentCard(Tournament t) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// TITLE + STATUS
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Icon(Icons.emoji_events, color: Colors.blue),
                    SizedBox(width: 8),
                  ],
                ),
                _statusChip(t.status),
              ],
            ),

            const SizedBox(height: 8),

            Text(
              t.name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 4),

            Text(
              t.type,
              style: const TextStyle(color: Colors.grey),
            ),

            const Divider(height: 24),

            Text('Phí tham gia: ${t.entryFee} đ'),
            const SizedBox(height: 4),
            Text(
              'Tiền thưởng: ${t.prize} đ',
              style: const TextStyle(color: Colors.green),
            ),

            const Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${t.participants} người tham gia'),
                TextButton(
                  onPressed: () {},
                  child: const Text('Chi tiết'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _statusChip(String status) {
    Color bg;
    Color text;

    switch (status) {
      case 'Đang diễn ra':
        bg = Colors.orange.shade100;
        text = Colors.orange;
        break;
      case 'Đang mở':
      default:
        bg = Colors.green.shade100;
        text = Colors.green;
    }

    return Chip(
      label: Text(
        status,
        style: TextStyle(color: text),
      ),
      backgroundColor: bg,
    );
  }
}
