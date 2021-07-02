import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healtcare/Screens/Drawer/drawer.dart';
import 'package:healtcare/Screens/displayHealthData/display_health_data.dart';
import 'package:healtcare/components/services/database.dart';
import 'package:healtcare/components/usersData.dart';
import 'package:healtcare/constants.dart';
import 'package:geolocator/geolocator.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController = PageController();
  List<Widget> _screens = [DisplayHealthData(), DrawerPage()];
  int _selectedIndex = 0;
  String latitude;
  String longitude;

  String getUid() {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User user = auth.currentUser;
    final String currentUid = user.uid;
    return currentUid;
  }

  getCurrentLocalisation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    // var lastPosition = await Geolocator.getLastKnownPosition();
    setState(() {
      latitude = ('${position.latitude}');
      longitude = ('${position.longitude}');
      String date = DateTime.now().toString();
      DataBaseService(uid: getUid()).saveUserLocalisation(
        getUid(),
        latitude,
        longitude,
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

  // TODO : Voir pourquoi ça donne pas quand on appelle depuis une méthode
  lauchAlert() {
    FirebaseFirestore.instance
        .collection("userLocalisation")
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        print(result.data()["latitude"]);
      });
    });
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
            print("LANCER L'alerte pour le plus proche voison");
            lauchAlert();
          } else {
            print("GOOD : " + "${heartRate}");
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
