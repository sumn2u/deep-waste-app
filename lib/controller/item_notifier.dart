import 'dart:collection';
import 'package:deep_waste/models/Item.dart';
import 'package:flutter/material.dart';

class ItemNotifier extends ChangeNotifier {
  List<Item> _items = [
    Item(
        id: "1001",
        name: "Cardboard",
        imageURL: "assets/images/cardboard.png",
        count: 0,
        points: 36),
    Item(
        id: "1004",
        name: "Paper",
        count: 0,
        imageURL: "assets/images/paper.png",
        points: 38),
    Item(
        id: "1002",
        name: "Glass",
        count: 0,
        imageURL: "assets/images/glass.png",
        points: 3),
    Item(
        id: "1003",
        name: "Metal",
        count: 0,
        imageURL: "assets/images/metal.png",
        points: 68),
    Item(
        id: "1005",
        name: "Plastic",
        count: 0,
        imageURL: "assets/images/plastic.png",
        points: 18),
    Item(
        id: "1006",
        name: "Trash",
        count: 1,
        imageURL: "assets/images/trash.png",
        points: 35)
  ];

  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  Item getCollectedItem() {
    return _items.firstWhere((_reward) => _reward.count > 0,
        orElse: () => null);
  }
}
