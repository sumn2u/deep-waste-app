import 'package:deep_waste/components/icon_btn_with_counter.dart';
import 'package:deep_waste/components/user_info.dart';
import 'package:deep_waste/constants/size_config.dart';
import 'package:deep_waste/models/User.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  final User user;
  const HomeHeader({
    Key key,
    @required this.user
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Column(
          children: [
            UserInfo(user: user),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Let's recycle",
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(18),
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                IconBtnWithCounter(
                  svgSrc: "assets/icons/Bell.svg",
                  numOfitem: 0,
                  press: () async {},
                ),
              ],
            )
          ],
        ));
  }
}
