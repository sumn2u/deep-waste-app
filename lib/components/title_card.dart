import 'package:deep_waste/constants/size_config.dart';
import 'package:flutter/material.dart';

titleCard({String title}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: TextStyle(
          fontSize: getProportionateScreenWidth(18),
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
    ],
  );
}
