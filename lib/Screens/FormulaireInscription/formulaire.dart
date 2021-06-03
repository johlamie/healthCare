import 'package:flutter/material.dart';
import 'package:healtcare/components/rouded_button.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  String nom;
  String prenom;
  String birth;
  int sexe; // Demander homme ou femme mais stocker 0 = Femme, 1 Homme)
  int chestPain; // Douleur thoraxique (1 a 4)
  int arterialTbps; // Tension arterielle
  int chol;
  int bloodSugar;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Informations",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildNom(),
              SizedBox(height: 100),
              RoundedButton(
                color: Colors.grey[800],
                text: "Soumettre",
                textColor: Colors.white,
                press: () {
                  if (!_formKey.currentState.validate()) {
                    return;
                  }
                  _formKey.currentState.save();
                  print(nom);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
