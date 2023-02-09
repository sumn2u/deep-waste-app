class Category {
  final String id;
  final String imageURL;
  final int points;
  final String name;

  Category({this.id, this.name, this.imageURL, this.points});

  factory Category.fromMap(Map<String, dynamic> json) => new Category(
      id: json['id'],
      name: json['name'],
      imageURL: json['imageURL'],
      points: json['points']);

  Map<String, dynamic> toMap() {
    return {"id": id, "name": name, "imageURL": imageURL, "points": points};
  }
}
