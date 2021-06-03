import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:healtcare/Screens/Drawer/components/pageDrawerButton.dart';
import 'package:healtcare/Screens/FormulaireInscription/formulaire.dart';
import 'package:healtcare/Screens/Welcome/welcome_screen.dart';
import 'package:healtcare/components/userLoginService.dart';
import 'profilPictures.dart';

class Body extends StatelessWidget {
  @override
  UserLoginService _userLoginService = UserLoginService();
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
      child: Column(
        children: [
          PhotoDeProfil(),
          SizedBox(
            height: 5,
          ),
          Text(
            "User Information",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: 35,
          ),
          PageDrawerBoutton(
            titre: "Comptes",
            press: () {},
          ),
          Divider(
            color: Colors.black54,
            //thickness: 10, // pour l'epaissair du diviseur
          ),
          PageDrawerBoutton(
            titre: "Contact d'urgence",
            press: () {},
          ),
          Divider(
            color: Colors.black54,
            //thickness: 10, // pour l'epaissair du diviseur
          ),
          PageDrawerBoutton(
            titre: "Se Déconnecter",
            press: () async {
              await _userLoginService.logout();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return WelcomeScreen();
                  },
                ),
              );
            },
          ),
          Divider(
            color: Colors.black54,
            //thickness: 10, // pour l'epaissair du diviseur
          ),
          PageDrawerBoutton(
            titre: "Page En cours",
            press: //() {}
                () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return FormScreen();
                  },
                ),
              );
            },
            color: Colors.red[400],
          ),
        ],
      ),
    );
  }
}
