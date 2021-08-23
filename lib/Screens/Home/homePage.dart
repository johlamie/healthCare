import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:healtcare/Screens/Drawer/drawer.dart';
import 'package:healtcare/Screens/displayHealthData/display_health_data.dart';
import 'package:healtcare/Screens/mapPoint/maps.dart';
import 'package:healtcare/components/services/database.dart';
import 'package:healtcare/constants.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:math';

import 'package:healtcare/main.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController = PageController();
  List<Widget> _screens = [DisplayHealthData(), DrawerPage()];
  int _selectedIndex = 0;
  double rayonTerre = 6371;
  double latitude = 0;
  double longitude = 0;

  String getUid() {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User user = auth.currentUser;
    final String currentUid = user.uid;
    return currentUid;
  }

  getCurrentLocalisation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lastPosition = await Geolocator.getLastKnownPosition();
    setState(() {
      // latitude = ('${position.latitude}');
      // longitude = ('${position.longitude}');
      latitude = position.latitude;
      longitude = position.longitude;
      String date = DateTime.now().toString();
      DataBaseService(uid: getUid()).saveUserLocalisation(
        getUid(),
        latitude.toString(),
        longitude.toString(),
        date,
      );
    });
  }

  @override
  void initState() {
    super.initState();
    getCurrentLocalisation();
  }

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

//------------- Gestion Alerte Notification et signalement au plus proche voisin
  signalToNeighbor() {
    double min = 40075; // Correspond au périmètre de la terre
    FirebaseFirestore.instance.collection("userLocalisation").get().then(
      (querySnapshot) {
        querySnapshot.docs.forEach(
          (result) {
            if (result.data()["uid"] != getUid()) {
              double latB = double.parse(result.data()["latitude"]);
              double longB = double.parse(result.data()["longitude"]);
              double distance = rayonTerre *
                  (acos((sin(latitude) * sin(latB)) +
                      (cos(latitude) * cos(latB) * cos(longitude - longB))));
              if (distance < min) {
                min = distance;
                String neighborUid = result.data()["uid"];
                DataBaseService(uid: getUid()).saveAttackValue(
                  1,
                  neighborUid,
                  distance.round(),
                  latitude,
                  longitude,
                );
                // lauchAlert(LatLng(latB, longB));48,852951  2,393181
              }
            }
          },
        );
      },
    ); //  End FirebaseFireStore
    // lauchAlert(LatLng(latB, longB));
  }

  lauchAlert() {
    var scheduledNotificationDateTime =
        DateTime.now().add(Duration(seconds: 3));
    FirebaseFirestore.instance
        .collection("heartAttackSignal")
        .doc(getUid())
        .get()
        .then(
      (result) {
        var iamneighbor = result.data()["iamneighbor"];
        var neighboruid = result.data()["neighboruid"];
        var distance = result.data()["distance"];
        if (iamneighbor == 1) {
          if (neighboruid != getUid()) {
            alertNotification('URGENCE', 'AVC Detecter à $distance mètres',
                scheduledNotificationDateTime);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  LatLng me = LatLng(latitude, longitude);
                  double oLat = result.data()["latitude"];
                  double oLong = result.data()["longitude"];
                  LatLng other = LatLng(oLat, oLong);
                  return MapScreen(me, other);
                },
              ),
            );
          }
        }
      },
    );
  }

  void alertNotification(String title, String body, DateTime payload) async {
    var iOSPlatformChannelSpecifics = IOSNotificationDetails(
        sound: 'a_long_cold_sting.wav',
        presentAlert: true,
        presentBadge: true,
        presentSound: true);
    var platformChannelSpecifics =
        NotificationDetails(iOS: iOSPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.schedule(
        0, title, body, payload, platformChannelSpecifics);
  }

//------------- Stockage FireStore
  saveHeartRateFrequancy() {
    FirebaseFirestore.instance.collection("heartRateSimulation").get().then(
      (querySnapshot) {
        querySnapshot.docs.forEach((result) {
          var heartRate = result.data()["value"];
          DataBaseService(uid: getUid()).saveUserHeartRate(
            DateTime.now().toString(),
            heartRate,
          );
          DataBaseService(uid: getUid()).saveLastUserHeartRate(
            DateTime.now().toString(),
            heartRate,
          );
          if (heartRate <= 20) {
            signalToNeighbor();
          }
          // checkHeartRateFrequancy();
        });
      },
    );
  }

  saveWatchData() {
    FirebaseFirestore.instance
        .collection("watchSimulation")
        .doc("simulation")
        .get()
        .then(
      (result) {
        saveTrestbps(result.data()["trestbps"]);
        savechol(result.data()["chol"]);
        savefbs(result.data()["fbs"]);
        saveRestecg(result.data()["restecg"]);
        saveThalach(result.data()["thalach"]);
        saveOldpeak(result.data()["oldpeak"]);
        saveSLOPE(result.data()["slope"]);
        saveCA(result.data()["ca"]);
      },
    );
  }

  saveTrestbps(int value) {
    DataBaseService(uid: getUid()).saveTrestbps(
      DateTime.now().toString(),
      value,
    );
    DataBaseService(uid: getUid()).saveLastTrestbps(
      DateTime.now().toString(),
      value,
    );
  }

  savechol(int value) {
    DataBaseService(uid: getUid()).savechol(
      DateTime.now().toString(),
      value,
    );
    DataBaseService(uid: getUid()).saveLastchol(
      DateTime.now().toString(),
      value,
    );
  }

  savefbs(int value) {
    DataBaseService(uid: getUid()).savefbs(
      DateTime.now().toString(),
      value,
    );
    DataBaseService(uid: getUid()).saveLastfbs(
      DateTime.now().toString(),
      value,
    );
  }

  saveRestecg(int value) {
    DataBaseService(uid: getUid()).saveRestecg(
      DateTime.now().toString(),
      value,
    );
    DataBaseService(uid: getUid()).saveLastRestecg(
      DateTime.now().toString(),
      value,
    );
  }

  saveThalach(int value) {
    DataBaseService(uid: getUid()).saveThalach(
      DateTime.now().toString(),
      value,
    );
    DataBaseService(uid: getUid()).saveLastThalach(
      DateTime.now().toString(),
      value,
    );
  }

  saveOldpeak(double value) {
    DataBaseService(uid: getUid()).saveOldpeak(
      DateTime.now().toString(),
      value,
    );
    DataBaseService(uid: getUid()).saveLastOldpeak(
      DateTime.now().toString(),
      value,
    );
  }

  saveSLOPE(int value) {
    DataBaseService(uid: getUid()).saveSLOPE(
      DateTime.now().toString(),
      value,
    );
    DataBaseService(uid: getUid()).saveLastSLOPE(
      DateTime.now().toString(),
      value,
    );
  }

  saveCA(int value) {
    DataBaseService(uid: getUid()).saveCA(
      DateTime.now().toString(),
      value,
    );
    DataBaseService(uid: getUid()).saveLastCA(
      DateTime.now().toString(),
      value,
    );
  }

  checkHeartRateFrequancy() {
    FirebaseFirestore.instance.collection("heartRate").doc(getUid()).get().then(
      (result) {
        var lastheartRate = result.data()["lastHeartRate"];
        if (lastheartRate <= 20) {
          signalToNeighbor();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    saveHeartRateFrequancy();
    saveWatchData();
    lauchAlert();
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: _onPageChanged,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Acceuil",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: kPrimaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
