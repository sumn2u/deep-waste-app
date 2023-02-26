# Deep Waste

An app that use [machine learning model](https://www.kaggle.com/code/sumn2u/garbage-classification) to classify the waste and manage it effectively. It a standalone app and works without internet.

<img alt="Instructions"  src="./app_banner.png">

# Background
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

<a href="https://www.producthunt.com/posts/deep-waste?utm_source=badge-featured&utm_medium=badge&utm_souce=badge-deep&#0045;waste" target="_blank"><img src="https://api.producthunt.com/widgets/embed-image/v1/featured.svg?post_id=379129&theme=neutral" alt="Deep&#0032;Waste - Making&#0032;waste&#0032;management&#0032;fun&#0032;and&#0032;easy&#0032;&#0032; | Product Hunt" style="width: 250px; height: 54px;" width="250" height="54" /></a>

## Demo
[![Deep Waste](https://img.youtube.com/vi/9hKCymDleco/0.jpg)](https://www.youtube.com/watch?v=9hKCymDleco "Deep Waste")

## Available on 
[Google Play](https://play.google.com/store/apps/details?id=com.hai.deep_waste)
# Getting started
1. Install Flutter. See https://flutter.io/setup/

2.  and clone this repository.
3. Move to `deep-waste-app` directory.
4. Run `flutter run` command.

# Structure
The main classes are under `lib` directory.

directory | description

    lib
    ├── ...
    ├── components                   # reusable components
    ├── constants                    # constants used in project
    ├── models                     # data structure to define the shape of data
    ├── screens                    # different view used in the app
    ├── controller                    # an intermidiate between view and model responsible for updating model and manupluates the view of the app    
    ├── test                    # Test files (alternatively `spec` or `tests`)
    └── routes.dart             # maps urls for navigation
    └── ...



# Contributing

Contributions are always welcome. Feel free to report Issue or send Pull Request.

# License
```
Copyright 2023 Suman Kunwar

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
