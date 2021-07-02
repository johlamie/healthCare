import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class QueringService {
  getUserLocalisation() {
    return FirebaseFirestore.instance.collection('userLocalisation');
  }
}
