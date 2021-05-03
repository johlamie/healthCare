import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:healtcare/Screens/SignUp/components/background.dart';
import 'package:healtcare/Screens/SignUp/components/or_divider.dart';
import 'package:healtcare/Screens/SignUp/components/social_icons.dart';
import 'package:healtcare/Screens/login/login_screen.dart';
import 'package:healtcare/components/already_have_an_account_check.dart';
import 'package:healtcare/components/rouded_button.dart';
import 'package:healtcare/components/rounded_input_field.dart';
import 'package:healtcare/components/rounded_password_field.dart';
import 'package:healtcare/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // FirebaseAuth auth = FirebaseAuth.instance;

    return Backgroud(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            /*
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.35,
            ),*/
            SizedBox(
              height: size.height * 0.08,
            ),
            RoundedInputField(
              hintText: "Nom",
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "Prénom",
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "Votre e-mail",
              icon: Icons.mail,
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
              height: size.height * 0.01,
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
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocialIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {},
                ),
                SocialIcon(
                  iconSrc: "assets/icons/twitter.svg",
                  press: () {},
                ),
                SocialIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
