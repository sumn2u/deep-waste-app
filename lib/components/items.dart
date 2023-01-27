import 'package:deep_waste/components/item_card.dart';
import 'package:deep_waste/constants/size_config.dart';
import 'package:deep_waste/controller/item_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Items extends StatefulWidget {
  @override
  _ItemsState createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  @override
  Widget build(BuildContext context) {
    ItemNotifier itemNotifier = Provider.of<ItemNotifier>(context);
    var items = itemNotifier.items;
    return Container(
        padding: EdgeInsets.only(top: getProportionateScreenWidth(10)),
        child: ListView.builder(
            itemCount: items.length,
            shrinkWrap: true,
            itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12),
                      borderRadius: BorderRadius.circular(8.0),
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
                      ], //add it here
                    ),
                    child: ItemCard(item: items[index])))));
  }
}
