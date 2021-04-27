import 'package:flutter/material.dart';
import 'package:healtcare/Screens/login/components/body.dart';
import 'package:healtcare/constants.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        title: Text(
          "LOGIN",
          style: TextStyle(fontWeight: FontWeight.bold, color: blackColor),
        ),
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: blackColor,
          ),
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      body: Body(),
    );
  }
}
