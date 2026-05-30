import 'package:deep_waste/components/coins_cup.dart';
import 'package:deep_waste/components/reward_cup.dart';
import 'package:deep_waste/constants/app_properties.dart';
import 'package:deep_waste/constants/size_config.dart';
import 'package:deep_waste/controller/tips_notifier.dart';
import 'package:deep_waste/models/Item.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RewardsScreen extends StatefulWidget {
  static String routeName = "/rewards_screen";

  final List<Item> items;

  const RewardsScreen({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  State<RewardsScreen> createState() => _RewardsScreenState();
}

class _RewardsScreenState extends State<RewardsScreen> {
  late ExpandableController controller;

  @override
  void initState() {
    super.initState();
    controller = ExpandableController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tipsNotifier = Provider.of<TipsNotifier>(context);
    final tip = tipsNotifier.getRandomTip();

    final int totalPoints = widget.items.fold(
      0,
      (sum, item) => sum + (item.count * item.points),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0.0,
      ),
      backgroundColor: white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenHeight(5)),

              if (totalPoints > 0)
                RewardCup(items: widget.items),

              SizedBox(height: getProportionateScreenHeight(10)),

              CoinsCup(items: widget.items),

              SizedBox(height: getProportionateScreenHeight(10)),

              ListView(
                shrinkWrap: true,
                primary: false,
                children: [
                  buildCard(
                    tip.name,
                    tip.tips,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCard(String title, List<String> tips) {
    final safeTips = tips.length >= 2
        ? tips
        : [...tips, if (tips.isNotEmpty) tips.first else "No tips available"];

    return Padding(
      // External screen padding for consistency across app screens
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
      ),
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 0, // Clear native card elevation shadow to let custom BoxDecoration shadow display
        color: Colors.transparent, // Prevents underlying white card canvas bleeds
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(
            top: getProportionateScreenWidth(20),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: getProportionateScreenWidth(15),
          ),
          decoration: BoxDecoration(
            color: const Color(0xff69c0dc),
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
          child: ExpandablePanel(
            controller: controller,
            theme: const ExpandableThemeData(
              tapBodyToCollapse: true,
              tapBodyToExpand: true,
              iconColor: Colors.white,
              headerAlignment: ExpandablePanelHeaderAlignment.center,
            ),
            header: Text(
              "Tips for managing $title waste",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            collapsed: Padding(
              padding: EdgeInsets.only(top: getProportionateScreenWidth(10)),
              child: Text(
                safeTips.isNotEmpty ? safeTips.first : "",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(14),
                  color: Colors.white,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            expanded: Padding(
              padding: EdgeInsets.only(top: getProportionateScreenWidth(10)),
              child: Column(
                children: safeTips.map((tip) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: getProportionateScreenWidth(8)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "\u2022",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(16),
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            tip,
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(14),
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}