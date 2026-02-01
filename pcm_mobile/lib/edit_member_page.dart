import 'package:flutter/material.dart';
import 'models/member.dart';
import 'services/member_service.dart';

class EditMemberPage extends StatefulWidget {
  final Member member;
  const EditMemberPage({super.key, required this.member});

  @override
  State<EditMemberPage> createState() => _EditMemberPageState();
}

class _EditMemberPageState extends State<EditMemberPage> {
  late TextEditingController nameCtrl;
  late TextEditingController emailCtrl;
  late TextEditingController phoneCtrl;

  @override
  void initState() {
    super.initState();
    nameCtrl = TextEditingController(text: widget.member.fullName);
    emailCtrl = TextEditingController(text: widget.member.email);
    phoneCtrl = TextEditingController(text: widget.member.phone);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Member')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: 'Full Name')),
            TextField(controller: emailCtrl, decoration: const InputDecoration(labelText: 'Email')),
            TextField(controller: phoneCtrl, decoration: const InputDecoration(labelText: 'Phone')),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await MemberService.updateMember(
                  widget.member.id,
                  nameCtrl.text,
                  emailCtrl.text,
                  phoneCtrl.text,
                );
                Navigator.pop(context);
              },
              child: const Text('Update'),
            )
          ],
        ),
      ),
    );
  }
}
