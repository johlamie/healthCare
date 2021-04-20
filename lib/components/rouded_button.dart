import 'package:flutter/material.dart';
import 'package:healtcare/constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  const RoundedButton({
    Key key,
    this.text,
    this.press,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.6,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: TextButton(
            onPressed: press,
            style: TextButton.styleFrom(
                backgroundColor: color,
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                alignment: Alignment.center),
            child: Text(
              text,
              style: TextStyle(color: textColor),
            )),
      ),
    );
  }
}
