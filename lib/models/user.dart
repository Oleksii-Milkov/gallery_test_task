class User {
  late String id;
  late String name;

  User({
    required this.id,
    required this.name,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] ?? '';
  }
}