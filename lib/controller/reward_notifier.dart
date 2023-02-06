import 'dart:collection';
import 'package:deep_waste/models/reward.dart';
import 'package:flutter/material.dart';

class RewardNotifier extends ChangeNotifier {
  List<Reward> _rewards = [
    Reward(
        id: "1001",
        name: "Bronze Cup",
        imageURL: "assets/images/Bronze.png",
        points: 250),
    Reward(
        id: "1002",
        name: "Silver Cup",
        imageURL: "assets/images/Silver.png",
        points: 1200),
    Reward(
        id: "1003",
        name: "Gold Cup",
        imageURL: "assets/images/Gold.png",
        points: 2000),
  ];
  Reward activeReward;

  UnmodifiableListView<Reward> get rewards => UnmodifiableListView(_rewards);

  Reward getActiveReward(point) {
    return _rewards.firstWhere((_reward) => _reward.points >= point,
        orElse: () => null);
  }
}
