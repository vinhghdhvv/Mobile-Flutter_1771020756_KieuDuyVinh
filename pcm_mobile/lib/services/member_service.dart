import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/member.dart';

class MemberService {
  // ⚠️ QUAN TRỌNG
  // Android Emulator dùng 10.0.2.2
  static const String baseUrl =
    'http://localhost:5081/api/members'
;

  // Nếu chạy Flutter Web / Windows:
  // static const String baseUrl =
  //     'http://localhost:5081/api/members';

  static Future<List<Member>> getMembers() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((e) => Member.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load members');
    }
  }
  static Future<void> addMember(
  String name,
  String email,
  String phone,
) async {
  final response = await http.post(
    Uri.parse(baseUrl),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'fullName': name,
      'email': email,
      'phone': phone,
    }),
  );

  if (response.statusCode != 200 && response.statusCode != 201) {
    throw Exception('Failed to add member');
  }
}
static Future<void> updateMember(
  int id,
  String name,
  String email,
  String phone,
) async {
  final response = await http.put(
    Uri.parse('$baseUrl/$id'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'fullName': name,
      'email': email,
      'phone': phone,
    }),
  );

  if (response.statusCode != 200) {
    throw Exception('Failed to update member');
  }
}

static Future<void> deleteMember(int id) async {
  final response = await http.delete(
    Uri.parse('$baseUrl/$id'),
  );

  if (response.statusCode != 200) {
    throw Exception('Failed to delete member');
  }
}


}
