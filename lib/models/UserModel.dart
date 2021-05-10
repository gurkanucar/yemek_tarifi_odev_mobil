// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.id,
    this.created,
    this.modified,
    this.name,
    this.surname,
    this.username,
    this.email,
    this.resetPassword,
    this.role,
    this.profilePhoto,
  });

  int id;
  int created;
  int modified;
  String name;
  String surname;
  String username;
  String email;
  bool resetPassword;
  String role;
  dynamic profilePhoto;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    created: json["created"],
    modified: json["modified"],
    name: json["name"],
    surname: json["surname"],
    username: json["username"],
    email: json["email"],
    resetPassword: json["resetPassword"],
    role: json["role"],
    profilePhoto: json["profilePhoto"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created": created,
    "modified": modified,
    "name": name,
    "surname": surname,
    "username": username,
    "email": email,
    "resetPassword": resetPassword,
    "role": role,
    "profilePhoto": profilePhoto,
  };
}
