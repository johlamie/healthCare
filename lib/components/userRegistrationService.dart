import 'package:firebase_auth/firebase_auth.dart';
import 'package:healtcare/components/userModel.dart';

class UserRegistrationService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<UserModel> get user {
    return _auth.authStateChanges().asyncMap((user) => UserModel(
          uid: user.uid,
          email: user.email,
        ));
  }

  Future<UserModel> auth(UserModel userModel) async {
    UserCredential userCredential;
    /*try {
      userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userModel.email,
        password: userModel.password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }*/

    try {
      userCredential = await _auth.signInWithEmailAndPassword(
        email: userModel.email,
        password: userModel.password,
      );
      // print("Connection");
    } catch (e) {
      userCredential = await _auth.createUserWithEmailAndPassword(
        email: userModel.email,
        password: userModel.password,
      );
      // print("INscription");
    }
    userModel.setUid = userCredential.user.uid;
    return userModel;
  }
}
