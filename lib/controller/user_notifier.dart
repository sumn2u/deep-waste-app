import 'package:deep_waste/models/User.dart';
import 'package:flutter/material.dart';

class UserNotifier extends ChangeNotifier {
  User user;

  addUser(title) {
    user = User(id: 1001, name: title);
    notifyListeners();
  }
}
