import 'dart:io';
import 'dart:typed_data';
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
import 'package:image/image.dart' as img; // Used to decode and resize the file
import 'package:tflite_flutter/tflite_flutter.dart';

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

  Interpreter? _interpreter;
  List<String> _labels = [];
  
  // Adjust these to match your specific garbage collection model input constraints
  static const int _inputImageSize = 224; 

  @override
  void initState() {
    super.initState();
    loadModel();
  }

  @override
  void dispose() {
    _interpreter?.close(); // Free native memory safely
    super.dispose();
  }

  Future<void> loadModel() async {
    const String modelPath = "assets/models/garbage_model.tflite";
    const String labelPath = "assets/labels/labels.txt";

    try {
      // 1. Initialize the native interpreter
      _interpreter = await Interpreter.fromAsset(modelPath);
      
      // 2. Read and parse plain-text line-by-line classification labels
      final labelData = await rootBundle.loadString(labelPath);
      _labels = labelData.split('\n').map((e) => e.trim()).where((e) => e.isNotEmpty).toList();
      
      debugPrint("Model and labels loaded successfully.");
    } catch (e) {
      debugPrint("Error initializing tflite_flutter: $e");
    }
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
    if (_interpreter == null || _labels.isEmpty) {
      EasyLoading.showError('Model not ready yet.');
      return;
    }

    EasyLoading.show(status: 'Predicting...');

    try {
      // 1. Offload image loading and scaling to a separate thread execution boundary
      final Uint8List imageBytes = await widget.image.readAsBytes();
      final img.Image? originalImage = img.decodeImage(imageBytes);

      if (originalImage == null) {
        EasyLoading.dismiss();
        return;
      }

      // 2. Resize to what the CNN input layer expects (typically 224x224)
      final img.Image resizedImage = img.copyResize(
        originalImage, 
        width: _inputImageSize, 
        height: _inputImageSize
      );

      // 3. Construct a Float32 matrix array matching [1, Height, Width, Channels]
      // Float32 is required for normalized inputs (values mapped between 0.0 and 1.0)
      var inputTensor = List.generate(
        1,
        (_) => List.generate(
          _inputImageSize,
          (_) => List.generate(
            _inputImageSize,
            (_) => List.filled(3, 0.0),
          ),
        ),
      );

      // Populate tensor array with RGB components divided by 255.0 to normalize
      for (int y = 0; y < _inputImageSize; y++) {
        for (int x = 0; x < _inputImageSize; x++) {
          final pixel = resizedImage.getPixel(x, y);
          inputTensor[0][y][x][0] = pixel.r / 255.0; // Red
          inputTensor[0][y][x][1] = pixel.g / 255.0; // Green
          inputTensor[0][y][x][2] = pixel.b / 255.0; // Blue
        }
      }

      // 4. Formulate the explicit multi-dimensional layout container for results
      // E.g., if you have 6 classes, this prepares a shape matrix structure of [1, 6]
      var outputTensor = List.generate(1, (_) => List.filled(_labels.length, 0.0));

      // 5. Run the native inference execution engine pass
      _interpreter!.run(inputTensor, outputTensor);

      // 6. Find the element index returning the highest distribution probability score
      List<double> probabilities = outputTensor.first.cast<double>();
      double maxProbability = -1.0;
      int highestConfidenceIndex = 0;

      for (int i = 0; i < probabilities.length; i++) {
        if (probabilities[i] > maxProbability) {
          maxProbability = probabilities[i];
          highestConfidenceIndex = i;
        }
      }

      EasyLoading.dismiss();

      // Check if threshold parameter passes minimum confidence ceiling requirements
      if (maxProbability < 0.2) {
        setState(() {
          predicted = true;
          predictedResult = "Unknown";
          prediction = "Could not confidently identify waste item.";
        });
        return;
      }

      final String finalLabel = _labels[highestConfidenceIndex];
      final double confidence = getNumber(maxProbability, precision: 2);

      setState(() {
        predicted = true;
        predictedResult = finalLabel;
        prediction =
            "Predicted $finalLabel with ${(confidence * 100).toStringAsFixed(2)}% confidence.";
      });

    } catch (e) {
      EasyLoading.dismiss();
      debugPrint("Inference failed: $e");
      EasyLoading.showError('Prediction failed.');
    }
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

                                  if (!mounted) return;
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => HomeScreen(),
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