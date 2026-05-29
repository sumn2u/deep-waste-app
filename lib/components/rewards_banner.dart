import 'package:deep_waste/constants/size_config.dart';
import 'package:deep_waste/controller/reward_notifier.dart';
import 'package:deep_waste/models/Item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RewardsBanner extends StatelessWidget {
  final List<Item> items;

  const RewardsBanner({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final rewardNotifier = Provider.of<RewardNotifier>(context);

    final int totalPoints = items.fold(
      0,
      (sum, item) => sum + (item.count * item.points),
    );

    final activeReward = rewardNotifier.getActiveReward(totalPoints);

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
        top: getProportionateScreenWidth(20),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
        vertical: getProportionateScreenWidth(15),
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF4A3298),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(3, 3),
          ),
          const BoxShadow(
            color: Colors.white,
            offset: Offset.zero,
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Image.asset(
              activeReward!.imageURL,
              height: 160,
              width: 350,
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    activeReward.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: getProportionateScreenWidth(16),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(5)),
                  Text(
                    "You have recycled more than ${(activeReward.points * 0.1).toStringAsFixed(1)} kg of carbon footprints. "
                    "We thank you for your contribution. Keep recycling to earn more rewards and coins.",
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}