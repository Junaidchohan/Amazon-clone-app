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

  // void setUser(String user) {
  //   final userMap = jsonDecode(user); // decode JSON string to Map
  //   _user = User.fromJson(userMap);
  //    // create User from Map
  //   notifyListeners();
  // }

  void setUser(String user) {
    try {
      final userMap = jsonDecode(user);
      _user = User.fromJson(userMap);
      // print("User loaded: $_user"); // ✅ Debug
      notifyListeners();
    } catch (e) {
      // print("Failed to load user: $e"); // 🔥 Catch the real error
    }
  }
}
