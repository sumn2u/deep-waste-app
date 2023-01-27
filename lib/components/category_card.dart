import 'package:deep_waste/constants/app_properties.dart';
import 'package:deep_waste/constants/size_config.dart';
import 'package:deep_waste/models/Category.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key key,
    this.width = 120,
    this.aspectRetio = 1.02,
    @required this.category,
  }) : super(key: key);

  final double width, aspectRetio;
  final Category category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: getProportionateScreenWidth(20),
          bottom: getProportionateScreenWidth(10)),
      child: SizedBox(
        width: getProportionateScreenWidth(width),
        child: GestureDetector(
            onTap: () async {},
            child: Stack(
              children: [
                Container(
                    padding: EdgeInsets.only(
                      left: 12,
                      top: getProportionateScreenHeight(14),
                      right: 12,
                      bottom: 12,
                    ),
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                          color: Colors.black12,
                          width: 2,
                          style: BorderStyle.solid),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AspectRatio(
                          aspectRatio: 1.02,
                          child: Container(
                            child: Hero(
                                tag: category.id.toString(),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    image: DecorationImage(
                                        image:
                                            new AssetImage(category.imageURL),
                                        fit: BoxFit.cover),
                                  ),
                                )),
                          ),
                        ),
                        SizedBox(height: getProportionateScreenHeight(5)),
                        Text(
                          category.name,
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(12),
                            color: kSecondaryColor,
                          ),
                        ),
                        Text(
                          "${category.points} points",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(12),
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ))
              ],
            )),
      ),
    );
  }
}
