// To parse this JSON data, do
//
//     final foodModel = foodModelFromJson(jsonString);

import 'dart:convert';

import 'package:yemek_tarifi_odev_mobil/models/FileModel.dart';
import 'package:yemek_tarifi_odev_mobil/models/UserModel.dart';

List<FoodModel> foodModelFromJson(String str) => List<FoodModel>.from(json.decode(str).map((x) => FoodModel.fromJson(x)));

//FoodModel foodModelFromJson(String str) => FoodModel.fromJson(json.decode(str));
String foodToJson(FoodModel data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}
//String foodModelToJson(FoodModel data) => json.encode(data.toJson());

class FoodModel {
  FoodModel({
    this.id,
    this.created,
    this.modified,
    this.foodName,
    this.recipe,
    this.ingredients,
    this.categoryList,
    this.image,
    this.completedCount,
    this.rankStar,
    this.hardness,
    this.prepTime,
    this.personCount,
    this.user,
  });

  int id;
  int created;
  int modified;
  String foodName;
  String recipe;
  String ingredients;
  List<dynamic> categoryList;
  FileModel image;
  int completedCount;
  int rankStar;
  int hardness;
  int prepTime;
  int personCount;
  UserModel user;

  factory FoodModel.fromJson(Map<String, dynamic> json) => FoodModel(
    id: json["id"] == null ? null : json["id"],
    created: json["created"] == null ? null : json["created"],
    modified: json["modified"] == null ? null : json["modified"],
    foodName: json["foodName"] == null ? null : json["foodName"],
    recipe: json["recipe"] == null ? null : json["recipe"],
    ingredients: json["ingredients"] == null ? null : json["ingredients"],
    categoryList: json["categoryList"] == null ? null : List<dynamic>.from(json["categoryList"].map((x) => x)),
    image: json["image"] == null ? null : FileModel.fromJson(json["image"]),
    completedCount: json["completedCount"] == null ? null : json["completedCount"],
    rankStar: json["rankStar"] == null ? null : json["rankStar"],
    hardness: json["hardness"] == null ? null : json["hardness"],
    prepTime: json["prepTime"] == null ? null : json["prepTime"],
    personCount: json["personCount"] == null ? null : json["personCount"],
    user: json["user"] == null ? null : UserModel.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "created": created == null ? null : created,
    "modified": modified == null ? null : modified,
    "foodName": foodName == null ? null : foodName,
    "recipe": recipe == null ? null : recipe,
    "ingredients": ingredients == null ? null : ingredients,
    "categoryList": categoryList == null ? null : List<dynamic>.from(categoryList.map((x) => x)),
    "image": image == null ? null : image.toJson(),
    "completedCount": completedCount == null ? null : completedCount,
    "rankStar": rankStar == null ? null : rankStar,
    "hardness": hardness == null ? null : hardness,
    "prepTime": prepTime == null ? null : prepTime,
    "personCount": personCount == null ? null : personCount,
    "user": user == null ? null : user.toJson(),
  };
}

class Image {
  Image({
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

  factory Image.fromJson(Map<String, dynamic> json) => Image(
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

class User {
  User({
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
  Image profilePhoto;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"] == null ? null : json["id"],
    created: json["created"] == null ? null : json["created"],
    modified: json["modified"] == null ? null : json["modified"],
    name: json["name"] == null ? null : json["name"],
    surname: json["surname"] == null ? null : json["surname"],
    username: json["username"] == null ? null : json["username"],
    email: json["email"] == null ? null : json["email"],
    resetPassword: json["resetPassword"] == null ? null : json["resetPassword"],
    role: json["role"] == null ? null : json["role"],
    profilePhoto: json["profilePhoto"] == null ? null : Image.fromJson(json["profilePhoto"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "created": created == null ? null : created,
    "modified": modified == null ? null : modified,
    "name": name == null ? null : name,
    "surname": surname == null ? null : surname,
    "username": username == null ? null : username,
    "email": email == null ? null : email,
    "resetPassword": resetPassword == null ? null : resetPassword,
    "role": role == null ? null : role,
    "profilePhoto": profilePhoto == null ? null : profilePhoto.toJson(),
  };
}
