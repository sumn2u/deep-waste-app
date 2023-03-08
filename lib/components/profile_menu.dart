import 'package:deep_waste/constants/app_properties.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key key,
    @required this.text,
    @required this.icon,
    this.press,
  }) : super(key: key);

  final String text, icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
        padding: EdgeInsets.all(20),
        backgroundColor:  Color(0xFFF5F6F9),
        side: BorderSide(
          color: Color(0xFFF5F6F9),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
        onPressed: press,
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              color: kPrimaryColor,
              width: 22,
            ),
            SizedBox(width: 20),
            Expanded(child: Text(text, style: TextStyle(
                            color: kSecondaryColor,
                          ),)),
            Icon(Icons.arrow_forward_ios, color: Color(0xFF979797)),
          ],
        ),
      ),
    );
  }
}

// Color(0xFF979797)