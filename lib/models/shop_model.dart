class Shop {
  final int id;
  final String name;
  final String description;
  final String location;
  final String logo;
  final DateTime createdAt;
  final DateTime updatedAt;

  Shop({
    required this.id,
    required this.name,
    required this.description,
    required this.location,
    required this.logo,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Shop.fromJson(Map<String, dynamic> json) {
    return Shop(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      location: json['location'],
      logo: json['logo'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
