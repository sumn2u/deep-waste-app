import 'package:deep_waste/components/item_card.dart';
import 'package:deep_waste/constants/size_config.dart';
import 'package:deep_waste/database_manager.dart';
import 'package:deep_waste/models/Item.dart';
import 'package:flutter/material.dart';

class Items extends StatefulWidget {
  @override
  _ItemsState createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: getProportionateScreenWidth(10)),
        child: FutureBuilder<List<Item>>(
            future: DatabaseManager.instance.getItems(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Item>> snapshot) {
              if (!snapshot.hasData) {
                return Center(child: Text("Loading"));
              }
              return snapshot.data?.isEmpty
                  ? Center(child: Text('No items found'))
                  : Column(
                      children: snapshot.data?.map((item) {
                        return Padding(
                            padding: EdgeInsets.only(top: 5, bottom: 5),
                            child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black12),
                                  borderRadius: BorderRadius.circular(8.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(
                                          3, 3), // changes position of shadow
                                    ),
                                    BoxShadow(
                                      color: Colors.white,
                                      offset: const Offset(0.0, 0.0),
                                      blurRadius: 0.0,
                                      spreadRadius: 0.0,
                                    ),
                                  ], //add it here
                                ),
                                child: ItemCard(item: item)));
                      }).toList(),
                    );
            }));
  }
}
