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
  ProfilePhoto profilePhoto;

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
    profilePhoto: ProfilePhoto.fromJson(json["profilePhoto"]),
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
    "profilePhoto": profilePhoto.toJson(),
  };
}

class ProfilePhoto {
  ProfilePhoto({
    this.id,
    this.created,
    this.modified,
    this.name,
    this.url,
  });

  int id;
  int created;
  int modified;
  String name;
  String url;

  factory ProfilePhoto.fromJson(Map<String, dynamic> json) => ProfilePhoto(
    id: json["id"],
    created: json["created"],
    modified: json["modified"],
    name: json["name"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created": created,
    "modified": modified,
    "name": name,
    "url": url,
  };
}
