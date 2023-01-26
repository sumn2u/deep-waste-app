import 'dart:collection';
import 'package:deep_waste/models/Category.dart';
import 'package:flutter/material.dart';

class CategoryNotifier extends ChangeNotifier {
  List<Category> _categories = [
    Category(
        id: "1001",
        name: "Cardboard",
        imageURL: "assets/images/cardboard.png",
        points: 36),
    Category(
        id: "1004",
        name: "Paper",
        imageURL: "assets/images/paper.png",
        points: 38),
    Category(
        id: "1002",
        name: "Glass",
        imageURL: "assets/images/glass.png",
        points: 3),
    Category(
        id: "1003",
        name: "Metal",
        imageURL: "assets/images/metal.png",
        points: 68),
    Category(
        id: "1005",
        name: "Plastic",
        imageURL: "assets/images/plastic.png",
        points: 18),
    Category(
        id: "1006",
        name: "Trash",
        imageURL: "assets/images/trash.png",
        points: 35)
  ];

  /// An unmodifiable view of the categories in the cart.
  UnmodifiableListView<Category> get categories =>
      UnmodifiableListView(_categories);
}
