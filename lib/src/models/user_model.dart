import 'package:flutter/material.dart';

class UserModel{
  int ? id;
  String ? firstName;
  String ? lastName;
  String ? phone;
  String ? email;
  String ? password;
  String ? address;

UserModel({
    this.id,
    this.firstName,
    this.lastName,
    this.phone,
    this.email,
    this.password,
    this.address,
  });

  //Map json to object
  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    phone = json['phone'];
    email = json['email'];
    password = json['password'];
    address = json['address'];
  }

  //Map object to json or convert object to json
  Map toJson(){
    var map = Map<String, dynamic>();
    map['id'] = id;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['phone'] = phone;
    map['email'] = email;
    map['password'] = password;
    map['address'] = address;
    return map;
  }

  @override
  String toString() {
    return 'UserModel{id: $id, firstName: $firstName, lastName: $lastName, phone: $phone, email: $email, password: $password, address: $address}';
  }
}