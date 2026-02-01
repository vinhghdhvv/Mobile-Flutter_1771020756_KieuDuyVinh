import 'package:flutter/material.dart';

class DashboardHome extends StatelessWidget {
  const DashboardHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Dashboard',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          // SUMMARY
          Row(
            children: const [
              _StatCard(title: 'Thành viên', value: '11', color: Colors.blue),
              SizedBox(width: 16),
              _StatCard(title: 'Sân', value: '4', color: Colors.teal),
              SizedBox(width: 16),
              _StatCard(title: 'Giải đấu', value: '6', color: Colors.orange),
              SizedBox(width: 16),
              _StatCard(title: 'Quỹ CLB', value: '800K', color: Colors.green),
            ],
          ),

          const SizedBox(height: 30),

          const Text(
            'Tin tức gần đây',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),

          const Card(
            child: ListTile(
              title: Text('Chào mừng thành viên mới'),
              subtitle: Text('Cập nhật 17 ngày trước'),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  const _StatCard({
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        color: color.withOpacity(0.1),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(title),
              const SizedBox(height: 8),
              Text(
                value,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
