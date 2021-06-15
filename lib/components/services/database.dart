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
      String healthDiseases) async {
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

// ---------------------CONTACT D'URGENCE---------------------

// Creation de la boite qui va contenir nos documents de contact d'urgence
  final CollectionReference emergencyContactCollection =
      FirebaseFirestore.instance.collection("Contact");

  AppUserData _contactEmergencyFromSnapshot(DocumentSnapshot snapshot) {
    var data = snapshot.data();
    if (data == null) throw Exception("contact not found");
    return AppUserData(
      uid: uid,
      sexe: data['identite'],
      nom: data['nom'],
      prenom: data['prenom'],
      birth: data['phoneNumber'],
    );
  }

  Future<void> saveUserEmergencyContact(
      String identite, String nom, String prenom, String phoneNumber) async {
    return await emergencyContactCollection.doc(uid).set(
      {
        'identite': identite,
        'nom': nom,
        'prenom': prenom,
        'phoneNumber': phoneNumber,
      },
    );
  }

  Stream<AppUserData> get contactEmergency {
    return emergencyContactCollection
        .doc(uid)
        .snapshots()
        .map(_contactEmergencyFromSnapshot);
  }

  List<AppUserData> _contactListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return _contactEmergencyFromSnapshot(doc);
    }).toList();
  }

  Stream<List<AppUserData>> get contacts {
    return emergencyContactCollection.snapshots().map(_contactListFromSnapshot);
  }
}
