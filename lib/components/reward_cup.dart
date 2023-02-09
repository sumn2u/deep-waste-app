import 'package:deep_waste/components/rewards_banner.dart';
import 'package:deep_waste/components/title_card.dart';
import 'package:deep_waste/constants/size_config.dart';
import 'package:deep_waste/models/Item.dart';
import 'package:flutter/material.dart';

class RewardCup extends StatelessWidget {
  final List<Item> items;
  const RewardCup({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Column(
          children: [
            titleCard(title: "Your Reward"),
            RewardsBanner(items: items)
          ],
        ));
  }
}
