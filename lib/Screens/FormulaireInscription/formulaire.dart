import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:healtcare/Screens/predictionScreen/predictionScreen.dart';
import 'package:healtcare/components/rouded_button.dart';
import 'package:healtcare/components/services/database.dart';
import 'package:healtcare/constants.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  String nom;
  String prenom;
  String email;
  String passwrd;
  String birth;
  String phoneNumber;
  String sexe; // Demander homme ou femme mais stocker 0 = Femme, 1 Homme)
  String chestPain; // Douleur thoraxique (1 a 4)
  String bloodPressure; // Tension arterielle
  String chol;
  String bloodSugar;
  String restingECG;
  String maximumHeartRate;
  String exang;
  String oldSpeak; // Depression ST
  String slope;
  String nbMajorVesselsColored;
  String troubleSanguin;
  String healthDiseases;

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
        email = value;
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
        passwrd = value;
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
        phoneNumber = value;
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
        birth = value;
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
          chestPain = valueChoose;
        });
      },
      items: douleurListItems.map(
        (valueItem) {
          return DropdownMenuItem(
            value: valueItem,
            child: Text(valueItem),
          );
          print(valueChoose);
        },
      ).toList(),
    );
  }

  // String valueChooseorientationItemList;
  List orientationItemList = [
    "Homme",
    "Femme",
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
        bloodPressure = value;
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
        chol = value;
      },
    );
  }

  List bloodSugarItemList = [
    "OUI",
    "NON",
  ];
  Widget _buildBloodSugar() {
    return DropdownButton(
      value: bloodSugar,
      onChanged: (newValue) {
        setState(() {
          bloodSugar = newValue;
        });
      },
      items: bloodSugarItemList.map(
        (valueItem) {
          return DropdownMenuItem(
            value: valueItem,
            child: Text(valueItem),
          );
        },
      ).toList(),
    );
  }

  List restECGItemList = [
    "Normal",
    "STT",
    "Hypertrophie",
  ];
  Widget _buildRestECG() {
    return DropdownButton(
      value: restingECG,
      onChanged: (newValue) {
        setState(() {
          restingECG = newValue;
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
        maximumHeartRate = value;
      },
    );
  }

  // String valueInducedAnginaExerciceItemList;
  List exangItemList = [
    "OUI",
    "NON",
  ];
  Widget _buildexang() {
    return DropdownButton(
      value: exang,
      onChanged: (newValue) {
        setState(() {
          exang = newValue;
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
        oldSpeak = value;
      },
    );
  }

  // String valueslopeItemList;
  List slopeItemList = [
    "0",
    "1",
    "2",
  ];
  Widget _buildSlope() {
    return DropdownButton(
      value: slope,
      onChanged: (newValue) {
        setState(() {
          slope = newValue;
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

  // String valueCaVesselColored;
  List vesselColoredtemList = [
    "0",
    "1",
    "2",
    "3",
  ];
  Widget _buildVesselColored() {
    return DropdownButton(
      value: nbMajorVesselsColored,
      onChanged: (newValue) {
        setState(() {
          nbMajorVesselsColored = newValue;
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

  // String valuebloodDisorder;
  List bloodDisorderItemList = [
    "Normal",
    "Corrigé",
    "Reversible",
    "Irreversible ??",
  ];
  Widget _buildBloodDisorder() {
    return DropdownButton(
      value: troubleSanguin,
      onChanged: (newValue) {
        setState(() {
          troubleSanguin = newValue;
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

  // String valueheathDeseases;
  List heathDeseasesItemList = [
    "OUI",
    "NON",
  ];
  Widget _buildheathDeseases() {
    return DropdownButton(
      value: healthDiseases,
      onChanged: (newValue) {
        setState(() {
          healthDiseases = newValue;
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
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: blackColor,
          ),
          onPressed: () => Navigator.pop(context, false),
        ),
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
                _buildBirthDate(),
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
                Row(
                  children: [
                    Text("Glycémie > 120 mg/dl ?"),
                    SizedBox(
                      width: 20,
                    ),
                    _buildBloodSugar(),
                  ],
                ),
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
                SizedBox(height: 20),
                RoundedButton(
                  // color: Colors.grey[800],
                  text: "Soumettre",
                  // textColor: Colors.white,
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
                      chestPain,
                      bloodPressure,
                      chol,
                      bloodSugar,
                      restingECG,
                      maximumHeartRate,
                      exang,
                      oldSpeak,
                      slope,
                      nbMajorVesselsColored,
                      troubleSanguin,
                      healthDiseases,
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PredictionScreen(),
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
