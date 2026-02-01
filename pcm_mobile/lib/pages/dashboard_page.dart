import 'package:flutter/material.dart';

import '../widgets/sidebar.dart';
import 'home_page.dart';
import 'member_page.dart';
import 'court_page.dart';
import 'tournament_page.dart';
import 'finance_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    HomePage(),
    MemberPage(),
    CourtPage(),
    TournamentPage(),
    FinancePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: Row(
        children: [
          Sidebar(
            selectedIndex: selectedIndex,
            onChanged: (index) {
              setState(() => selectedIndex = index);
            },
          ),
          Expanded(
            child: pages[selectedIndex],
          ),
        ],
      ),
    );
  }
}
