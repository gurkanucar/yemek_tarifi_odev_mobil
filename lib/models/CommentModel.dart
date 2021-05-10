// To parse this JSON data, do
//
//     final commentModel = commentModelFromJson(jsonString);

import 'dart:convert';

List<CommentModel> commentModelFromJson(String str) => List<CommentModel>.from(json.decode(str).map((x) => CommentModel.fromJson(x)));

String commentModelToJson(List<CommentModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CommentModel {
  CommentModel({
    this.comment,
    this.id,
    this.userId,
    this.userPhotoUrl,
    this.username,
    this.foodId,
  });

  String comment;
  int id;
  int userId;
  String userPhotoUrl;
  String username;
  int foodId;

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
    comment: json["comment"],
    id: json["id"],
    userId: json["userID"],
    userPhotoUrl: json["userPhotoUrl"],
    username: json["username"],
    foodId: json["foodID"],
  );

  Map<String, dynamic> toJson() => {
    "comment": comment,
    "id": id,
    "userID": userId,
    "userPhotoUrl": userPhotoUrl,
    "username": username,
    "foodID": foodId,
  };
}
