import 'package:deep_waste/components/profile_menu.dart';
import 'package:deep_waste/constants/app_properties.dart';
import 'package:deep_waste/database_manager.dart';
import 'package:deep_waste/models/User.dart';
import 'package:deep_waste/screens/HomeScreen.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatefulWidget {
  static String routeName = "/settings_screen";
  final User user;

  const SettingsScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsState();
}

class _SettingsState extends State<SettingsScreen> {
  final String loremEpsum = 'This is great product ...';

  late ExpandableController controller;

  @override
  void initState() {
    super.initState();
    controller = ExpandableController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> removeUser(int userId) async {
    await DatabaseManager.instance.deleteUser(userId);
  }

  Future<void> _openUrl(String url) async {
    final uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint("Could not launch $url");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0.0,
      ),
      backgroundColor: white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            ProfileMenu(
              text: "Help Center",
              icon: "assets/icons/Question mark.svg",
              press: () async {
                await _openUrl("http://m.me/momsstorenepal");
              },
            ),
            ProfileMenu(
              text: "Leaderboard",
              icon: "assets/icons/leaderboard.svg",
              press: () async {
                await _openUrl(
                    "https://momsstorenepal.com/leaderboard.html");
              },
            ),
            ProfileMenu(
              text: "Delete Account",
              icon: "assets/icons/Log out.svg",
              press: () async {
                await removeUser(widget.user.id);

                if (!mounted) return;

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) =>  HomeScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}