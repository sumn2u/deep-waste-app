import 'package:deep_waste/components/categories.dart';
import 'package:deep_waste/components/history.dart';
import 'package:deep_waste/components/home_header.dart';
import 'package:deep_waste/components/progress.dart';
import 'package:deep_waste/constants/app_properties.dart';
import 'package:deep_waste/constants/size_config.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home_screen";

  HomeScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(children: [
          HomeHeader(),
          SizedBox(height: getProportionateScreenHeight(15)),
          Categories(),
          SizedBox(height: getProportionateScreenHeight(20)),
          Progress(),
          SizedBox(height: getProportionateScreenHeight(20)),
          History(),
          SizedBox(width: getProportionateScreenWidth(20)),
        ]))),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          elevation: 0.0,
          backgroundColor: Color(0xff69c0dc),
          child: const Icon(Icons.document_scanner_sharp),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}
