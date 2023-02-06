import 'package:deep_waste/components/progess_banner.dart';
import 'package:deep_waste/constants/size_config.dart';
import 'package:deep_waste/controller/item_notifier.dart';
import 'package:deep_waste/screens/RewardsScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Progress extends StatelessWidget {
  const Progress({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ItemNotifier itemNotifier = Provider.of<ItemNotifier>(context);
    var collectedItems = itemNotifier.getCollectedItem();

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
            ProgressBanner()
          ],
        ),
        onTap: () {
          if (collectedItems != null) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => RewardsScreen()));
          }
        },
      ),
    );
  }
}
