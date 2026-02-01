import 'package:flutter/material.dart';
import '../models/member.dart';
import '../services/member_service.dart';
import 'add_member_screen.dart';

class MemberListScreen extends StatefulWidget {
  const MemberListScreen({super.key});

  @override
  State<MemberListScreen> createState() => _MemberListScreenState();
}

class _MemberListScreenState extends State<MemberListScreen> {
  late Future<List<Member>> members;

  @override
  void initState() {
    super.initState();
    members = MemberService.getMembers();
  }

  void reload() {
    setState(() {
      members = MemberService.getMembers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Members'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add), // ✅ DẤU +
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const AddMemberScreen(),
                ),
              );
              reload(); // quay về load lại danh sách
            },
          )
        ],
      ),
      body: FutureBuilder<List<Member>>(
        future: members,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Chưa có member'));
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final m = snapshot.data![index];
              return ListTile(
                title: Text(m.fullName),
                subtitle: Text(m.email),
              );
            },
          );
        },
      ),
    );
  }
}
