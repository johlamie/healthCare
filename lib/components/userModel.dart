import 'package:flutter/material.dart';

class UserModel {
  final String email;
  final String password;
  String uid;

  UserModel({
    this.uid,
    this.email,
    this.password,
  });

  set setUid(value) => uid = value;

  // Juste pour du debug (Afficher les données dans un format lisible)
  Map<String, dynamic> toJson() => {
        'uid': uid,
        'email': email,
        'password': password,
      };
}
