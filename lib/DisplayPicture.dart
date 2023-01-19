import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tflite/tflite.dart';
import 'alert.dart';

class DisplayPicture extends StatefulWidget {
  final File image;
  const DisplayPicture({Key key,  @required this.image }) : super(key: key);

  @override
  _DisplayPictureState createState() => _DisplayPictureState(image: this.image);
}

class _DisplayPictureState extends State <DisplayPicture> {
  final File image;
  _DisplayPictureState({this.image});
  String prediction;

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
      await Tflite.loadModel(
      model: absPathModelPath,
      labels: classLabel
    );
    } on PlatformException {
      print("Couldn't load model");
    }
  }
  double getNumber(double input, {int precision = 2}){
    return double.parse('$input'.substring(0, '$input'.indexOf('.') + precision + 1));
  }
  uploadImage(context) async {
    EasyLoading.show(status: 'Predicting...');
    var output = await Tflite.runModelOnImage(
      path: image.path,
      imageMean: 0.0,   // defaults to 117.0
      imageStd: 255.0,  // defaults to 1.0
      numResults: 1,    // defaults to 5
      threshold: 0.2,   // defaults to 0.1
      asynch: true  
    );

    var result = output[0];
    EasyLoading.dismiss();
    var confidence = getNumber(result['confidence'], precision: 2);
    showAlert(bContext: context, title: "Done!", content: "Predicted ${result['label']} with $confidence% confidence.");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Color.fromRGBO(46, 25, 96, 1),
              Color.fromRGBO(93, 16, 73, 1)
            ])),
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
            ),
            backgroundColor: Colors.transparent,
            body: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: MediaQuery.of(context).size.width / 3,
                  backgroundImage: FileImage(image),
                  backgroundColor: Colors.transparent,
                ),
                Padding(
                  padding: EdgeInsets.all(30),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(0, 0, 0, 0.1),
                      padding:
                          EdgeInsets.symmetric(vertical: 30, horizontal: 40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    child: Text(
                      "Upload Image",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    onPressed: () => {uploadImage(context)},
                  ),
                )
              ],
            ))));
  }
}
