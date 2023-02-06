import 'package:deep_waste/constants/size_config.dart';
import 'package:deep_waste/controller/item_notifier.dart';
import 'package:deep_waste/controller/reward_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RewardsBanner extends StatelessWidget {
  const RewardsBanner({
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
            flex: 1,
            child: Image.asset(activeReward.imageURL, height: 160, width: 350),
          ),
          Expanded(
            flex: 2,
            child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(TextSpan(
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: getProportionateScreenWidth(16),
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(text: "${activeReward.name}"),
                        ],
                      )),
                      SizedBox(height: getProportionateScreenHeight(5)),
                      Text.rich(TextSpan(
                        text:
                            "You have recycled more than ${activeReward.points * 0.1} kg of carbon footprints. We thank you for your contribution. Keep taking care of our planet and recycle to get more rewards and coins.",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )),
                    ])),
          ),
        ]));
  }
}
