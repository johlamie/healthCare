import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healtcare/Screens/Drawer/drawer.dart';
import 'package:healtcare/Screens/displayHealthData/display_health_data.dart';
import 'package:healtcare/components/services/database.dart';
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
  /*lauchAlert() {
    StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('heartRateSimulation')
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("ERROR");
        }
        snapshot.data.docs.forEach(
          (element) {
            value = element['value'];
            if (value <= 20) {
              print("LANCER L'alerte pour le plus proche voison");
            } else {
              print("OKOK");
            }
          },
        );
        return Text("");
      },
    );
  }*/

  @override
  Widget build(BuildContext context) {
    Stream heartStream = FirebaseFirestore.instance
        .collection('heartRateSimulation')
        .snapshots();

    return StreamBuilder<QuerySnapshot>(
      stream: heartStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("ERROR");
        }
        snapshot.data.docs.forEach(
          (element) {
            int heartRate = element['value'];
            DataBaseService(uid: getUid()).saveUserHeartRate(
              DateTime.now().toString(),
              heartRate,
            );

            if (heartRate <= 20) {
              // TODO :
              print("LANCER L'alerte pour le plus proche voison");
            } else {
              print(heartRate);
            }
          },
        );
        /*
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }*/

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
      },
    );
  }
}
