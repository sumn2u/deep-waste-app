import 'package:deep_waste/constants/size_config.dart';
import 'package:flutter/material.dart';

class ProgressBanner extends StatelessWidget {
  const ProgressBanner({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: getProportionateScreenWidth(20)),
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
          vertical: getProportionateScreenWidth(15),
        ),
        decoration: BoxDecoration(
          color: Color(0xFF4A3298),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(children: <Widget>[
          Expanded(
            flex: 2,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text.rich(TextSpan(
                style: TextStyle(color: Colors.white),
                children: [
                  TextSpan(text: "Plastic recycled:\n"),
                ],
              )),
              Text.rich(TextSpan(
                text: "4 / 10 items",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: getProportionateScreenWidth(16),
                  fontWeight: FontWeight.bold,
                ),
              )),
              Container(
                margin: EdgeInsets.only(top: 20, right: 10),
                height: 10,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: LinearProgressIndicator(
                    value: 0.7,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Color(0xff69c0dc)),
                    backgroundColor: Color(0xffD6D6D6),
                  ),
                ),
              )
            ]),
          ),
          Expanded(
            flex: 1,
            child: Image.asset('assets/images/Bronze.png',
                height: 100, width: 350),
          )
        ]));
  }
}
