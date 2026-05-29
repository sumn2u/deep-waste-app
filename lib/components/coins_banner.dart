import 'package:deep_waste/constants/size_config.dart';
import 'package:deep_waste/models/Item.dart';
import 'package:flutter/material.dart';

class CoinsBanner extends StatelessWidget {
  final List<Item> items;

  const CoinsBanner({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int currentCoins = items.fold(
      0,
      (sum, item) => sum + (item.count * item.points),
    );

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
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(3, 3),
          ),
          const BoxShadow(
            color: Colors.black,
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
                    style: const TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: "$currentCoins coins\n",
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(16),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "For each recycled item, you get a different amount of coins that you can spend through Moms Store Nepal.",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(14),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Image.asset(
              'assets/images/coins.png',
              height: 100,
              width: 350,
            ),
          ),
        ],
      ),
    );
  }
}