// To parse this JSON data, do
//
//     final foodModel = foodModelFromJson(jsonString);

import 'dart:convert';

List<Food> foodFromJson(String str) =>
    List<Food>.from(json.decode(str).map((x) => Food.fromJson(x)));

String foodToJson(List<Food> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Food {
  Food({
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
  dynamic ingredients;
  List<dynamic> categoryList;
  Image image;
  dynamic completedCount;
  dynamic rankStar;
  int hardness;
  int prepTime;
  int personCount;
  User user;

  factory Food.fromJson(Map<String, dynamic> json) => Food(
        id: json["id"] == null ? null : json["id"],
        created: json["created"] == null ? null : json["created"],
        modified: json["modified"] == null ? null : json["modified"],
        foodName: json["foodName"] == null ? null : json["foodName"],
        recipe: json["recipe"] == null ? null : json["recipe"],
        ingredients: json["ingredients"],
        categoryList: json["categoryList"] == null
            ? null
            : List<dynamic>.from(json["categoryList"].map((x) => x)),
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
        completedCount: json["completedCount"],
        rankStar: json["rankStar"],
        hardness: json["hardness"] == null ? null : json["hardness"],
        prepTime: json["prepTime"] == null ? null : json["prepTime"],
        personCount: json["personCount"] == null ? null : json["personCount"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "created": created == null ? null : created,
        "modified": modified == null ? null : modified,
        "foodName": foodName == null ? null : foodName,
        "recipe": recipe == null ? null : recipe,
        "ingredients": ingredients,
        "categoryList": categoryList == null
            ? null
            : List<dynamic>.from(categoryList.map((x) => x)),
        "image": image == null ? null : image.toJson(),
        "completedCount": completedCount,
        "rankStar": rankStar,
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
    this.myRecipes,
    this.savedRecipes,
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
  List<dynamic> myRecipes;
  List<dynamic> savedRecipes;
  dynamic profilePhoto;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] == null ? null : json["id"],
        created: json["created"] == null ? null : json["created"],
        modified: json["modified"] == null ? null : json["modified"],
        name: json["name"] == null ? null : json["name"],
        surname: json["surname"] == null ? null : json["surname"],
        username: json["username"] == null ? null : json["username"],
        email: json["email"] == null ? null : json["email"],
        resetPassword:
            json["resetPassword"] == null ? null : json["resetPassword"],
        role: json["role"] == null ? null : json["role"],
        myRecipes: json["myRecipes"] == null
            ? null
            : List<dynamic>.from(json["myRecipes"].map((x) => x)),
        savedRecipes: json["savedRecipes"] == null
            ? null
            : List<dynamic>.from(json["savedRecipes"].map((x) => x)),
        profilePhoto: json["profilePhoto"],
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
        "myRecipes": myRecipes == null
            ? null
            : List<dynamic>.from(myRecipes.map((x) => x)),
        "savedRecipes": savedRecipes == null
            ? null
            : List<dynamic>.from(savedRecipes.map((x) => x)),
        "profilePhoto": profilePhoto,
      };
}
