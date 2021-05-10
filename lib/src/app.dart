import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LogIn',
      home: Scaffold(
        backgroundColor: Color(0xFFF53949),
        resizeToAvoidBottomInset: false,
        body: LoginScreen(),
      ),
    );
  }
}

