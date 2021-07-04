import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:healtcare/Screens/SignUp/components/background.dart';
import 'package:healtcare/Screens/SignUp/components/or_divider.dart';
import 'package:healtcare/Screens/SignUp/components/social_icons.dart';
import 'package:healtcare/Screens/displayHealthData/display_health_data.dart';
import 'package:healtcare/Screens/login/login_screen.dart';
import 'package:healtcare/components/already_have_an_account_check.dart';
import 'package:healtcare/components/rouded_button.dart';
import 'package:healtcare/components/rounded_input_field.dart';
import 'package:healtcare/components/rounded_password_field.dart';
import 'package:healtcare/components/services/database.dart';
import 'package:healtcare/components/userModel.dart';
import 'package:healtcare/components/userRegistrationService.dart';
import 'package:healtcare/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

class Body extends StatelessWidget {
  UserRegistrationService _userRegistrationService = UserRegistrationService();
  String _email;
  String _password;
  String _nom;
  String _prenom;
  bool _success;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Backgroud(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            /*
            SvgPicture.asset(
              "img",
              height: size.height * 0.35,
            ),*/
            SizedBox(
              height: size.height * 0.15,
            ),
            /*
            RoundedInputField(
              hintText: "Nom",
              onChanged: (value) {
                _nom = value;
              },
            ),
            RoundedInputField(
              hintText: "Prénom",
              onChanged: (value) {
                _prenom = value;
              },
            ),*/
            RoundedInputField(
              hintText: "e-mail",
              icon: Icons.mail,
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
              text: "S'INSCRIRE",
              press: () {
                _userRegistrationService
                    .auth(
                  UserModel(
                    email: _email,
                    password: _password,
                  ),
                )
                    .then((value) {
                  if (value.uid != null) {
                    int iamneighbor = 0;
                    DataBaseService(uid: value.uid)
                        .saveAttackValue(iamneighbor, "", 0, 0, 0);
                    DataBaseService(uid: value.uid).saveUser("", "", "", "");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  }
                });
                /*Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return DisplayHealthData();
                    },
                  ),
                );*/
              },
            ),
            SizedBox(
              height: size.height * 0.15,
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
            ),
          ],
        ),
      ),
    );
  }
}
