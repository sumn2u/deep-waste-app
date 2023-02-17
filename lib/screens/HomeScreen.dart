import 'dart:io';
import 'package:deep_waste/components/alert.dart';
import 'package:deep_waste/components/categories.dart';
import 'package:deep_waste/components/display_picture.dart';
import 'package:deep_waste/components/history.dart';
import 'package:deep_waste/components/home_header.dart';
import 'package:deep_waste/components/progress.dart';
import 'package:deep_waste/constants/app_properties.dart';
import 'package:deep_waste/constants/size_config.dart';
import 'package:deep_waste/database_manager.dart';
import 'package:deep_waste/models/Item.dart';
import 'package:deep_waste/models/User.dart';
import 'package:deep_waste/screens/UserScreen.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home_screen";

  HomeScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File _image;
  List<Item> items = [];
  bool isLoading = false;
  User user;

  ImagePicker imagePicker = ImagePicker();
  _imageFromCamera() async {
    try {
      PickedFile capturedImage =
          await imagePicker.getImage(source: ImageSource.camera);
      final File imagePath = File(capturedImage.path);
      if (capturedImage == null) {
        showAlert(
            bContext: context,
            title: "Error choosing file",
            content: "No file was selected");
      } else {
        setState(() {
          _image = imagePath;
        });
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DisplayPicture(image: _image, items: items)));
      }
    } catch (e) {
      showAlert(
          bContext: context, title: "Error capturing image file", content: e);
    }
  }

  _imageFromGallery() async {
    PickedFile uploadedImage =
        await imagePicker.getImage(source: ImageSource.gallery);
    final File imagePath = File(uploadedImage.path);

    if (uploadedImage == null) {
      showAlert(
          bContext: context,
          title: "Error choosing file",
          content: "No file was selected");
    } else {
      setState(() {
        _image = imagePath;
      });
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  DisplayPicture(image: _image, items: items)));
    }
  }

  @override
  void initState() {
    super.initState();
    getItems();
    getUserInfo();
  }
  
  Future getUserInfo() async {
    setState(() => isLoading = true);
    user = await DatabaseManager.instance.getUser();
    setState(() => isLoading = false);
  }

  Future getItems() async {
    setState(() => isLoading = true);
    items = await DatabaseManager.instance.getItems();
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: white,
      floatingActionButton: FabCircularMenu(
          ringDiameter:  getProportionateScreenWidth(130.0),
          ringColor: Color(0xff69c0dc),
          ringWidth: getProportionateScreenWidth(40.0),
          fabSize: getProportionateScreenWidth(44.0),
          fabElevation: getProportionateScreenWidth(8.0),
          fabCloseIcon: Icon(
            Icons.close,
          ),
          fabOpenIcon: Icon(
            Icons.photo,
          ),
          children: <Widget>[
            IconButton(
                icon: Icon(Icons.camera_alt_outlined),
                onPressed: () async {
                  if(user == null){
                    Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => UserScreen()));
                  }else{
                  _imageFromCamera();
                  }
                }),
            IconButton(
                icon: Icon(Icons.folder),
                onPressed: () async {
                  if(user == null){
                    Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => UserScreen()));
                  }else{
                  _imageFromGallery();
                  }
                })
          ]),
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(children: [
        HomeHeader(user: user),
        SizedBox(height: getProportionateScreenHeight(15)),
        Categories(),
        SizedBox(height: getProportionateScreenHeight(20)),
        Progress(items: items),
        SizedBox(height: getProportionateScreenHeight(20)),
        History(),
        SizedBox(width: getProportionateScreenWidth(20)),
      ]))),
    );
  }
}
