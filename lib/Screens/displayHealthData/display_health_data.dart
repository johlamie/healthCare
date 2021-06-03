import 'package:flutter/material.dart';
import 'package:healtcare/Screens/Welcome/welcome_screen.dart';
import 'package:healtcare/components/rouded_button.dart';
import 'package:healtcare/components/userLoginService.dart';
import 'package:healtcare/constants.dart';
import 'package:health/health.dart';
import 'dart:async';

class DisplayHealthData extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

enum AppState {
  DATA_NOT_FETCHED,
  FETCHING_DATA,
  DATA_READY,
  NO_DATA,
  AUTH_NOT_GRANTED
}

class _MyAppState extends State<DisplayHealthData> {
  List<HealthDataPoint> _healthDataList = [];
  AppState _state = AppState.DATA_NOT_FETCHED;

  @override
  void initState() {
    super.initState();
  }

  // Récuperation de nos données
  Future<void> fetchData() async {
    DateTime startDate = DateTime(2020, 11, 07, 0, 0, 0);
    DateTime endDate = DateTime(2025, 11, 07, 23, 59, 59);

    HealthFactory health = HealthFactory();

    List<HealthDataType> types = [
      HealthDataType.STEPS,
      HealthDataType.WEIGHT,
      HealthDataType.HEIGHT,
      HealthDataType.BLOOD_GLUCOSE,
      HealthDataType.DISTANCE_WALKING_RUNNING,
    ];

    setState(() => _state = AppState.FETCHING_DATA);

    bool accessWasGranted = await health.requestAuthorization(types);

    int steps = 0;

    if (accessWasGranted) {
      try {
        List<HealthDataPoint> healthData =
            await health.getHealthDataFromTypes(startDate, endDate, types);

        _healthDataList.addAll(healthData);
      } catch (e) {
        print("Caught exception in getHealthDataFromTypes: $e");
      }

      _healthDataList = HealthFactory.removeDuplicates(_healthDataList);

      // DEBUG : Affichage des données dans le terminal
      _healthDataList.forEach((x) {
        print("Data point: $x");
        steps += x.value.round();
      });

      print("Steps: $steps");

      setState(
        () {
          _state =
              _healthDataList.isEmpty ? AppState.NO_DATA : AppState.DATA_READY;
        },
      );
    } else {
      print("Autorisation non accordée");
      setState(() => _state = AppState.DATA_NOT_FETCHED);
    }
  }

  Widget _contentFetchingData() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
            padding: EdgeInsets.all(20),
            child: CircularProgressIndicator(
              strokeWidth: 10,
            )),
        Text('Récupération des données...')
      ],
    );
  }

  // TODO : Modification du widget d'affichage
  Widget _contentDataReady() {
    return ListView.builder(
        itemCount: _healthDataList.length,
        itemBuilder: (_, index) {
          HealthDataPoint p = _healthDataList[index];
          return ListTile(
            title: Text("${p.typeString}: ${p.value}"),
            trailing: Text('${p.unitString}'),
            subtitle: Text('${p.dateFrom} - ${p.dateTo}'),
          );
        });
  }

  Widget _contentNoData() {
    return Text('Aucune donnée pour le moment');
  }

  Widget _contentNotFetched() {
    return Text(
      "Appuyez sur l'icone de téléchargement en haut à droite",
    );
  }

  Widget _authorizationNotGranted() {
    return Text('''Autorisation non donnée.
        Vérifiez les autorisations dans Apple Health.''');
  }

  Widget _content() {
    if (_state == AppState.DATA_READY)
      return _contentDataReady();
    else if (_state == AppState.NO_DATA)
      return _contentNoData();
    else if (_state == AppState.FETCHING_DATA)
      return _contentFetchingData();
    else if (_state == AppState.AUTH_NOT_GRANTED)
      return _authorizationNotGranted();

    return _contentNotFetched();
  }

  UserLoginService _userLoginService = UserLoginService();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          /*leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: blackColor,
            ),
            onPressed: () => Navigator.pop(context, false),
          ),*/
          title: const Text(
            'VOS DONNEES',
            style: TextStyle(color: blackColor),
          ),
          backgroundColor: whiteColor,
          actions: <Widget>[
            /*IconButton(
              icon: Icon(Icons.logout),
              onPressed: () async {
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
              color: blackColor,
            ),*/
            IconButton(
              icon: Icon(Icons.file_download),
              onPressed: () {
                fetchData();
              },
              color: blackColor,
            )
          ],
        ),
        body: Center(
          child: _content(),
        ),
        // backgroundColor: blackColor,
      ),
    );
  }
}
