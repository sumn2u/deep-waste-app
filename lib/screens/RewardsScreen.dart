import 'package:deep_waste/components/coins_cup.dart';
import 'package:deep_waste/components/reward_cup.dart';
import 'package:deep_waste/constants/app_properties.dart';
import 'package:deep_waste/constants/size_config.dart';
import 'package:deep_waste/controller/tips_notifier.dart';
import 'package:expandable/expandable.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RewardsScreen extends StatefulWidget {
  static String routeName = "/rewards_screen";

  RewardsScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _RewardsScreenState createState() => _RewardsScreenState();
}

class _RewardsScreenState extends State<RewardsScreen> {
  final String lorelEpsum = 'This is great product ...';
  ExpandableController controller;

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
    TipsNotifier tipsNotifier = Provider.of<TipsNotifier>(context);
    var tip = tipsNotifier.getRandomTip();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      backgroundColor: white,
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(children: [
        SizedBox(height: getProportionateScreenHeight(5)),
        RewardCup(),
        SizedBox(height: getProportionateScreenHeight(10)),
        CoinsCup(),
        SizedBox(height: getProportionateScreenHeight(10)),
        ListView(
          shrinkWrap: true,
          primary: false,
          children: [buildCard(tip.name, tip.tips)],
        )
      ]))),
    );
  }

  Widget buildCard(String title, List<String> _tips) => Padding(
      padding: EdgeInsets.all(20),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Container(
            decoration: BoxDecoration(
              color: Color(0xff69c0dc),
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
            child: Column(children: <Widget>[
              ExpandablePanel(
                  controller: controller,
                  theme: ExpandableThemeData(
                      tapBodyToCollapse: true,
                      tapBodyToExpand: true,
                      iconColor: Colors.white),
                  header: Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 20,
                        20), //apply padding to LTRB, L:Left, T:Top, R:Right, B:Bottom
                    child: Text("Tips for mangaing $title waste",
                        style: TextStyle(
                            fontSize: getProportionateScreenWidth(16),
                            color: Colors.white,
                            fontWeight: FontWeight.w600)),
                  ),
                  collapsed: Text(
                    _tips[0] + " " + _tips[1],
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                    softWrap: true,
                    maxLines: 6,
                    overflow: TextOverflow.ellipsis,
                  ),
                  expanded: Column(
                      children: _tips.map((strone) {
                    return Row(children: [
                      Text(
                        "\u2022",
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(14),
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ), //bullet text
                      SizedBox(
                          width: 8, height: 5), //space between bullet and text
                      Expanded(
                        child: Text(
                          "$strone \n",
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(14),
                              color: Colors.white),
                        ), //text
                      ),
                    ]);
                  }).toList()),
                  builder: (_, collapsed, expanded) => Padding(
                      padding: EdgeInsets.all(10).copyWith(top: 0),
                      child: Expandable(
                        collapsed: collapsed,
                        expanded: expanded,
                      )))
            ])),
      ));
}
