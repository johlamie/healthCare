import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:healtcare/components/rouded_button.dart';
import 'package:healtcare/components/services/database.dart';

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

  String getUid() {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User user = auth.currentUser;
    final String currentUid = user.uid;
    return currentUid;
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Email'),
      validator: (String value) {
        if (value.isEmpty) {
          return "Adresse mail requise";
        }
        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Entrez une adresse mail valide';
        }
        return null;
      },
      onSaved: (String value) {
        nom = value;
      },
    );
  }

  Widget _buildPasseword() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Mot de passe'),
      keyboardType: TextInputType.visiblePassword,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Mot de passe requis';
        }
      },
      onSaved: (String value) {
        nom = value;
      },
    );
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Numéro de Téléphone'),
      keyboardType: TextInputType.phone,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Requis';
        }
      },
      onSaved: (String value) {
        nom = value;
      },
    );
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

  Widget _buildBirthDate() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Age'),
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

  String valueChoose;
  List douleurListItems = [
    "1",
    "2",
    "3",
    "4",
  ];
  Widget _buildDouleurThoraxique() {
    return DropdownButton(
      value: valueChoose,
      onChanged: (newValue) {
        setState(() {
          valueChoose = newValue;
        });
      },
      items: douleurListItems.map(
        (valueItem) {
          return DropdownMenuItem(
            value: valueItem,
            child: Text(valueItem),
          );
        },
      ).toList(),
    );
  }

  String valueChooseorientationItemList;
  List orientationItemList = [
    "Homme",
    "Femme",
  ];
  Widget _buildOrientationSexuel() {
    return DropdownButton(
      value: valueChooseorientationItemList,
      onChanged: (newValue) {
        setState(() {
          valueChooseorientationItemList = newValue;
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

  Widget _buildTensionArterielle() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Tension Arterielle au repos',
      ),
      keyboardType: TextInputType.number,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Requis';
        }
      },
      onSaved: (String value) {
        nom = value;
      },
    );
  }

  Widget _buildCholesterol() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Cholestérol mg/dl',
        //hintText: 'mg/dl',
      ),
      keyboardType: TextInputType.number,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Requis';
        }
      },
      onSaved: (String value) {
        nom = value;
      },
    );
  }

  Widget _buildBloodSugar() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Glycémie mg/ml',
      ),
      keyboardType: TextInputType.number,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Requis';
        }
      },
      onSaved: (String value) {
        nom = value;
      },
    );
  }

  String valueRestecgItemList;
  List restECGItemList = [
    "Normal",
    "STT",
    "Hypertrophie",
  ];
  Widget _buildRestECG() {
    return DropdownButton(
      value: valueRestecgItemList,
      onChanged: (newValue) {
        setState(() {
          valueRestecgItemList = newValue;
        });
      },
      items: restECGItemList.map(
        (valueItem) {
          return DropdownMenuItem(
            value: valueItem,
            child: Text(valueItem),
          );
        },
      ).toList(),
    );
  }

  Widget _buildMaxHearthFrequency() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Fréquence Cardiaque Maximal',
      ),
      keyboardType: TextInputType.number,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Requis';
        }
      },
      onSaved: (String value) {
        nom = value;
      },
    );
  }

  String valueInducedAnginaExerciceItemList;
  List exangItemList = [
    "OUI",
    "NON",
  ];
  Widget _buildexang() {
    return DropdownButton(
      value: valueInducedAnginaExerciceItemList,
      onChanged: (newValue) {
        setState(() {
          valueInducedAnginaExerciceItemList = newValue;
        });
      },
      items: exangItemList.map(
        (valueItem) {
          return DropdownMenuItem(
            value: valueItem,
            child: Text(valueItem),
          );
        },
      ).toList(),
    );
  }

  Widget _buildOldSpeak() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Drepression ST',
      ),
      keyboardType: TextInputType.text,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Requis';
        }
      },
      onSaved: (String value) {
        nom = value;
      },
    );
  }

  String valueslopeItemList;
  List slopeItemList = [
    "0",
    "1",
    "2",
  ];
  Widget _buildSlope() {
    return DropdownButton(
      value: valueslopeItemList,
      onChanged: (newValue) {
        setState(() {
          valueslopeItemList = newValue;
        });
      },
      items: slopeItemList.map(
        (valueItem) {
          return DropdownMenuItem(
            value: valueItem,
            child: Text(valueItem),
          );
        },
      ).toList(),
    );
  }

  String valueCaVesselColored;
  List vesselColoredtemList = [
    "1",
    "2",
    "3",
  ];
  Widget _buildVesselColored() {
    return DropdownButton(
      value: valueCaVesselColored,
      onChanged: (newValue) {
        setState(() {
          valueCaVesselColored = newValue;
        });
      },
      items: vesselColoredtemList.map(
        (valueItem) {
          return DropdownMenuItem(
            value: valueItem,
            child: Text(valueItem),
          );
        },
      ).toList(),
    );
  }

  String valuebloodDisorder;
  List bloodDisorderItemList = [
    "Normal",
    "Corrigé",
    "Reversible",
    "Irreversible ??",
  ];
  Widget _buildBloodDisorder() {
    return DropdownButton(
      value: valuebloodDisorder,
      onChanged: (newValue) {
        setState(() {
          valuebloodDisorder = newValue;
        });
      },
      items: bloodDisorderItemList.map(
        (valueItem) {
          return DropdownMenuItem(
            value: valueItem,
            child: Text(valueItem),
          );
        },
      ).toList(),
    );
  }

  String heathDeseasesExerciceItemList;
  List heathDeseasesItemList = [
    "OUI",
    "NON",
  ];
  Widget _buildheathDeseases() {
    return DropdownButton(
      value: heathDeseasesExerciceItemList,
      onChanged: (newValue) {
        setState(() {
          heathDeseasesExerciceItemList = newValue;
        });
      },
      items: heathDeseasesItemList.map(
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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Informations",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildNom(),
                _buildPrenom(),
                /*_buildBirthDate(),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text("H/F: "),
                    SizedBox(width: 20),
                    _buildOrientationSexuel(),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text("Niveau de douleur Thoraxique : "),
                    _buildDouleurThoraxique(),
                  ],
                ),
                SizedBox(height: 10),
                _buildTensionArterielle(),
                SizedBox(height: 10),
                _buildCholesterol(),
                SizedBox(height: 10),
                _buildBloodSugar(),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text("Anomalie sur l'ECG : "),
                    SizedBox(
                      width: 20,
                    ),
                    _buildRestECG(),
                  ],
                ),
                SizedBox(height: 10),
                _buildMaxHearthFrequency(),
                SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Text("Douleurs thoraxiques après exercices ? : "),
                      _buildexang(),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                _buildOldSpeak(),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text("Pente du segment ST : "),
                    _buildSlope(),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text("Vaisseaux colorés après Fluoroscopie : "),
                    _buildVesselColored(),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text("Trouble Sanguin : "),
                    SizedBox(
                      width: 10,
                    ),
                    _buildBloodDisorder(),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text("Maladie Cardiaque Connue ? : "),
                    SizedBox(
                      width: 10,
                    ),
                    _buildheathDeseases(),
                  ],
                ),
                SizedBox(height: 20),*/
                RoundedButton(
                  color: Colors.grey[800],
                  text: "Soumettre",
                  textColor: Colors.white,
                  press: () {
                    if (!_formKey.currentState.validate()) {
                      return;
                    }
                    _formKey.currentState.save();
                    DataBaseService(uid: getUid()).saveUser(nom, prenom);
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
