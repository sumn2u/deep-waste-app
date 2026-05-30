import 'package:deep_waste/constants/app_properties.dart';
import 'package:deep_waste/database_manager.dart';
import 'package:deep_waste/models/User.dart';
import 'package:deep_waste/screens/HomeScreen.dart';
import 'package:deep_waste/screens/OnboardingScreen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "/splash_screen";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> opacity;

  User? user;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    _initUser();

    controller = AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    );

    opacity = Tween<double>(begin: 1.0, end: 0.0).animate(controller)
      ..addListener(() {
        if (mounted) setState(() {});
      });

    controller.forward().then((_) {
      navigationPage();
    });
  }

  Future<void> _initUser() async {
    setState(() => isLoading = true);

    user = await DatabaseManager.instance.getUser();

    if (mounted) {
      setState(() => isLoading = false);
    }
  }

  void navigationPage() {
    if (!mounted) return;

    final Widget nextPage =
        (!isLoading && user != null) ?  HomeScreen() :  OnboardingScreen();

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => nextPage),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(color: transparentGreen),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: <Widget>[
                Expanded(
                  child: Opacity(
                    opacity: opacity.value,
                    child: Image.asset('assets/images/logo.png'),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(30),
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(text: 'Powered by '),
                        TextSpan(
                          text: 'dwaste.live',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
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