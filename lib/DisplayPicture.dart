import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'alert.dart';

class DisplayPicture extends StatelessWidget {
  DisplayPicture({Key key, this.image, this.context}) : super(key: key);
  final File image;
  final BuildContext context;

  uploadImage() async {
    EasyLoading.show(status: 'Predicting...');
    String fileName = image.path.split('/').last;
    FormData data = FormData.fromMap({
      "file": await MultipartFile.fromFile(
        image.path,
        filename: fileName
      ),
      "classifiers": "['cardboard', 'glass', 'metal', 'paper', 'plastic', 'trash']"
    });
    Dio dio = new Dio();
    try {
      var res = await dio.post('http://167.86.119.145:8888/api/model/predict', data: data);
      EasyLoading.dismiss();
      if (res.statusCode != 200) {
          showAlert(
              bContext: context,
              title: "Error Uploading!",
              content: "Server Side Error.");
        } else {
          var result = jsonDecode(res.toString());
          showAlert(bContext: context, title: "Done!", content: "Predicted ${result['label']} with ${result['prediction']}% confidence.");
        }
        } on DioError catch (e) { 
          EasyLoading.dismiss();
          if (e.type == DioErrorType.RESPONSE) {
              print(e.response);
            return;
          }
          print('error: $e');
      }
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
                    onPressed: () => {uploadImage()},
                  ),
                )
              ],
            ))));
  }
}
