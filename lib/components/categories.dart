import 'package:deep_waste/components/category_card.dart';
import 'package:flutter/material.dart';
import 'package:deep_waste/constants/size_config.dart';
import 'package:deep_waste/controller/category_notifier.dart';
import 'package:provider/provider.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CategoryNotifier categoryNotifier = Provider.of<CategoryNotifier>(context);
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                categoryNotifier.categories.length,
                (index) {
                  return CategoryCard(
                      category: categoryNotifier.categories[index]);
                },
              ),
              SizedBox(width: getProportionateScreenWidth(10)),
            ],
          ),
        )
      ],
    );
  }
}
