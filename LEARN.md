# Deep Waste
Deep Waste is an app that use [waste classification machine learning model](https://colab.research.google.com/drive/1yWqc8TRS0I21RdfHLPRTQIs37ANOx-Uq) to classify the waste and manage it effectively. It a standalone app and works without internet.

<img alt="Instructions"  src="./app_banner.png">

## Background
Waste identification is a crucial step in the waste management process that enables facilities to properly handle, recycle, and reduce their waste, while also ensuring compliance with regulations and tracking their progress over time. The integration of machine learning models with mobile devices can enhance the precision, ease, and effectiveness of waste management endeavors, as well as furnish valuable information for monitoring and decreasing waste.

In this app,  we have prepared a substantial collection of waste images and trained a machine learning model. The trained model is then installed on a mobile device, enabling real-time waste identification. By simply capturing an image of the waste with their mobile device, users can receive an instant classification of the waste into categories such as paper, plastic, glass, metal, and more, via the machine learning model.
With this approach, one can have many advantages such as:
- Convenience: By using mobile devices, waste identification can be performed anywhere, at any time, making it more accessible and convenient for users.
- Increased Accuracy: Machine learning models are trained on large datasets, which can result in improved accuracy compared to manual waste classification.
- Real-time Feedback: By using a mobile device, users receive instant feedback on the type of waste they are dealing with, allowing them to make informed decisions on how to properly manage the waste.
- Data Collection: The data collected through mobile waste identification can be used to track waste generation and management efforts over time, helping to identify areas for improvement and set new waste reduction goals.

## Features 
Here are some of its features:

📸 Snap or upload a picture of a waste <br>
📱 Install the app on your phone for easy access <br>
♻️ Learn how to recycle effectively using AI <br>
🥤 Keep track of how many waste items you've recycled<br>
🏆 Get rewarded for each managed waste <br>
🌍 Help to make our earth cleaner <br>
✨...and much more to come - all for free & no sign in needed!<br>

## How it is built?
The detailed process of making this is described [here](https://medium.com/@sumn2u/deep-learning-approach-to-manage-household-waste-via-mobile-app-4186292b266b) and the research paper to support it at [here](https://www.preprints.org/manuscript/202304.0066/v1).

## How is it used?

After training the AI model, we export it to TensorFlow Lite for mobile device compatibility. Using the app, users take or upload a picture of their waste, which the model then analyzes and provides suggestions for waste management. When users successfully manage their waste, they receive rewards. To enhance the accuracy of the system, users can submit incorrect predictions and specify the type of waste.
## Data sources and AI methods
[Torch](https://pytorch.org) and [Keras](https://keras.io/api/applications/#mobilenet) provide the pre-trained models [DenseNet121](https://keras.io/api/applications/densenet/#densenet121-function) and [MobileNet](https://keras.io/api/applications/mobilenet/), respectively, which we utilize for our image recognition models. These models were initially trained on ImageNet. We then fine-tuned MobileNet using the [TrashNet data collection](https://github.com/garythung/trashnet) to classify garbage material.
Then resutlant model are then converted into `tflite` file, making it accessible for processing in mobile devices

## Challenges
This project classifies most of the waste but for some, it's still a problem. These images whose accuracy is less than 45 or with wrong prediction needs to be find into the model so that machine can learn from it. Besides that, some of the devices has problem running the model resulting crashing the whole application.

## What next?
The plan is to add a way to support internationlization. The language support will help to reach more people and lessen the boundries. 
## Demo
[![Deep Waste](https://img.youtube.com/vi/9hKCymDleco/0.jpg)](https://www.youtube.com/watch?v=9hKCymDleco "Deep Waste")


