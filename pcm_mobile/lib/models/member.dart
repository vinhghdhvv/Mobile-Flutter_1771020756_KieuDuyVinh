class Member {
  final int id;
  final String fullName;
  final String email;
  final String phone;
  final double rank;
  final bool active;

  Member({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.rank,
    required this.active,
  });

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      id: json['id'],
      fullName: json['fullName'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      rank: (json['rank'] ?? 0).toDouble(),
      active: json['active'] ?? false,
    );
  }
}
