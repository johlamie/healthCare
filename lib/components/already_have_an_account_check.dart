import 'package:flutter/material.dart';
import 'package:healtcare/constants.dart';

class AlreadyHavreAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function press;
  const AlreadyHavreAnAccountCheck({
    Key key,
    this.login = true,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Vous n'avez pas de compte ? " : "Vous avez un compte ? ",
          style: TextStyle(color: kPrimaryColor),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "Inscrivez-vous" : "Connectez-vous",
            style: TextStyle(
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline),
          ),
        ),
      ],
    );
  }
}
