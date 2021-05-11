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
  dynamic surname;
  String username;
  dynamic email;
  bool resetPassword;
  dynamic role;
  ProfilePhoto profilePhoto;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"] == null ? null : json["id"],
    created: json["created"] == null ? null : json["created"],
    modified: json["modified"] == null ? null : json["modified"],
    name: json["name"] == null ? null : json["name"],
    surname: json["surname"],
    username: json["username"] == null ? null : json["username"],
    email: json["email"],
    resetPassword: json["resetPassword"] == null ? null : json["resetPassword"],
    role: json["role"],
    profilePhoto: json["profilePhoto"] == null ? null : ProfilePhoto.fromJson(json["profilePhoto"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "created": created == null ? null : created,
    "modified": modified == null ? null : modified,
    "name": name == null ? null : name,
    "surname": surname,
    "username": username == null ? null : username,
    "email": email,
    "resetPassword": resetPassword == null ? null : resetPassword,
    "role": role,
    "profilePhoto": profilePhoto == null ? null : profilePhoto.toJson(),
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
    id: json["id"] == null ? null : json["id"],
    created: json["created"] == null ? null : json["created"],
    modified: json["modified"] == null ? null : json["modified"],
    name: json["name"] == null ? null : json["name"],
    url: json["url"] == null ? null : json["url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "created": created == null ? null : created,
    "modified": modified == null ? null : modified,
    "name": name == null ? null : name,
    "url": url == null ? null : url,
  };
}
