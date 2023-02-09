import 'package:deep_waste/constants/app_properties.dart';
import 'package:deep_waste/constants/size_config.dart';
import 'package:deep_waste/database_manager.dart';
import 'package:deep_waste/models/User.dart';
import 'package:flutter/material.dart';

class UserInfo extends StatefulWidget {
  UserInfo({
    Key key,
  }) : super(key: key);

  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  User user;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getUserInfo();
  }

  Future getUserInfo() async {
    setState(() => isLoading = true);
    user = await DatabaseManager.instance.getUser();
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth,
      child: Text(
        isLoading ? "" : "Hi, ${user.name}!",
        style: TextStyle(
          fontSize: getProportionateScreenWidth(12),
          color: kSecondaryColor,
        ),
      ),
    );
  }
}
