# Deep Waste

An app that use [Deep Waste Model](https://www.kaggle.com/code/sumn2u/garbage-classification) to classify the waste. 

The REST API that is used in this app can be found [here](https://github.com/sumn2u/ml_rest_api). 

## Demo
![](Demo.gif)

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
This project is under development.

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
