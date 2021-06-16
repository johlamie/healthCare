import 'package:flutter/material.dart';
import 'package:healtcare/Screens/Account/accountPage.dart';
import 'package:healtcare/Screens/Drawer/components/pageDrawerButton.dart';
import 'package:healtcare/Screens/FormulaireInscription/formulaire.dart';
import 'package:healtcare/Screens/Welcome/welcome_screen.dart';
import 'package:healtcare/Screens/emergencyContact/emergencyContact.dart';
import 'package:healtcare/Screens/predictionScreen/predictionScreen.dart';
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
            "NOM - Prénom",
            style: TextStyle(
              fontSize: 18,
              color: Colors.red[400],
            ),
          ),
          SizedBox(
            height: 35,
          ),
          PageDrawerBoutton(
            titre: "Comptes",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return AccountPage();
                  },
                ),
              );
            },
            color: Colors.red[400],
          ),
          Divider(
            color: Colors.black54,
            //thickness: 10, // pour l'epaissair du diviseur
          ),
          PageDrawerBoutton(
            titre: "Contact d'urgence",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return EmergencyContact();
                  },
                ),
              );
            },
            // color: Colors.red[400],
          ),
          Divider(
            color: Colors.black54,
            //thickness: 10, // pour l'epaissair du diviseur
          ),
          PageDrawerBoutton(
            titre: "Soumettre une analyse",
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
          ),
          Divider(
            color: Colors.black54,
            //thickness: 10, // pour l'epaissair du diviseur
          ),
          PageDrawerBoutton(
            titre: "Résultat de l'analyse (Page en cours)",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return PredictionScreen();
                  },
                ),
              );
            },
            color: Colors.red[400],
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
        ],
      ),
    );
  }
}
