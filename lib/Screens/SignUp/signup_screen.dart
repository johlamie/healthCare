import 'package:flutter/material.dart';
import 'package:healtcare/Screens/SignUp/components/body.dart';
import 'package:healtcare/constants.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        title: Text(
          "S'INSCRIRE",
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
