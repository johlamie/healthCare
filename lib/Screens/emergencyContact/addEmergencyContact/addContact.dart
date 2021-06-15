import 'package:flutter/material.dart';
import 'package:healtcare/constants.dart';

class AddContact extends StatelessWidget {
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
          "Nouveau Contact",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
