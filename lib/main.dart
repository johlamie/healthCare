import 'package:flutter/material.dart';
import 'package:healtcare/Screens/Welcome/welcome_screen.dart';
import 'package:healtcare/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Auth',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white
      ),
      home: WelcomeScreen(),
    );
  }
}

