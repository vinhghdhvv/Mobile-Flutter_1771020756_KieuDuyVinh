import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onChanged;

  const Sidebar({
    super.key,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(height: 24),
          const Text(
            'CLB Pickleball Vợt Thủ Phố Núi',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 32),

          _item(Icons.dashboard, 'Dashboard', 0),
          _item(Icons.group, 'Hội viên', 1),
          _item(Icons.sports_tennis, 'Sân bóng', 2),
          _item(Icons.emoji_events, 'Giải đấu', 3),
          _item(Icons.account_balance_wallet, 'Tài chính', 4),
        ],
      ),
    );
  }

  Widget _item(IconData icon, String title, int index) {
    final bool active = index == selectedIndex;

    return InkWell(
      onTap: () => onChanged(index),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: active ? Colors.blue.shade50 : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(icon, color: active ? Colors.blue : Colors.grey),
            const SizedBox(width: 12),
            Text(
              title,
              style: TextStyle(
                color: active ? Colors.blue : Colors.black87,
                fontWeight: active ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
