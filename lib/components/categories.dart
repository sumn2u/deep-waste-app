import 'package:deep_waste/components/category_card.dart';
import 'package:deep_waste/database_manager.dart';
import 'package:deep_waste/models/Category.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: FutureBuilder<List<Category>>(
                future: DatabaseManager.instance.getCategories(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Category>> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: Text("Loading"));
                  }
                  return snapshot.data?.isEmpty
                      ? Center(child: Text('No Categories found'))
                      : Row(
                          children: snapshot.data?.map((category) {
                            return CategoryCard(category: category);
                          }).toList(),
                        );
                }))
      ],
    );
  }
}
