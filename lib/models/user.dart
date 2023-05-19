class User {
  final String name;
  final String avatar;

  User({required this.name, required this.avatar});
  factory User.fromJson(Map<String, dynamic> json) {
    return User(name: json['name'], avatar: json['avatar']);
  }
}
