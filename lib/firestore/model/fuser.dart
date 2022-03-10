import 'package:flutter/material.dart';

class FUser {
  String id;
  String name;
  String phone;
  String address;
  String email;
  String password;
  bool isAdmin;

  FUser({
    this.id,
    this.isAdmin,
    @required this.name,
    @required this.phone,
    @required this.address,
    @required this.email,
    @required this.password,
  });
  FUser.fromMap(Map map) {
    this.name = map['name'];
    this.phone = map['phone'];
    this.address = map['address'];
    this.email = map['email'];
    this.id = map['id'];
    this.isAdmin = map['isAdmin'] ?? false;
  }
  toMap() {
    return {
      'name': this.name,
      'phone': this.phone,
      'address': this.address,
      'email': this.email
    };
  }
}
