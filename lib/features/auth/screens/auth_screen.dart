import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  static const String routName = '/auth_screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    Navigator.pushNamed(context, "");
    return const Scaffold();
  }
}
