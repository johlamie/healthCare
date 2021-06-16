import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healtcare/components/services/database.dart';
import 'package:healtcare/components/usersData.dart';
import 'package:provider/provider.dart';

class ContactList extends StatefulWidget {
  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  String getUid() {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User user = auth.currentUser;
    final String currentUid = user.uid;
    return currentUid;
  }

  @override
  Widget build(BuildContext context) {
    final contact = Provider.of<List<AppUserData>>(context);
    return ContactCase(contact[0]);
  }
}

class ContactCase extends StatelessWidget {
  final AppUserData contact;
  ContactCase(this.contact);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin:
            EdgeInsets.only(top: 12.0, bottom: 6.0, left: 20.0, right: 20.0),
        child: ListTile(
          title: Text('${contact.nom} / ${contact.prenom} '),
          subtitle: Text('${contact.identite} / ${contact.phoneNumber}'),
        ),
      ),
    );
  }
}
