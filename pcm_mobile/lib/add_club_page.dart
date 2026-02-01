import 'package:flutter/material.dart';
import '../models/club.dart';
import '../services/club_service.dart';

class ClubPage extends StatefulWidget {
  const ClubPage({super.key});

  @override
  State<ClubPage> createState() => _ClubPageState();
}

class _ClubPageState extends State<ClubPage> {
  late Future<List<Club>> clubs;

  @override
  void initState() {
    super.initState();
    clubs = ClubService.getClubs();
  }

  void reload() {
    setState(() {
      clubs = ClubService.getClubs();
    });
  }

  // 🔹 Dialog thêm Club
  void showAddDialog() {
    final nameCtrl = TextEditingController();
    final locationCtrl = TextEditingController();
    final descCtrl = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Add Club'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameCtrl,
              decoration: const InputDecoration(labelText: 'Club name'),
            ),
            TextField(
              controller: locationCtrl,
              decoration: const InputDecoration(labelText: 'Location'),
            ),
            TextField(
              controller: descCtrl,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              await ClubService.addClub(
                nameCtrl.text,
                locationCtrl.text,
                descCtrl.text,
              );
              Navigator.pop(context);
              reload(); // load lại list
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clubs'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add), // ✅ DẤU +
            onPressed: showAddDialog,
          ),
        ],
      ),
      body: FutureBuilder<List<Club>>(
        future: clubs,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final data = snapshot.data ?? [];

          if (data.isEmpty) {
            return const Center(child: Text('Chưa có club'));
          }

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final c = data[index];
              return ListTile(
                leading: CircleAvatar(
                  child: Text(c.id.toString()),
                ),
                title: Text(c.name),
                subtitle: Text('${c.location}\n${c.description}'),
                isThreeLine: true,
              );
            },
          );
        },
      ),
    );
  }
}
