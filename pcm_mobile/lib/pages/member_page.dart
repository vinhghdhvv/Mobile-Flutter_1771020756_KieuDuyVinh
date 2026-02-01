import 'package:flutter/material.dart';

class Member {
  final int id;
  String name;
  String email;
  int rank;
  bool active;

  Member({
    required this.id,
    required this.name,
    required this.email,
    required this.rank,
    required this.active,
  });
}

class MemberPage extends StatefulWidget {
  const MemberPage({super.key});

  @override
  State<MemberPage> createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  List<Member> members = [
    Member(id: 1, name: 'Nguyễn Văn A', email: 'a@gmail.com', rank: 1, active: true),
    Member(id: 2, name: 'Trần Thị B', email: 'b@gmail.com', rank: 2, active: false),
    Member(id: 3, name: 'Lê Văn C', email: 'c@gmail.com', rank: 3, active: true),
  ];

  int _autoId = 4;

  // ================= ADD MEMBER =================
  void _showAddMemberDialog() {
    final nameCtrl = TextEditingController();
    final emailCtrl = TextEditingController();
    final rankCtrl = TextEditingController();

    bool active = true;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Thêm hội viên'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameCtrl,
                decoration: const InputDecoration(labelText: 'Tên'),
              ),
              TextField(
                controller: emailCtrl,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: rankCtrl,
                decoration: const InputDecoration(labelText: 'Hạng'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Text('Hoạt động'),
                  Switch(
                    value: active,
                    onChanged: (v) {
                      active = v;
                    },
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Hủy'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  members.add(
                    Member(
                      id: _autoId++,
                      name: nameCtrl.text,
                      email: emailCtrl.text,
                      rank: int.tryParse(rankCtrl.text) ?? 1,
                      active: active,
                    ),
                  );
                });
                Navigator.pop(context);
              },
              child: const Text('Thêm'),
            ),
          ],
        );
      },
    );
  }

  // ================= DELETE =================
  void _deleteMember(Member m) {
    setState(() {
      members.remove(m);
    });
  }

  // ================= EDIT =================
  void _editMember(Member m) {
    final nameCtrl = TextEditingController(text: m.name);
    final emailCtrl = TextEditingController(text: m.email);
    final rankCtrl = TextEditingController(text: m.rank.toString());
    bool active = m.active;

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Sửa hội viên'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: 'Tên')),
            TextField(controller: emailCtrl, decoration: const InputDecoration(labelText: 'Email')),
            TextField(
              controller: rankCtrl,
              decoration: const InputDecoration(labelText: 'Hạng'),
              keyboardType: TextInputType.number,
            ),
            SwitchListTile(
              title: const Text('Hoạt động'),
              value: active,
              onChanged: (v) => active = v,
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Hủy')),
          ElevatedButton(
            onPressed: () {
              setState(() {
                m.name = nameCtrl.text;
                m.email = emailCtrl.text;
                m.rank = int.tryParse(rankCtrl.text) ?? m.rank;
                m.active = active;
              });
              Navigator.pop(context);
            },
            child: const Text('Lưu'),
          ),
        ],
      ),
    );
  }

  // ================= UI =================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hội viên'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: ElevatedButton.icon(
              onPressed: _showAddMemberDialog,
              icon: const Icon(Icons.add),
              label: const Text('Thêm hội viên'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: DataTable(
            columns: const [
              DataColumn(label: Text('Tên')),
              DataColumn(label: Text('Email')),
              DataColumn(label: Text('Hạng')),
              DataColumn(label: Text('Trạng thái')),
              DataColumn(label: Text('Hành động')),
            ],
            rows: members.map((m) {
              return DataRow(
                cells: [
                  DataCell(Text(m.name)),
                  DataCell(Text(m.email)),
                  DataCell(Text(m.rank.toString())),
                  DataCell(
                    Icon(
                      m.active ? Icons.check_circle : Icons.cancel,
                      color: m.active ? Colors.green : Colors.red,
                    ),
                  ),
                  DataCell(
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onPressed: () => _editMember(m),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _deleteMember(m),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
