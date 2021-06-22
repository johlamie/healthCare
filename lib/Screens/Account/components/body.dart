import 'package:date_field/date_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healtcare/Screens/Drawer/drawer.dart';
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

  // String valueChooseorientationItemList;
  String sexe;
  List orientationItemList = [
    "Mr",
    "Mme",
  ];
  Widget _buildOrientationSexuel() {
    return DropdownButton(
      value: sexe,
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
          Row(
            children: [
              Text("Civilité: "),
              SizedBox(width: 20),
              _buildOrientationSexuel(),
            ],
          ),
          const SizedBox(height: 4),
          _buildNom(),
          const SizedBox(height: 24),
          _buildPrenom(),
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
            validator: (e) =>
                (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
            onDateSelected: (DateTime value) {
              print(value);
            },
          ),
          const SizedBox(height: 24),
          RoundedButton(
            color: Colors.grey[800],
            text: "Valider",
            textColor: Colors.white,
            press: () {
              /*
              if (!_formKey.currentState.validate()) {
                return;
              }
              _formKey.currentState.save();
              DataBaseService(uid: getUid()).saveUser(
                nom,
                prenom,
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DrawerPage(),
                ),
              );*/
            },
          )
        ],
      ),
    );
  }
}
