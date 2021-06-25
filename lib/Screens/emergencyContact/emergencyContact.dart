import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healtcare/Screens/emergencyContact/addEmergencyContact/addContact.dart';
import 'package:healtcare/components/services/database.dart';
import 'package:healtcare/components/userList.dart';
import 'package:healtcare/components/usersData.dart';
import 'package:healtcare/constants.dart';
import 'package:provider/provider.dart';

class EmergencyContact extends StatefulWidget {
  @override
  _EmergencyContactState createState() => _EmergencyContactState();
}

class _EmergencyContactState extends State<EmergencyContact> {
  List contactList = [];

  String getUid() {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User user = auth.currentUser;
    final String currentUid = user.uid;
    return currentUid;
  }

  // var stream = FirebaseFirestore.instance.collection('Doctor').snapshots();

  @override
  Widget build(BuildContext context) {
    // final user = Provider.of<AppUser>(context);
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
            "Contacts d'urgence",
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
        body: UserList(),
      ),
    );

    /*
      FutureBuilder<DocumentSnapshot>(
        future: contact.doc(getUid()).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }

          if (snapshot.hasData && !snapshot.data.exists) {
            return Text("Document does not exist");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data.data() as Map<String, dynamic>;
            return Container(
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Card(
                      margin: EdgeInsets.only(
                          top: 12.0, bottom: 6.0, left: 20.0, right: 20.0),
                      child: ListTile(
                        title: Text(
                          '${data['nom']} / ${data['prenom']}',
                          style: TextStyle(
                            // decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                            'Lien : ${data['identite']} / Numero : ${data['phoneNumber']}'),
                      ),
                    ),
                  );
                },
              ),
            );
          }
          return Center(
            child: Text("LOADING..."),
          );
        },
      ),*/
  }
}
