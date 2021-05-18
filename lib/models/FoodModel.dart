// To parse this JSON data, do
//
//     final foodModel = foodModelFromJson(jsonString);

import 'dart:convert';

import 'package:yemek_tarifi_odev_mobil/models/CategoryModel.dart';

import 'FileModel.dart';
import 'UserModel.dart';

List<FoodModel> foodModelFromJson(String str) => List<FoodModel>.from(json.decode(str).map((x) => FoodModel.fromJson(x)));

//String foodModelToJson(List<FoodModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

String foodToJson(FoodModel data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

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
    this.savedUsers,
  });

  int id;
  int created;
  int modified;
  String foodName;
  String recipe;
  String ingredients;
  List<CategoryModel> categoryList;
  FileModel image;
  int completedCount;
  int rankStar;
  int hardness;
  int prepTime;
  int personCount;
  UserModel user;
  List<UserModel> savedUsers;

  factory FoodModel.fromJson(Map<String, dynamic> json) => FoodModel(
    id: json["id"] == null ? null : json["id"],
    created: json["created"] == null ? null : json["created"],
    modified: json["modified"] == null ? null : json["modified"],
    foodName: json["foodName"] == null ? null : json["foodName"],
    recipe: json["recipe"] == null ? null : json["recipe"],
    ingredients: json["ingredients"] == null ? null : json["ingredients"],
    categoryList: json["categoryList"] == null ? null : List<CategoryModel>.from(json["categoryList"].map((x) => CategoryModel.fromJson(x))),
    image: json["image"] == null ? null : FileModel.fromJson(json["image"]),
    completedCount: json["completedCount"] == null ? null : json["completedCount"],
    rankStar: json["rankStar"] == null ? null : json["rankStar"],
    hardness: json["hardness"] == null ? null : json["hardness"],
    prepTime: json["prepTime"] == null ? null : json["prepTime"],
    personCount: json["personCount"] == null ? null : json["personCount"],
    user: json["user"] == null ? null : UserModel.fromJson(json["user"]),
    savedUsers: json["savedUsers"] == null ? null : List<UserModel>.from(json["savedUsers"].map((x) => UserModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "created": created == null ? null : created,
    "modified": modified == null ? null : modified,
    "foodName": foodName == null ? null : foodName,
    "recipe": recipe == null ? null : recipe,
    "ingredients": ingredients == null ? null : ingredients,
    "categoryList": categoryList == null ? null : List<dynamic>.from(categoryList.map((x) => x.toJson())),
    "image": image == null ? null : image.toJson(),
    "completedCount": completedCount == null ? null : completedCount,
    "rankStar": rankStar == null ? null : rankStar,
    "hardness": hardness == null ? null : hardness,
    "prepTime": prepTime == null ? null : prepTime,
    "personCount": personCount == null ? null : personCount,
    "user": user == null ? null : user.toJson(),
    "savedUsers": savedUsers == null ? null : List<dynamic>.from(savedUsers.map((x) => x.toJson())),
  };
}

class CategoryList {
  CategoryList({
    this.id,
    this.created,
    this.modified,
    this.nameTurkish,
    this.nameEnglish,
    this.categoryImage,
  });

  int id;
  int created;
  int modified;
  String nameTurkish;
  String nameEnglish;
  Image categoryImage;

  factory CategoryList.fromJson(Map<String, dynamic> json) => CategoryList(
    id: json["id"] == null ? null : json["id"],
    created: json["created"] == null ? null : json["created"],
    modified: json["modified"] == null ? null : json["modified"],
    nameTurkish: json["nameTurkish"] == null ? null : json["nameTurkish"],
    nameEnglish: json["nameEnglish"] == null ? null : json["nameEnglish"],
    categoryImage: json["categoryImage"] == null ? null : Image.fromJson(json["categoryImage"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "created": created == null ? null : created,
    "modified": modified == null ? null : modified,
    "nameTurkish": nameTurkish == null ? null : nameTurkish,
    "nameEnglish": nameEnglish == null ? null : nameEnglish,
    "categoryImage": categoryImage == null ? null : categoryImage.toJson(),
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
  Role role;
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
    role: json["role"] == null ? null : roleValues.map[json["role"]],
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
    "role": role == null ? null : roleValues.reverse[role],
    "profilePhoto": profilePhoto == null ? null : profilePhoto.toJson(),
  };
}

enum Role { ADMIN, USER }

final roleValues = EnumValues({
  "ADMIN": Role.ADMIN,
  "USER": Role.USER
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
