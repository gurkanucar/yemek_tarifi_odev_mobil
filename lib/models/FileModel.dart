// To parse this JSON data, do
//
//     final fileModel = fileModelFromJson(jsonString);

import 'dart:convert';

FileModel fileModelFromJson(String str) => FileModel.fromJson(json.decode(str));

String fileModelToJson(FileModel data) => json.encode(data.toJson());

class FileModel {
  FileModel({
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

  factory FileModel.fromJson(Map<String, dynamic> json) => FileModel(
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
