import 'package:deep_waste/constants/app_properties.dart';
import 'package:deep_waste/constants/size_config.dart';
import 'package:deep_waste/models/User.dart';
import 'package:flutter/material.dart';

class UserInfo extends StatefulWidget {
  final User user;
  UserInfo({
    Key key,
    @required this.user
  }) : super(key: key);

  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {


  @override
  Widget build(BuildContext context) {
    
    return Container(
      width: SizeConfig.screenWidth,
      child: Text(
        "Hi, ${ widget.user !=null ? widget.user.name : 'User'}!",
        style: TextStyle(
          fontSize: getProportionateScreenWidth(12),
          color: kSecondaryColor,
        ),
      ),
    );
  }
}
