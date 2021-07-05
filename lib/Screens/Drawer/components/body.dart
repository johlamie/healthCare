import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:healtcare/Screens/Account/accountPage.dart';
import 'package:healtcare/Screens/Drawer/components/pageDrawerButton.dart';
import 'package:healtcare/Screens/FormulaireInscription/formulaire.dart';
import 'package:healtcare/Screens/Welcome/welcome_screen.dart';
import 'package:healtcare/Screens/emergencyContact/emergencyContact.dart';
import 'package:healtcare/Screens/mapPoint/maps.dart';
import 'package:healtcare/Screens/predictionScreen/predictionScreen.dart';
import 'package:healtcare/components/profil_widget.dart';
import 'package:healtcare/components/userLoginService.dart';
import 'profilPictures.dart';

class Body extends StatelessWidget {
  CollectionReference contact = FirebaseFirestore.instance.collection('User');

  String getUid() {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User user = auth.currentUser;
    final String currentUid = user.uid;
    return currentUid;
  }

  @override
  UserLoginService _userLoginService = UserLoginService();
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
      child: Column(
        children: [
          ProfileWidget(
            imagePath: "assets/images/healthCareLogo.png",
            onClicked: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return AccountPage();
                  },
                ),
              );
            },
          ),
          SizedBox(height: 10),
          FutureBuilder<DocumentSnapshot>(
              future: contact.doc(getUid()).get(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text("\$\$\$ Error");
                }

                if (snapshot.hasData && !snapshot.data.exists) {
                  return Text("Information utilisateur Absent");
                }

                if (snapshot.connectionState == ConnectionState.done) {
                  Map<String, dynamic> data =
                      snapshot.data.data() as Map<String, dynamic>;
                  return Text(
                    "${data['nom']}  ${data['prenom']}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      // color: Colors.red[400],
                    ),
                  );
                }
                return Center(
                  child: Text("LOADING..."),
                );
              }),
          SizedBox(
            height: 35,
          ),
          /*PageDrawerBoutton(
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
          ),*/
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
            titre: "Résultat de l'analyse",
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
            // color: Colors.red[400],
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
