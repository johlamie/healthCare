import 'package:flutter/material.dart';
import 'package:healtcare/Screens/emergencyContact/addEmergencyContact/addContact.dart';
import 'package:healtcare/Screens/emergencyContact/components/contactList.dart';
import 'package:healtcare/constants.dart';

class EmergencyContact extends StatefulWidget {
  // const EmergencyContact({Key key}) : super(key: key);

  @override
  _EmergencyContactState createState() => _EmergencyContactState();
}

class _EmergencyContactState extends State<EmergencyContact> {
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
          "Contacts d'Urgence",
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add_circle_outline),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return AddContact();
                  },
                ),
              );
            },
            color: blackColor,
          )
        ],
      ),
    );
  }
}
