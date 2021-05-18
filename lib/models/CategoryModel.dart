// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

List<CategoryModel> categoryModelFromJson(String str) => List<CategoryModel>.from(json.decode(str).map((x) => CategoryModel.fromJson(x)));

String categoryModelToJson(List<CategoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryModel {
  CategoryModel({
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
  CategoryImage categoryImage;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    id: json["id"] == null ? null : json["id"],
    created: json["created"] == null ? null : json["created"],
    modified: json["modified"] == null ? null : json["modified"],
    nameTurkish: json["nameTurkish"] == null ? null : json["nameTurkish"],
    nameEnglish: json["nameEnglish"] == null ? null : json["nameEnglish"],
    categoryImage: json["categoryImage"] == null ? null : CategoryImage.fromJson(json["categoryImage"]),
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

class CategoryImage {
  CategoryImage({
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

  factory CategoryImage.fromJson(Map<String, dynamic> json) => CategoryImage(
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
