import 'package:flutter/material.dart';

class UserModel {
  String userId, name, email, pic;

  UserModel({
    @required this.userId,
    @required this.name,
    @required this.email,
    @required this.pic,
  });

  UserModel.fromJson(Map<dynamic, dynamic> userData) {
    userId = userData['userId'];
    name = userData['name'];
    email = userData['email'];
    pic = userData['pic'];
  }

  toJson() {
    return {
      'userId': userId,
      'name': name,
      'email': email,
      'pic': pic,
    };
  }
}
