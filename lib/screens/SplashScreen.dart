import 'package:deep_waste/constants/app_properties.dart';
import 'package:deep_waste/database_manager.dart';
import 'package:deep_waste/models/User.dart';
import 'package:deep_waste/screens/HomeScreen.dart';
import 'package:deep_waste/screens/OnboardingScreen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "/splash_screen";
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  Animation<double> opacity;
  AnimationController controller;
  User user;
  bool isLoading = false;

  Future getUserInfo() async {
    setState(() => isLoading = true);
    user = await DatabaseManager.instance.getUser();
    setState(() => isLoading = false);
  }

  @override
  void initState() {
    super.initState();
    getUserInfo();
    controller = AnimationController(
        duration: Duration(milliseconds: 2500), vsync: this);
    opacity = Tween<double>(begin: 1.0, end: 0.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.forward().then((_) {
      navigationPage();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void navigationPage() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) =>
            !isLoading && user != null ? HomeScreen() : OnboardingScreen()));
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover)),
      child: Container(
        decoration: BoxDecoration(color: transparentGreen),
        child: SafeArea(
          child: new Scaffold(
            body: Column(
              children: <Widget>[
                Expanded(
                  child: Opacity(
                      opacity: opacity.value,
                      child: new Image.asset('assets/images/logo.png')),
                ),
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: RichText(
                    text: TextSpan(
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(text: 'Powered by '),
                          TextSpan(
                              text: 'momsstorenepal.com',
                              style: TextStyle(fontWeight: FontWeight.bold))
                        ]),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
