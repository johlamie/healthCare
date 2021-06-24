import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_field/date_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healtcare/Screens/Drawer/drawer.dart';
import 'package:healtcare/Screens/Home/homePage.dart';
import 'package:healtcare/components/profil_widget.dart';
import 'package:healtcare/components/rouded_button.dart';
import 'package:healtcare/components/services/database.dart';
import 'package:healtcare/constants.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String nom;
  String prenom;
  String sexe;
  String birth;
  CollectionReference user = FirebaseFirestore.instance.collection('User');

  String getUid() {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User user = auth.currentUser;
    final String currentUid = user.uid;
    return currentUid;
  }

  Widget _buildNom(String initValue) {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Nom'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Nom requis';
        }
      },
      onSaved: (String value) {
        nom = value;
      },
      initialValue: initValue,
    );
  }

  Widget _buildPrenom(String initValue) {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Prenom'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Prenom requis';
        }
      },
      onSaved: (String value) {
        prenom = value;
      },
      initialValue: initValue,
    );
  }

  // String valueChooseorientationItemList;
  List orientationItemList = [
    "Mr",
    "Mme",
  ];
  Widget _buildOrientationSexuel(String initValue) {
    return DropdownButton(
      value: initValue,
      onChanged: (newValue) {
        setState(() {
          sexe = newValue;
        });
      },
      items: orientationItemList.map(
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
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 32),
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: "assets/images/healthCareLogo.png",
            isEdit: true,
            onClicked: () async {},
          ),
          const SizedBox(height: 24),
          FutureBuilder<DocumentSnapshot>(
              future: user.doc(getUid()).get(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasError) {
                  print("Pop Pup ERROR");
                }

                if (snapshot.hasData && !snapshot.data.exists) {
                  print("POP- PUP Information utilisateur Absent");
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  Map<String, dynamic> data =
                      snapshot.data.data() as Map<String, dynamic>;
                  return Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: [
                            Text("Civilité: "),
                            SizedBox(width: 20),
                            _buildOrientationSexuel(data['sexe']),
                          ],
                        ),
                        const SizedBox(height: 4),
                        _buildNom(data['nom']),
                        const SizedBox(height: 24),
                        _buildPrenom(data['prenom']),
                        const SizedBox(height: 24),
                        DateTimeFormField(
                          decoration: const InputDecoration(
                            hintStyle: TextStyle(color: Colors.black45),
                            errorStyle: TextStyle(color: Colors.redAccent),
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.event_note),
                            labelText: "Date d'anniversaire",
                          ),
                          mode: DateTimeFieldPickerMode.date,
                          autovalidateMode: AutovalidateMode.always,
                          onDateSelected: (DateTime value) {
                            birth = value.toString().substring(0, 10);
                          },
                        ),
                        const SizedBox(height: 24),
                        RoundedButton(
                          color: Colors.grey[800],
                          text: "Valider",
                          textColor: Colors.white,
                          press: () {
                            if (!_formKey.currentState.validate()) {
                              return;
                            }
                            _formKey.currentState.save();
                            DataBaseService(uid: getUid()).saveUser(
                              nom,
                              prenom,
                              birth,
                              sexe,
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  );
                }
                return Center(
                  child: Text("CHARGEMENT..."),
                );
              }),
        ],
      ),
    );
  }
}
