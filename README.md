# Deep Waste: Scan, identify, learn, manage, and earn rewards.

[![Build Status](https://app.travis-ci.com/sumn2u/deep-waste-app.svg?branch=master)](https://app.travis-ci.com/sumn2u/deep-waste-app)
[![License](https://img.shields.io/badge/License-BSD_3--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)




D.Waste is as an open source AI-powered app that enables users to identify the type of waste they are trying to dispose of and provides guidance on how to do so correctly. The app offers a rewards program to incentivise proper waste management, and users can earn points for correctly identifying and disposing of waste.
The app also provides educational resources on waste management and tracks the user's progress over time. Deep Waste is currently available on [App Store](https://apps.apple.com/us/app/deep-waste-ai/id6445863514?platform=iphone) the and [Google Play Store](https://play.google.com/store/apps/details?id=com.hai.deep_waste).


![D.Waste App](./app_banner.png)

## Background
Waste identification is a crucial step in the waste management process that enables facilities to properly handle, recycle, and reduce their waste, while also ensuring compliance with regulations and tracking their progress over time. The integration of machine learning models with mobile devices can enhance the precision, ease, and effectiveness of waste management endeavors, as well as furnish valuable information for monitoring and decreasing waste.

In this app,  we have prepared a substantial collection of waste images and trained a machine learning model. The trained model is then installed on a mobile device, enabling real-time waste identification. By simply capturing an image of the waste with their mobile device, users can receive an instant classification of the waste into categories such as paper, plastic, glass, metal, and more, via the machine learning model.
With this approach, one can have many advantages such as:
- **Convenience**: By using mobile devices, waste identification can be performed anywhere, at any time, making it more accessible and convenient for users.
- **Increased Accuracy**: Machine learning models are trained on large datasets, which can result in improved accuracy compared to manual waste classification.
- **Real-time Feedback**: By using a mobile device, users receive instant feedback on the type of waste they are dealing with, allowing them to make informed decisions on how to properly manage the waste.
- **Data Collection**: The data collected through mobile waste identification can be used to track waste generation and management efforts over time, helping to identify areas for improvement and set new waste reduction goals.

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

## How is it used?

After training the AI model, we export it to TensorFlow Lite for mobile device compatibility. Using the app, users take or upload a picture of their waste, which the model then analyzes and provides suggestions for waste management. When users successfully manage their waste, they receive rewards. To enhance the accuracy of the system, users can submit incorrect predictions and specify the type of waste.

## Research papers

Several research papers have been published to support this research. Here are a few of them:

- [Deep Learning in Waste Management: A Brief Survey](https://www.preprints.org/manuscript/202407.0637/v1)
- [Managing Household Waste Through Transfer Learning](https://tecnoscientifica.com/journal/idwm/article/view/408)
- [MWaste: An app that uses deep learning to manage household waste](https://www.aimspress.com/article/doi/10.3934/ctr.2023008)


## Data sources 

We have created our own waste dataset to support the app which can be found in [Kaggle](https://www.kaggle.com/datasets/sumn2u/garbage-classification-v2/). These dataset consists of waste images grouped into 10 classes (**metal**, **glass**, **biological**, **paper**, **battery**, **trash**, **cardboard**, **shoes**, **clothes**, and **plastic**). It is collected from various internet sources and through the app, labeled and manually verified. Data preprocessing activities including data cleaning, resizing, normalization, and file format handling were performed.

![Waste Dataset](./dataset.png)


## Challenges
This project classifies most of the waste but for some, it's still a problem. These images whose accuracy is less than 45 or with wrong prediction needs to be find into the model so that machine can learn from it. Besides that, some of the devices has problem running the model resulting crashing the whole application.

## REST API?
The REST API of the deep waste model can be found [here](https://github.com/sumn2u/deep-waste-rest-api).

## What next?
The plan is to add a way to support internationlization. The language support will help to reach more people and lessen the boundries. 
## Demo
[![Deep Waste](https://img.youtube.com/vi/9hKCymDleco/0.jpg)](https://www.youtube.com/watch?v=9hKCymDleco "Deep Waste")

## Available on 
[Google Play](https://play.google.com/store/apps/details?id=com.hai.deep_waste)

[App Store](https://apps.apple.com/app/deep-waste-ai/id6445863514?platform=iphone)

## Getting Started

1. **Install Flutter:** Follow the instructions at [flutter.io/setup](https://flutter.io/setup/).
2. **Clone this repository.**
3. **Navigate to the `deep-waste-app` directory.**
4. **Run the application:** Execute the command `flutter run`.


## Structure
The main classes are under `lib` directory.

directory | description

    assets
    ├── models
    # waste classification model
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



## Contributing

Contributions are always welcome. Feel free to report Issue or send Pull Request.

## Acknowledgments

We extend our heartfelt thanks to all the users and contributors who provided invaluable feedback and suggestions. Your insights and the images you shared have been instrumental in enhancing our model. Thank you for your support and collaboration in making this project better.

## License
```
BSD 3-Clause License

Copyright (c) 2023, Suman Kunwar

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its
   contributors may be used to endorse or promote products derived from
   this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
```
Feel free to reach out to us at sumn2u (at) gmail.com, to Suman directly if you have any questions or feedback! Hope you find this useful 💜
