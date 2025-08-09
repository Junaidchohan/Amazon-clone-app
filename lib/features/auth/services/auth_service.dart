// this file is working for connect frontend and backend
import 'dart:convert';

import 'package:amazon_clone_app/common/widgets/bottom_bar.dart';
import 'package:amazon_clone_app/constants/error_handling.dart';
import 'package:amazon_clone_app/constants/global_variables.dart';
import 'package:amazon_clone_app/constants/utils.dart';
import 'package:amazon_clone_app/models/user.dart';
import 'package:amazon_clone_app/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  // Sign Up User
  void signUpUser({
    required BuildContext context,
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      User user = User(
        id: '',
        name: "Junaid",
        email: email,
        password: password,
        address: '',
        token: '',
        type: '',
        cart: [],
      );
      http.Response res = await http.post(
        // Uri.parse('$uri/api/signup'),
        Uri.parse('$uri/api/signup'),
        body: jsonEncode(user.toMap()),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      // Avoid direct context usage after async

      if (context.mounted) {
        httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(
              context,
              'Account created! Login with the same credentials',
            );
          },
        );
      }
    } catch (e) {
      if (context.mounted) {
        showSnackBar(context, e.toString());
      }
    }
  }

  // Sign In User
  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/signin'),

        body: jsonEncode({"email": email, "password": password}),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      // Avoid direct context usage after async

      if (context.mounted) {
        httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            if (!context.mounted) return;
            Provider.of<UserProvider>(context, listen: false).setUser(res.body);
            await prefs.setString(
              'x-auth-token',
              jsonDecode(res.body)['token'],
            );
            if (!context.mounted) return;
            Navigator.pushNamedAndRemoveUntil(
              context,
              BottomBar.routName,
              (route) => false,
            );
          },
        );
      }
    } catch (e) {
      if (context.mounted) {
        showSnackBar(context, e.toString());
      }
    }
  }

  // Get User Data
  Future<void> getUserData(BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');
      if (token == null) {
        prefs.setString('x-auth-token', '');
      }

      var tokenRes = await http.post(
        Uri.parse('$uri/tokenIsValid'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token!,
        },
      );

      var responce = jsonDecode(tokenRes.body);
      if (responce == true) {
        // get the user data
        http.Response userRes = await http.get(
          Uri.parse('$uri/api/user'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token,
          },
        );

        if (context.mounted) {
          final userMap = jsonDecode(
            userRes.body,
          ); // Convert JSON string to map
          userMap['token'] = token; // Inject token into user map

          Provider.of<UserProvider>(
            context,
            listen: false,
          ).setUser(jsonEncode(userMap)); // Encode back to JSON string
        }
      }
    } catch (e) {
      debugPrint("Error in getUserData(): $e"); // Log it instead
      // Don't use showSnackBar here; context not ready in main.dart
    }
  }
}
