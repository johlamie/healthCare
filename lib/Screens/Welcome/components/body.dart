import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; // Donne height et width de l'écran
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
              child: Image.asset(
                "assets/images/main_top.png", width: size.width * 0.3,
              ),
          ),
          Positioned(
            bottom: 0,
              left: 0,
              child: Image.asset(
                "assets/images/main_bottom.png", width: size.width * 0.2,
              ),
          ),
          Text("Bienvenue")
        ],
      ),
    );
  }
}
