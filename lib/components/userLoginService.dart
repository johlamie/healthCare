import 'package:firebase_auth/firebase_auth.dart';
import 'package:healtcare/components/userModel.dart';

class UserLoginService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<UserModel> get user {
    return _auth.authStateChanges().asyncMap((user) => UserModel(
          uid: user.uid,
          email: user.email,
        ));
  }

  Future<UserModel> auth(UserModel userModel) async {
    UserCredential userCredential;
    try {
      userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userModel.email,
        password: userModel.password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    } catch (e) {
      print(e);
    }

    userModel.setUid = userCredential.user.uid;
    return userModel;
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}
