import 'dart:io';

import 'package:flutter/material.dart';
import 'package:healtcare/Screens/Welcome/components/background.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; // Donne height et width de l'écran
    return Background(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "BIENVENUE DANS HEALTHCARE",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: size.height * 0.05),
        SvgPicture.asset(
          "assets/icons/chat.svg",
          height: size.height * 0.45,
        ),
        SizedBox(height: size.height * 0.05),
      ],
    ));
  }
}
