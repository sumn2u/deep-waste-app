import 'package:deep_waste/constants/app_properties.dart';
import 'package:deep_waste/constants/size_config.dart';
import 'package:deep_waste/models/Item.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key key,
    @required this.item,
  }) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(90),
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.asset(item.imageURL)),
          ),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.name,
              style: TextStyle(color: kSecondaryColor, fontSize: getProportionateScreenWidth(14)),
              maxLines: 2,
            ),
            SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text: "${item.points} points",
                style: TextStyle(fontWeight: FontWeight.w500,  fontSize: getProportionateScreenWidth(12)),
                children: [
                  TextSpan(
                    text: " x ${item.count}",
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: Color(0xff69c0dc),  fontSize: getProportionateScreenWidth(12)),
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
