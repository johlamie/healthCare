import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:healtcare/Screens/Home/homePage.dart';
import 'package:healtcare/Screens/SignUp/signup_screen.dart';
import 'package:healtcare/Screens/login/components/background.dart';
import 'package:healtcare/components/already_have_an_account_check.dart';
import 'package:healtcare/components/rouded_button.dart';
import 'package:healtcare/components/rounded_input_field.dart';
import 'package:healtcare/components/rounded_password_field.dart';

import 'package:healtcare/components/userModel.dart';
import 'package:healtcare/components/userLoginService.dart';

class Body extends StatelessWidget {
  UserLoginService _userService = UserLoginService();
  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Email",
              onChanged: (value) {
                _email = value;
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                _password = value;
              },
            ),
            RoundedButton(
              text: "SE CONNECTER",
              press: () {
                _userService
                    .auth(
                  UserModel(
                    email: _email,
                    password: _password,
                  ),
                )
                    .then(
                  (value) {
                    if (value.uid != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                    }
                  },
                );
                /*
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return DisplayHealthData();
                    },
                  ),
                );*/
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHavreAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
