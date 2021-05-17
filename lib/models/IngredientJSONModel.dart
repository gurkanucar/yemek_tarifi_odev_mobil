// To parse this JSON data, do
//
//     final ingredientsJsonModel = ingredientsJsonModelFromJson(jsonString);

import 'dart:convert';

List<IngredientsJsonModel> ingredientsJsonModelFromJson(String str) => List<IngredientsJsonModel>.from(json.decode(str).map((x) => IngredientsJsonModel.fromJson(x)));

//String ingredientsJsonModelToJson(List<IngredientsJsonModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));




String ingredientsJsonModelToJson(IngredientsJsonModel data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class IngredientsJsonModel {


  IngredientsJsonModel({
    this.name,
    this.count,
  });

  String name;
  String count;

  factory IngredientsJsonModel.fromJson(Map<String, dynamic> json) => IngredientsJsonModel(
    name: json["name"] == null ? null : json["name"],
    count: json["count"] == null ? null : json["count"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "count": count == null ? null : count,
  };
}
