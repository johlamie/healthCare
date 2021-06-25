import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healtcare/components/usersData.dart';
import 'package:provider/provider.dart';

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    final users = Provider.of<List<AppUserData>>(context);
    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return UserTile(users[index]);
        });
  }
}

final FirebaseAuth auth = FirebaseAuth.instance;
final User currentUser = auth.currentUser;
final String currentUid = currentUser.uid;

String getUid() {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final User user = auth.currentUser;
  final String currentUid = user.uid;
  return currentUid;
}

class UserTile extends StatelessWidget {
  final AppUserData user;
  UserTile(this.user);

  String uid = getUid();

  CollectionReference contact = FirebaseFirestore.instance
      .collection('Contact')
      .doc(getUid())
      .collection('Contact');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin:
            EdgeInsets.only(top: 12.0, bottom: 6.0, left: 20.0, right: 20.0),
        child: ListTile(
          title: Text(
            '${user.nom} ${user.prenom}',
            style: TextStyle(
              // decoration: TextDecoration.underline,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text('Lien : ${user.sexe} / Numero : ${user.birth}'
              //'Lien : ${data['identite']} / Numero : ${data['phoneNumber']}'
              ),
        ),
      ),
    );
  }
}
