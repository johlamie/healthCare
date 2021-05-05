import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healtcare/Screens/Welcome/welcome_screen.dart';
import 'package:healtcare/Screens/displayHealthData/display_health_data.dart';
import 'package:healtcare/components/userService.dart';
import 'package:healtcare/constants.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  UserService _userService = UserService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Auth',
      theme: ThemeData(
          primaryColor: kPrimaryColor, scaffoldBackgroundColor: Colors.white),
      home: StreamBuilder(
        stream: _userService.user,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return DisplayHealthData();
            }
            return WelcomeScreen();
          }
          return SafeArea(
            // TODO : Page de chargement d'application
            child: Scaffold(
              body: Center(
                child: Text("CHARGEMENT DE L'APPLICATION..."),
              ),
            ),
          );
        },
      ),
    );
  }
}
