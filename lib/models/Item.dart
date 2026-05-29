class Item {
  final String id;
  final String imageURL;
  int points;
  final String name;
  int count;

  Item({
    required this.id,
    required this.name,
    required this.imageURL,
    required this.points,
    required this.count,
  });

  factory Item.fromMap(Map<String, dynamic> json) => Item(
        id: json['id'],
        name: json['name'],
        imageURL: json['imageURL'],
        points: json['points'],
        count: json['count'],
      );

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "imageURL": imageURL,
      "points": points,
      "count": count,
    };
  }
}