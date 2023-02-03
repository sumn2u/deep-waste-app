import 'package:deep_waste/constants/app_properties.dart';
import 'package:deep_waste/constants/size_config.dart';
import 'package:deep_waste/controller/user_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserInfo extends StatelessWidget {
  UserInfo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserNotifier userNotifier = Provider.of<UserNotifier>(context);
    var user = userNotifier.user;
    return Container(
      width: SizeConfig.screenWidth,
      child: Text(
        "Hi, ${user.name}!",
        style: TextStyle(
          fontSize: getProportionateScreenWidth(12),
          color: kSecondaryColor,
        ),
      ),
    );
  }
}
