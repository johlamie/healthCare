import 'package:firebase_auth/firebase_auth.dart';

class UserService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> auth() async {
    UserCredential userCredential = await _auth.signInAnonymously();
  }
}
