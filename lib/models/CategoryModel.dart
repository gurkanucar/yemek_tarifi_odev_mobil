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
    id: json["id"],
    created: json["created"],
    modified: json["modified"],
    nameTurkish: json["nameTurkish"],
    nameEnglish: json["nameEnglish"],
    categoryImage: CategoryImage.fromJson(json["categoryImage"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created": created,
    "modified": modified,
    "nameTurkish": nameTurkish,
    "nameEnglish": nameEnglish,
    "categoryImage": categoryImage.toJson(),
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
