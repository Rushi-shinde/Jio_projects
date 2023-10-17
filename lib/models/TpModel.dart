// To parse this JSON data, do
//
//     final tpModel = tpModelFromJson(jsonString);

import 'dart:convert';

TpModel tpModelFromJson(String str) => TpModel.fromJson(json.decode(str));

String tpModelToJson(TpModel data) => json.encode(data.toJson());

class TpModel {
  int? id;
  String? username;
  String? email;
  String? firstName;
  String? lastName;
  String? gender;
  String? image;
  String? token;

  TpModel({
    this.id,
    this.username,
    this.email,
    this.firstName,
    this.lastName,
    this.gender,
    this.image,
    this.token,
  });

  factory TpModel.fromJson(Map<String, dynamic> json) => TpModel(
    id: json["id"],
    username: json["username"],
    email: json["email"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    gender: json["gender"],
    image: json["image"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "email": email,
    "firstName": firstName,
    "lastName": lastName,
    "gender": gender,
    "image": image,
    "token": token,
  };
}
