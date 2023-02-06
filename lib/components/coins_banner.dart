import 'package:deep_waste/constants/size_config.dart';
import 'package:deep_waste/controller/item_notifier.dart';
import 'package:deep_waste/controller/reward_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoinsBanner extends StatelessWidget {
  const CoinsBanner({
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

    return Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: getProportionateScreenWidth(20)),
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
          vertical: getProportionateScreenWidth(15),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(3, 3), // changes position of shadow
            ),
            BoxShadow(
              color: Colors.black,
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
                style: TextStyle(color: Colors.black),
                children: [
                  TextSpan(
                      text: "${activeReward.points} coins\n",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(16),
                        fontWeight: FontWeight.bold,
                      )),
                ],
              )),
              Text.rich(TextSpan(
                text:
                    "For each recycled item, you get a different amount of coins that you can spend through Moms Store Nepal or to offset your emissions.",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(14)),
              )),
            ]),
          ),
          Expanded(
            flex: 1,
            child:
                Image.asset('assets/images/coins.png', height: 100, width: 350),
          )
        ]));
  }
}
