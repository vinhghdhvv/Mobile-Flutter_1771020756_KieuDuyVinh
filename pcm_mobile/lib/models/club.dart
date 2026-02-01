class Club {
  final int id;
  final String name;
  final String location;
  final String description;

  Club({
    required this.id,
    required this.name,
    required this.location,
    required this.description,
  });

  factory Club.fromJson(Map<String, dynamic> json) {
    return Club(
      id: json['id'],
      name: json['name'],
      location: json['location'],
      description: json['description'],
    );
  }
}
