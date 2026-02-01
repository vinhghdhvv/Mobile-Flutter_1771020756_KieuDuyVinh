import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/club.dart';

class ClubService {
  static const String baseUrl =
      'http://localhost:5081/api/Clubs';

  static Future<List<Club>> getClubs() async {
    final res = await http.get(Uri.parse(baseUrl));
    final List data = json.decode(res.body);
    return data.map((e) => Club.fromJson(e)).toList();
  }

  static Future<void> addClub(
    String name,
    String location,
    String description,
  ) async {
    await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'name': name,
        'location': location,
        'description': description,
      }),
    );
  }
}
