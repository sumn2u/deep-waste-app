import 'dart:ui';

import 'package:deep_waste/constants/size_config.dart';
import 'package:deep_waste/controller/item_notifier.dart';
import 'package:deep_waste/controller/reward_notifier.dart';
import 'package:deep_waste/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProgressBanner extends StatelessWidget {
  const ProgressBanner({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ItemNotifier itemNotifier = Provider.of<ItemNotifier>(context);
    RewardNotifier rewardNotifier = Provider.of<RewardNotifier>(context);
    var items = itemNotifier.items;
    int totalPoints =
        items.fold(0, (sum, item) => (item.count * item.points) + sum);
    var activeReward = rewardNotifier.getActiveReward(totalPoints);
    var carbonFootPrints = totalPoints * 1.08;
    return Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: getProportionateScreenWidth(20)),
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
          vertical: getProportionateScreenWidth(15),
        ),
        decoration: BoxDecoration(
          color: Color(0xFF4A3298),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(3, 3), // changes position of shadow
            ),
            BoxShadow(
              color: Colors.white,
              offset: const Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ),
          ],
        ),
        child: Row(children: <Widget>[
          Expanded(
            flex: 2,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text.rich(TextSpan(
                style: TextStyle(color: Colors.white),
                children: [
                  TextSpan(
                      text:
                          "Waste managed: ${carbonFootPrints <= 0 ? 0 : getNumber(carbonFootPrints, precision: 2)} Kg Co"),
                  TextSpan(
                      text: "2 \n",
                      style: TextStyle(
                          fontSize: 12,
                          fontFeatures: [FontFeature.subscripts()])),
                ],
              )),
              Text.rich(TextSpan(
                text: "$totalPoints / ${activeReward.points} points",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: getProportionateScreenWidth(16),
                  fontWeight: FontWeight.bold,
                ),
              )),
              Container(
                margin: EdgeInsets.only(top: 20, right: 10),
                height: 10,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: LinearProgressIndicator(
                    value: 0.7,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Color(0xff69c0dc)),
                    backgroundColor: Color(0xffD6D6D6),
                  ),
                ),
              )
            ]),
          ),
          Expanded(
            flex: 1,
            child: Image.asset(activeReward.imageURL, height: 100, width: 350),
          )
        ]));
  }
}
