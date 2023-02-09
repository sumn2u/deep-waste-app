class User {
  final int id;
  final String name;
  User({this.id, this.name});

  factory User.fromMap(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toMap() {
    return {"id": id, "name": name};
  }
}
