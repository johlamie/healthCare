import 'package:flutter/material.dart';
import 'package:healtcare/Screens/Account/components/body.dart';
import 'package:healtcare/constants.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: blackColor,
          ),
          onPressed: () => Navigator.pop(context, false),
        ),
        backgroundColor: Colors.white,
        title: Text(
          "Informations",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Body(),
    );
  }
}
