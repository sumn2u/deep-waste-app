import 'package:deep_waste/components/rewards_banner.dart';
import 'package:deep_waste/components/title_card.dart';
import 'package:deep_waste/constants/size_config.dart';
import 'package:flutter/material.dart';

class RewardCup extends StatelessWidget {
  const RewardCup({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Column(
          children: [titleCard(title: "Your Reward"), RewardsBanner()],
        ));
  }
}
