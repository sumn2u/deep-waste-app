import 'dart:ui';
import 'package:deep_waste/constants/size_config.dart';
import 'package:deep_waste/controller/reward_notifier.dart';
import 'package:deep_waste/models/Item.dart';
import 'package:deep_waste/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProgressBanner extends StatelessWidget {
  final List<Item> items;

  const ProgressBanner({
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

    final double carbonFootPrints = totalPoints * 1.08;

    final double completion = activeReward!.points == 0
        ? 0
        : totalPoints / activeReward!.points;

    return items.isEmpty
        ? const Center(child: Text("Loading"))
        : Container(
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
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: getProportionateScreenWidth(12),
                          ),
                          children: [
                            TextSpan(
                              text:
                                  "Waste managed: ${carbonFootPrints <= 0 ? 0 : getNumber(carbonFootPrints, precision: 2)} Kg Co",
                            ),
                            TextSpan(
                              text: "2 \n",
                              style: TextStyle(
                                fontSize: getProportionateScreenWidth(12),
                                fontFeatures: const [
                                  FontFeature.subscripts(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          text:
                              "$totalPoints / ${activeReward!.points} points",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: getProportionateScreenWidth(16),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20, right: 10),
                        height: 10,
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          child: LinearProgressIndicator(
                            value: completion.clamp(0.0, 1.0),
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              Color(0xff69c0dc),
                            ),
                            backgroundColor: const Color(0xffD6D6D6),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Image.asset(
                    activeReward.imageURL,
                    height: 100,
                    width: 350,
                  ),
                )
              ],
            ),
          );
  }
}