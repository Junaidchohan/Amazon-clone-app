import 'dart:convert';

import 'package:flutter/material.dart'; // Needed for ChangeNotifier
import 'package:amazon_clone_app/models/user.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
    id: '',
    name: '',
    email: '',
    password: '',
    address: '',
    type: '',
    token: '',
  );

  User get user => _user;

  void setUser(String user) {
    final userMap = jsonDecode(user); // decode JSON string to Map
    _user = User.fromJson(userMap); // create User from Map
    notifyListeners();
  }
}
