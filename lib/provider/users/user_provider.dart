import 'package:flutter/material.dart';
import '../../models/index.dart';

class UserProvider extends ChangeNotifier {
  User_bean_info _user;
  User_bean_info get user => _user;

  void setUser(User_bean_info user) {
    _user = user;
    notifyListeners();
  }
}