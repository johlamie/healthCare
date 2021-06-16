import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healtcare/Screens/emergencyContact/addEmergencyContact/addContact.dart';
import 'package:healtcare/Screens/emergencyContact/components/contactList.dart';
import 'package:healtcare/components/services/database.dart';
import 'package:healtcare/components/usersData.dart';
import 'package:healtcare/constants.dart';
import 'package:provider/provider.dart';

class EmergencyContact extends StatelessWidget {
  String getUid() {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User user = auth.currentUser;
    final String currentUid = user.uid;
    return currentUid;
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser>(context);
    if (user == null) throw Exception("user not found");
    final database = DataBaseService(uid: getUid());
    return StreamProvider<List<AppUserData>>.value(
      initialData: [],
      value: database.contacts,
      child: Scaffold(
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
        // body: ContactList(),
      ),
    );
  }
}
