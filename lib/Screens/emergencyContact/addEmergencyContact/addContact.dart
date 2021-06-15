import 'package:flutter/material.dart';
import 'package:healtcare/Screens/emergencyContact/emergencyContact.dart';
import 'package:healtcare/components/rouded_button.dart';
import 'package:healtcare/components/services/database.dart';
import 'package:healtcare/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AddContact extends StatefulWidget {
  @override
  _AddContactState createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String identite;
  String nom, prenom, phoneNumber;

  String getUid() {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User user = auth.currentUser;
    final String currentUid = user.uid;
    return currentUid;
  }

  Widget _buildNom() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Nom'), // TODO : Prendre le nom en base de données
      validator: (String value) {
        if (value.isEmpty) {
          return 'Nom requis';
        }
      },
      onSaved: (String value) {
        nom = value;
      },
    );
  }

  Widget _buildPrenom() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Prenom'), // TODO : Prendre le nom en base de données
      validator: (String value) {
        if (value.isEmpty) {
          return 'Prenom requis';
        }
      },
      onSaved: (String value) {
        prenom = value;
      },
    );
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Numéro de Téléphone',
        hintText: '06XXXXXXXX',
      ),
      keyboardType: TextInputType.phone,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Requis';
        }
        if (RegExp(r"[a-z]").hasMatch(value)) {
          return 'Entrez que des chiffres';
        }
        if (value.length < 10) {
          return 'Merci d\'entrer un numéro de telephone valide';
        }
      },
      onSaved: (String value) {
        phoneNumber = value;
      },
    );
  }

  List identiteItemList = [
    "Medecin",
    "Conjoint",
    "Frere / Soeur",
    "Voisin",
    "Enfants",
    "Autres"
  ];
  Widget _buildIdentite() {
    return DropdownButton(
      value: identite,
      onChanged: (newValue) {
        setState(() {
          identite = newValue;
        });
      },
      items: identiteItemList.map(
        (valueItem) {
          return DropdownMenuItem(
            value: valueItem,
            child: Text(valueItem),
          );
        },
      ).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: blackColor,
          ),
          onPressed: () => Navigator.pop(context, false),
        ),
        backgroundColor: Colors.white,
        title: Text(
          "Nouveau Contact",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: [
                    Text(
                      "Lien : ",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    _buildIdentite(),
                  ],
                ),
                SizedBox(height: 10),
                _buildNom(),
                SizedBox(height: 10),
                _buildPrenom(),
                SizedBox(height: 10),
                _buildPhoneNumber(),
                SizedBox(height: 10),
                RoundedButton(
                  text: "Valider",
                  press: () {
                    if (!_formKey.currentState.validate()) {
                      return;
                    }
                    _formKey.currentState.save();
                    DataBaseService(uid: getUid()).saveUserEmergencyContact(
                      identite,
                      nom,
                      prenom,
                      phoneNumber,
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return EmergencyContact();
                        },
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
