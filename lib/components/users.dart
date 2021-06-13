import 'package:flutter/material.dart';

class AppUser {
  final String uid;

  AppUser({this.uid});
}

class AppUserData {
  final String uid;
  final String nom;
  final String prenom;
  /*final int age;
  final int sex;
  final int chestPain;
  final int bloodPressure;
  final int chol;
  final int bloodSugar; // Glycemie
  final int restingECG;
  final int maximumHeartRate;
  final double stDepression;
  final int slope; // Pente du segment ST
  final int nbMajorVesselsColored;
  final int troubleSanguin;
  final int healthDiseases;*/

  /*final String age;
  final String sex;
  final String chestPain;
  final String bloodPressure;
  final String chol;
  final String bloodSugar; // Glycemie
  final String restingECG;
  final String maximumHeartRate;
  final String stDepression;
  final String slope; // Pente du segment ST
  final String nbMajorVesselsColored;
  final String troubleSanguin;
  final String healthDiseases;*/

  AppUserData({
    this.uid,
    this.nom,
    this.prenom,
  }
      /*this.age,
    this.sex,
    this.chestPain,
    this.bloodPressure,
    this.chol,
    this.bloodSugar,
    this.restingECG,
    this.maximumHeartRate,
    this.stDepression,
    this.slope,
    this.nbMajorVesselsColored,
    this.troubleSanguin,
    this.healthDiseases,*/
      );
}
