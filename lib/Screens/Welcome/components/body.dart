import 'package:flutter/material.dart';
import 'package:healtcare/Screens/Home/homePage.dart';
import 'package:healtcare/Screens/SignUp/signup_screen.dart';
import 'package:healtcare/Screens/Welcome/components/background.dart';
import 'package:flutter_svg/svg.dart';
import 'package:healtcare/Screens/displayHealthData/display_health_data.dart';
import 'package:healtcare/Screens/login/login_screen.dart';
import 'package:healtcare/components/rouded_button.dart';
import 'package:healtcare/constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; // Donne height et width de l'écran
    return Background(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "BIENVENUE DANS HEALTHCARE",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: size.height * 0.05),
          SvgPicture.asset(
            "assets/icons/HealthCareLogo2 copie.svg",
            // "assets/icons/chat.svg",
            height: size.height * 0.34,
          ),
          SizedBox(height: size.height * 0.05),
          RoundedButton(
            text: "SE CONNECTER",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return LoginScreen();
                }),
              );
            },
          ),
          RoundedButton(
            text: "S'INSCRIRE",
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
            color: kPrimaryLightColor,
            textColor: Colors.black,
          ),
          /*RoundedButton(
            text: "Home",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return HomePage();
                  },
                ),
              );
            },
            color: blackColor,
            textColor: Colors.white,
          ),*/
        ],
      ),
    ));
  }
}
