import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:healtcare/components/usersData.dart';

class DataBaseService {
  final String uid;

  DataBaseService({this.uid});

  // Creation de la boite qui va contenir nos documents Utilisateur
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("User");

  AppUserData _userFromSnapshot(DocumentSnapshot snapshot) {
    var data = snapshot.data();
    if (data == null) throw Exception("user not found");
    return AppUserData(
      uid: uid,
      nom: data['nom'],
      prenom: data['prenom'],
      birth: data['birth'],
      sexe: data['sexe'],
      chestPain: data['chestPain'],
      bloodPressure: data['bloodPressure'],
      chol: data['chol'],
      bloodSugar: data['bloodSugar'],
      restingECG: data['restingECG'],
      maximumHeartRate: data['maximumHeartRate'],
      exang: data['exang'],
      oldSpeak: data['oldSpeak'], // Depression ST
      slope: data['slope'],
      nbMajorVesselsColored: data['nbMajorVesselsColored'],
      troubleSanguin: data['troubleSanguin'],
      healthDiseases: data['healthDiseases'],
    );
  }

  Stream<AppUserData> get user {
    return userCollection.doc(uid).snapshots().map(_userFromSnapshot);
  }

  List<AppUserData> _userListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return _userFromSnapshot(doc);
    }).toList();
  }

  Stream<List<AppUserData>> get users {
    return userCollection.snapshots().map(_userListFromSnapshot);
  }

  // Sauvegarder la feuille de l'utilisateur
  Future<void> saveUser(
    String nom,
    String prenom,
    String birth,
    String sexe,
    String chestPain,
    String bloodPressure,
    String chol,
    String bloodSugar,
    String restingECG,
    String maximumHeartRate,
    String exang,
    String oldSpeak, // Depression ST
    String slope,
    String nbMajorVesselsColored,
    String troubleSanguin,
    String healthDiseases,
  ) async {
    return await userCollection.doc(uid).set(
      {
        'nom': nom,
        'prenom': prenom,
        'birth': birth,
        'sexe': sexe,
        'chestPain': chestPain,
        'bloodPressure': bloodPressure,
        'chol': chol,
        'bloodSugar': bloodSugar,
        'restingECG': restingECG,
        'maximumHeartRate': maximumHeartRate,
        'exang': exang,
        'oldSpeak': oldSpeak, // Depression ST
        'slope': slope,
        'nbMajorVesselsColored': nbMajorVesselsColored,
        'troubleSanguin': troubleSanguin,
        'healthDiseases': healthDiseases,
      },
    );
  }
}
