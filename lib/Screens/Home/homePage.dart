import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healtcare/Screens/Drawer/drawer.dart';
import 'package:healtcare/Screens/displayHealthData/display_health_data.dart';
import 'package:healtcare/components/services/database.dart';
import 'package:healtcare/components/usersData.dart';
import 'package:healtcare/constants.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController = PageController();
  List<Widget> _screens = [DisplayHealthData(), DrawerPage()];
  int _selectedIndex = 0;
  double rayonTerre = 6371;
  double latitude;
  double longitude;

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

  signalToNeighbor() {
    double min = 40075; // Correspond au préimètre de la terre
    String neighborUid = "";
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
                neighborUid = result.data()["uid"];
                // print(neighborUid);
                DataBaseService(uid: getUid()).saveAttackValue(
                  1,
                  neighborUid,
                );
              }
            }
          },
        );
      },
    ); //  End FirebaseFireStore
  }

  lauchAlert() {
    FirebaseFirestore.instance.collection("heartAttackSignal").get().then(
      (querySnapshot) {
        querySnapshot.docs.forEach((result) {
          var iamneighbor = result.data()["iamneighbor"];
          if (iamneighbor == 1) {
            print("Je suis voisin, je lance la notification");
          }
        });
      },
    );
  }

  checkHeartRateFrequancy() {
    FirebaseFirestore.instance.collection("heartRateSimulation").get().then(
      (querySnapshot) {
        querySnapshot.docs.forEach((result) {
          var heartRate = result.data()["value"];
          DataBaseService(uid: getUid()).saveUserHeartRate(
            DateTime.now().toString(),
            heartRate,
          );
          if (heartRate <= 20) {
            signalToNeighbor();
          } else {
            print("GOOD : " + "${heartRate}");
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    checkHeartRateFrequancy();
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
