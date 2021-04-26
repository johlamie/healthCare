import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:healtcare/Screens/SignUp/components/background.dart';
import 'package:healtcare/Screens/login/login_screen.dart';
import 'package:healtcare/components/already_have_an_account_check.dart';
import 'package:healtcare/components/rouded_button.dart';
import 'package:healtcare/components/rounded_input_field.dart';
import 'package:healtcare/components/rounded_password_field.dart';

class Body extends StatelessWidget {
  @override
  final Widget child;

  const Body({
    Key key,
    @required this.child,
  }) : super(key: key);
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Backgroud(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "S'INSCRIRE",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          SvgPicture.asset(
            "assets/icons/signup.svg",
            height: size.height * 0.35,
          ),
          RoundedInputField(
            hintText: "Votre e-mail",
            onChanged: (value) {},
          ),
          RoundedPasswordField(
            onChanged: (value) {},
          ),
          RoundedButton(
            text: "S'INSCRIRE",
            press: () {},
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          AlreadyHavreAnAccountCheck(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
                  },
                ),
              );
            },
          ),
          OrDivider()
        ],
      ),
    );
  }
}

class OrDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
