import 'package:flutter/material.dart';

class AppUser {
  final String uid;

  AppUser({this.uid});
}

class AppUserData {
  final String uid;
  final String nom;
  final String prenom;
  final String birth;
  final String sexe;
  final String chestPain;
  final String bloodPressure;
  final String chol;
  final String bloodSugar; // Glycemie
  final String restingECG;
  final String maximumHeartRate;
  final String exang;
  final String oldSpeak;
  final String slope; // Pente du segment ST
  final String nbMajorVesselsColored;
  final String troubleSanguin;
  final String healthDiseases;
  final String identite;
  final String phoneNumber;

  AppUserData({
    this.uid,
    this.nom,
    this.prenom,
    this.birth,
    this.sexe,
    this.chestPain,
    this.bloodPressure,
    this.chol,
    this.bloodSugar,
    this.restingECG,
    this.maximumHeartRate,
    this.exang,
    this.oldSpeak,
    this.slope,
    this.nbMajorVesselsColored,
    this.troubleSanguin,
    this.healthDiseases,
    this.identite,
    this.phoneNumber,
  });
}

class AppUserRateData {
  final String uid;
  final int heartRate;
  final String date;

  AppUserRateData({this.uid, this.heartRate, this.date});
}

class AppUserLocalisation {
  final String uid;
  final String latitude;
  final String longitude;
  final String date;

  AppUserLocalisation({this.uid, this.latitude, this.longitude, this.date});
}
