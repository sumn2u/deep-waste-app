// import 'package:deep_waste/screens/OnboardingScreen.dart';
import 'package:deep_waste/controller/category_notifier.dart';
import 'package:deep_waste/controller/item_notifier.dart';
import 'package:deep_waste/controller/reward_notifier.dart';
import 'package:deep_waste/controller/user_notifier.dart';
import 'package:provider/provider.dart';
import 'package:deep_waste/routes.dart';
import 'package:deep_waste/screens/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CategoryNotifier()),
          ChangeNotifierProvider(create: (_) => ItemNotifier()),
          ChangeNotifierProvider(create: (_) => RewardNotifier()),
          ChangeNotifierProvider(create: (_) => UserNotifier()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Deep Waste',
          theme: ThemeData(
            brightness: Brightness.light,
            canvasColor: Colors.transparent,
            primarySwatch: Colors.blue,
            fontFamily: "Montserrat",
          ),
          builder: EasyLoading.init(),
          initialRoute: SplashScreen.routeName,
          routes: routes,
        ));
  }
}
