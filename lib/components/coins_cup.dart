import 'package:deep_waste/components/coins_banner.dart';
import 'package:deep_waste/components/title_card.dart';
import 'package:deep_waste/constants/size_config.dart';
import 'package:flutter/material.dart';

class CoinsCup extends StatelessWidget {
  const CoinsCup({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(10)),
            titleCard(title: "Coins Earned"),
            CoinsBanner()
          ],
        ));
  }
}
