// To parse this JSON data, do
//
//     final foodModel = foodModelFromJson(jsonString);

import 'dart:convert';

List<FoodModel> foodModelFromJson(String str) => List<FoodModel>.from(json.decode(str).map((x) => FoodModel.fromJson(x)));

String foodModelToJson(List<FoodModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

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
  Image image;
  int completedCount;
  int rankStar;
  int hardness;
  int prepTime;
  int personCount;
  User user;

  factory FoodModel.fromJson(Map<String, dynamic> json) => FoodModel(
    id: json["id"],
    created: json["created"],
    modified: json["modified"],
    foodName: json["foodName"],
    recipe: json["recipe"],
    ingredients: json["ingredients"],
    categoryList: List<dynamic>.from(json["categoryList"].map((x) => x)),
    image: Image.fromJson(json["image"]),
    completedCount: json["completedCount"],
    rankStar: json["rankStar"],
    hardness: json["hardness"],
    prepTime: json["prepTime"],
    personCount: json["personCount"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created": created,
    "modified": modified,
    "foodName": foodName,
    "recipe": recipe,
    "ingredients": ingredients,
    "categoryList": List<dynamic>.from(categoryList.map((x) => x)),
    "image": image.toJson(),
    "completedCount": completedCount,
    "rankStar": rankStar,
    "hardness": hardness,
    "prepTime": prepTime,
    "personCount": personCount,
    "user": user.toJson(),
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
    id: json["id"],
    created: json["created"],
    modified: json["modified"],
    name: json["name"],
    surname: json["surname"],
    username: json["username"],
    email: json["email"],
    resetPassword: json["resetPassword"],
    role: json["role"],
    profilePhoto: Image.fromJson(json["profilePhoto"]),
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
