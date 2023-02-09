import 'dart:io';
import 'package:deep_waste/components/default_button.dart';
import 'package:deep_waste/constants/app_properties.dart';
import 'package:deep_waste/constants/size_config.dart';
import 'package:deep_waste/database_manager.dart';
import 'package:deep_waste/models/Item.dart';
import 'package:deep_waste/screens/HomeScreen.dart';
import 'package:deep_waste/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tflite/tflite.dart';

class DisplayPicture extends StatefulWidget {
  final File image;
  final List<Item> items;
  const DisplayPicture({Key key, this.image, this.items}) : super(key: key);
  @override
  _DisplayPictureState createState() => _DisplayPictureState(image: this.image);
}

class _DisplayPictureState extends State<DisplayPicture> {
  final File image;
  _DisplayPictureState({this.image});
  String prediction;
  String predictedResult;
  bool predicted = false;

  @override
  void initState() {
    super.initState();
    loadModel();
  }

  Future loadModel() async {
    Tflite.close();
    String absPathModelPath = "assets/models/garbage_model.tflite";
    String classLabel = "assets/labels/labels.txt";
    try {
      await Tflite.loadModel(model: absPathModelPath, labels: classLabel);
    } on PlatformException {
      print("Couldn't load model");
    }
  }

  Future updateItem(List<Item> items, String itemName) async {
    var matchedItem = items.firstWhere(
        (_item) => _item.name.toLowerCase() == itemName,
        orElse: () => null);
    matchedItem.count = matchedItem.count + 1;
    await DatabaseManager.instance.updateItem(matchedItem);
  }

  uploadImage(context) async {
    EasyLoading.show(status: 'Predicting...');
    var output = await Tflite.runModelOnImage(
        path: image.path,
        imageMean: 0.0, // defaults to 117.0
        imageStd: 255.0, // defaults to 1.0
        numResults: 1, // defaults to 5
        threshold: 0.2, // defaults to 0.1
        asynch: true);

    var result = output[0];
    EasyLoading.dismiss();
    var confidence = getNumber(result['confidence'], precision: 2);
    setState(() {
      predicted = true;
      prediction = "Predicted ${result['label']} with $confidence% confidence.";
      predictedResult = result['label'];
    });

    // showAlert(bContext: context, title: "Done!", content: "Predicted ${result['label']} with $confidence% confidence.");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          bottomOpacity: 0.0,
          elevation: 0.0,
        ),
        backgroundColor: white,
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(children: [
          Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: predicted
                  ? Container(
                      width: double.infinity,
                      margin:
                          EdgeInsets.only(top: getProportionateScreenWidth(5)),
                      padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(20),
                        vertical: getProportionateScreenWidth(15),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(3, 3), // changes position of shadow
                          ),
                          BoxShadow(
                            color: Colors.black,
                            offset: const Offset(0.0, 0.0),
                            blurRadius: 0.0,
                            spreadRadius: 0.0,
                          ),
                        ],
                      ),
                      child: Row(children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text.rich(TextSpan(
                                  style: TextStyle(color: Colors.black),
                                  children: [
                                    TextSpan(
                                        text: "$prediction\n",
                                        style: TextStyle(
                                          fontSize:
                                              getProportionateScreenWidth(16),
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ],
                                )),
                                Text.rich(TextSpan(
                                  text:
                                      "Put this item in the respective bin to earn coins. Click ♻️ to get rewards.",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          getProportionateScreenWidth(14)),
                                )),
                              ]),
                        ),
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () async {
                              await updateItem(widget.items, predictedResult);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()));
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image.asset('assets/images/recycle.png',
                                  height: 60, width: 120),
                            ),
                          ),
                        )
                      ]))
                  : null),
          SizedBox(height: getProportionateScreenHeight(30)),
          Container(
            width: getProportionateScreenWidth(280),
            height: getProportionateScreenHeight(280),
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(3, 3), // changes position of shadow
                  ),
                  BoxShadow(
                    color: Colors.black,
                    offset: const Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ),
                ],
                image: DecorationImage(
                    image: FileImage(image), // picked file
                    fit: BoxFit.fill)),
          ),
          Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20),
                  vertical: getProportionateScreenHeight(30)),
              child: !predicted
                  ? DefaultButton(
                      text: "Predict Waste",
                      press: () async {
                        uploadImage(context);
                        // validateAndSave();
                      },
                    )
                  : null)
        ]))));
  }
}
