import 'package:deep_waste/constants/app_properties.dart';
import 'package:deep_waste/constants/size_config.dart';
import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  UserInfo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth,
      child: Text(
        "Hi, Lisa!",
        style: TextStyle(
          fontSize: getProportionateScreenWidth(12),
          color: kSecondaryColor,
        ),
      ),
    );
  }
}
