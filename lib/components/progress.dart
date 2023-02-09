import 'package:deep_waste/components/progess_banner.dart';
import 'package:deep_waste/constants/size_config.dart';
import 'package:deep_waste/models/Item.dart';
import 'package:deep_waste/screens/RewardsScreen.dart';
import 'package:flutter/material.dart';

class Progress extends StatelessWidget {
  final List<Item> items;
  Progress({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: InkWell(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Progress",
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(18),
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            ProgressBanner(
              items: items,
            )
          ],
        ),
        onTap: () {
          if (items.isNotEmpty) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RewardsScreen(items: items)));
          }
        },
      ),
    );
  }
}
