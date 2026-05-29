import 'package:deep_waste/components/category_card.dart';
import 'package:deep_waste/database_manager.dart';
import 'package:deep_waste/models/Category.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: FutureBuilder<List<Category>>(
            future: DatabaseManager.instance.getCategories(),
            builder: (
              BuildContext context,
              AsyncSnapshot<List<Category>> snapshot,
            ) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: Text("Loading"),
                );
              }

              if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              }

              final categories = snapshot.data ?? [];

              if (categories.isEmpty) {
                return const Center(
                  child: Text('No Categories found'),
                );
              }

              return Row(
                children: categories
                    .map(
                      (category) => CategoryCard(
                        category: category,
                      ),
                    )
                    .toList(),
              );
            },
          ),
        ),
      ],
    );
  }
}