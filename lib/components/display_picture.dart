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
// import 'package:tflite_v2/tflite.dart';

class DisplayPicture extends StatefulWidget {
  final File image;
  final List<Item> items;

  const DisplayPicture({
    Key? key,
    required this.image,
    required this.items,
  }) : super(key: key);

  @override
  State<DisplayPicture> createState() => _DisplayPictureState();
}

class _DisplayPictureState extends State<DisplayPicture> {
  String? prediction;
  String? predictedResult;
  bool predicted = false;

  @override
  void initState() {
    super.initState();
    loadModel();
  }

  Future<void> loadModel() async {
    // Tflite.close();
    const String modelPath = "assets/models/garbage_model.tflite";
    const String labelPath = "assets/labels/labels.txt";

    // try {
    //   await Tflite.loadModel(
    //     model: modelPath,
    //     labels: labelPath,
    //   );
    // } on PlatformException {
    //   debugPrint("Couldn't load model");
    // }
  }

  Future<void> updateItem(List<Item> items, String itemName) async {
    try {
      final matchedItem = items.firstWhere(
        (item) => item.name.toLowerCase() == itemName.toLowerCase(),
      );

      matchedItem.count++;
      await DatabaseManager.instance.updateItem(matchedItem);
    } catch (_) {
      debugPrint("Item not found: $itemName");
    }
  }

  Future<void> uploadImage(BuildContext context) async {
    EasyLoading.show(status: 'Predicting...');

    // final output = await Tflite.runModelOnImage(
    //   path: widget.image.path,
    //   imageMean: 0.0,
    //   imageStd: 255.0,
    //   numResults: 1,
    //   threshold: 0.2,
    //   asynch: true,
    // );

    // EasyLoading.dismiss();

    // if (output == null || output.isEmpty) return;

    // final result = output.first;

    // final confidence = getNumber(result['confidence'], precision: 2);

    // setState(() {
    //   predicted = true;
    //   predictedResult = result['label'];
    //   prediction =
    //       "Predicted ${result['label']} with ${(confidence * 100).toStringAsFixed(2)}% confidence.";
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
      ),
      backgroundColor: white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20),
                ),
                child: predicted
                    ? Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(
                          top: getProportionateScreenWidth(5),
                        ),
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
                              offset: const Offset(3, 3),
                            ),
                            const BoxShadow(
                              color: Colors.black,
                              offset: Offset.zero,
                            ),
                          ],
                        ),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    prediction ?? "",
                                    style: TextStyle(
                                      fontSize:
                                          getProportionateScreenWidth(16),
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    "Put this item in the respective bin to earn coins.\n\n"
                                    "For wrong predictions, help us improve by submitting waste images.",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          getProportionateScreenWidth(14),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: InkWell(
                                onTap: () async {
                                  if (predictedResult != null) {
                                    await updateItem(
                                      widget.items,
                                      predictedResult!,
                                    );
                                  }

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) =>  HomeScreen(),
                                    ),
                                  );
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    'assets/images/recycle.png',
                                    height: 60,
                                    width: 120,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
              SizedBox(height: getProportionateScreenHeight(30)),
              Container(
                width: getProportionateScreenWidth(280),
                height: getProportionateScreenHeight(280),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(3, 3),
                    ),
                    const BoxShadow(
                      color: Colors.black,
                      offset: Offset.zero,
                    ),
                  ],
                  image: DecorationImage(
                    image: FileImage(widget.image),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20),
                  vertical: getProportionateScreenHeight(30),
                ),
                child: !predicted
                    ? DefaultButton(
                        text: "Predict Waste",
                        press: () => uploadImage(context),
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}