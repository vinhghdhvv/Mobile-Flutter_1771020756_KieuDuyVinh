import 'package:flutter/material.dart';
import '../widgets/stat_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Dashboard',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),

          Row(
            children: const [
              StatCard(
                title: 'Thành viên',
                value: '11',
                subtitle: 'Hội viên CLB',
                color: Colors.blue,
                icon: Icons.group,
              ),
              SizedBox(width: 16),
              StatCard(
                title: 'Sân pickleball',
                value: '4',
                subtitle: 'Sân hoạt động',
                color: Colors.lightBlue,
                icon: Icons.search,
              ),
              SizedBox(width: 16),
              StatCard(
                title: 'Giải đấu',
                value: '6',
                subtitle: 'Đang diễn ra',
                color: Colors.orange,
                icon: Icons.emoji_events,
              ),
              SizedBox(width: 16),
              StatCard(
                title: 'Quỹ CLB',
                value: '800K',
                subtitle: 'Ổn định',
                color: Colors.green,
                icon: Icons.account_balance_wallet,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
