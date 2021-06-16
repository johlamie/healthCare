import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healtcare/Screens/emergencyContact/addEmergencyContact/addContact.dart';
import 'package:healtcare/Screens/emergencyContact/components/contactList.dart';
import 'package:healtcare/components/services/database.dart';
import 'package:healtcare/components/usersData.dart';
import 'package:healtcare/constants.dart';

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

  @override
  void initState() {
    super.initState();
    fetchDataBaseContactList();
  }

  fetchDataBaseContactList() async {
    dynamic result = await DataBaseService(uid: getUid());
    if (result == null) {
      print("NULL");
    } else {
      setState(() {
        contactList = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference contact =
        FirebaseFirestore.instance.collection('Contact');
    final database = DataBaseService(uid: getUid());
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
        body: FutureBuilder<DocumentSnapshot>(
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
                    return Card(
                      child: ListTile(
                        title: Text('${data['nom']}  ${data['prenom']} '),
                        subtitle: Text(
                            '${data['identite']} / ${data['phoneNumber']}'),
                        // trailing: Text('${contactList[index]['score']}'),
                      ),
                    );
                  },
                ),
              );

              Text("Full Name: ${data['nom']} ${data['prenom']}");
            }

            return Text("loading");
          },
        )

        /*StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Contact').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Text('Loading Data... Please wait...');
          }
          return Column(
            children: <Widget>[],
          );
        },
      ),*/

        /*Container(
        child: ListView.builder(
          itemCount: contactList.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text("nom"),
                subtitle: Text("Prenom"),
                // title: Text('${contactList[index]['nom']}  ${contactList[index]['prenom']} '),
                // subtitle: Text('${contactList[index]['identite']} / ${contactList[index]['phoneNumber']}'),
                // trailing: Text('${contactList[index]['score']}'),
              ),
            );
          },
        ),
      ),*/
        );
  }
}
