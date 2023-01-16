import 'dart:io';
import 'alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'DisplayPicture.dart';

import 'package:image_picker/image_picker.dart';

class AddImage extends StatefulWidget {
  AddImage({Key key}) : super(key: key);
  @override
  _AddImageState createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  File _image;
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
                builder: (context) => DisplayPicture(
                      image: _image,
                      context: context,
                    )));
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
              builder: (context) => DisplayPicture(
                    image: _image,
                    context: context,
                  )));
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(0, 0, 0, 0.1),
                        padding:
                            EdgeInsets.symmetric(vertical: 40, horizontal: 60),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      child: Column(children: [
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Icon(
                            Icons.camera_alt_outlined,
                            size: 60,
                          ),
                        ),
                        Text(
                          "Take Picture",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                          ),
                        )
                      ]),
                      onPressed: () => {
                        _imageFromCamera(),
                      },
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(0, 0, 0, 0.1),
                        padding:
                            EdgeInsets.symmetric(vertical: 40, horizontal: 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      child: Column(children: [
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Icon(
                            Icons.photo_library_outlined,
                            size: 60,
                          ),
                        ),
                        Text(
                          "Upload Picture",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                          ),
                        )
                      ]),
                      onPressed: () => {
                        _imageFromGallery(),
                      },
                    ),
                  ]),
            )));
  }
}
