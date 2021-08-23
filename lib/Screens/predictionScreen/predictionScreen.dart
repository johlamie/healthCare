import 'package:flutter/material.dart';
import 'package:healtcare/Screens/Home/homePage.dart';
import 'package:healtcare/Screens/predictionScreen/inference.dart';
import 'package:healtcare/constants.dart';

class PredictionScreen extends StatefulWidget {
  @override
  _PredictionScreenState createState() => _PredictionScreenState();
}

class _PredictionScreenState extends State<PredictionScreen> {
  var inference = PredictOnData();
  bool result = false;

  void changeResult(value) {
    setState(() {
      result = value;
    });
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
          "Prédiction",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              if (inference.riskPrediction == 0) {
                changeResult(false);
              } else {
                changeResult(true);
              }
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
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: result
            ? Card(
                margin: EdgeInsets.only(
                    top: 12.0, bottom: 6.0, left: 20.0, right: 20.0),
                child: ListTile(
                  title: Text(
                    'ATTENTION',
                    style: TextStyle(
                      // decoration: TextDecoration.underline,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                      'Prenez Rendez-vous avec votre médécin traitant pour une consultation.'
                      //'Lien : ${data['identite']} / Numero : ${data['phoneNumber']}'
                      ),
                ),
              )
            : Card(
                margin: EdgeInsets.only(
                    top: 12.0, bottom: 6.0, left: 20.0, right: 20.0),
                child: ListTile(
                  title: Text(
                    'Rien a signalé',
                    style: TextStyle(
                      // decoration: TextDecoration.underline,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Expanded(
                    child: Text(
                        'Tout va bien ! Manger 5 fruits et légumes par Jours'
                        //'Lien : ${data['identite']} / Numero : ${data['phoneNumber']}'
                        ),
                  ),
                ),
              ),
      ),
    );
  }
}
