import 'package:http/http.dart' as http;
import 'package:yemek_tarifi_odev_mobil/Constans.dart';

import 'dart:async';
import 'dart:convert';

import 'package:yemek_tarifi_odev_mobil/models/FoodModel.dart';

class FoodService {
  static String url = Constants.BASE_URL + "/api/food";

  static Future<List<FoodModel>> getFoods() async {
    try {
      Map<String, String> header = {
        "Authorization": "Bearer " + Constants.BEARER_TOKEN,
        'Content-Type': 'application/json; charset=UTF-8',
      };
      final response = await http.get(url, headers: header);
      if (response.statusCode == 200) {
        List<FoodModel> foods = foodModelFromJson(response.body);
        print(foods[0].foodName.toString());
        return foods;
      } else {
        print("Hata Oluştu!");
        return null;
      }
    } catch (e) {
      print("Hata Oluştu!\n" + e.toString());
      return null;
    }
  }

  static Future<FoodModel> getFoodByID(int id) async {
    try {
      Map<String, String> header = {
        "Authorization": "Bearer " + Constants.BEARER_TOKEN,
        'Content-Type': 'application/json; charset=UTF-8',
      };
      final response =
          await http.get(url + "/" + id.toString(), headers: header);
      if (response.statusCode == 200) {
        // print(response.body);
        var jsonResponse = json.decode(response.body);
        FoodModel food = FoodModel.fromJson(jsonResponse);
        return food;
      } else {
        print("Hata Oluştu!");
        return null;
      }
    } catch (e) {
      print("Hata Oluştu!\n" + e.toString());
      return null;
    }
  }

  static Future<List<FoodModel>> getFoodByUserID(int id) async {
    try {
      Map<String, String> header = {
        "Authorization": "Bearer " + Constants.BEARER_TOKEN,
        'Content-Type': 'application/json; charset=UTF-8',
      };
      final response = await http.get(url+"/userID/"+id.toString(), headers: header);
      if (response.statusCode == 200) {
        List<FoodModel> foods = foodModelFromJson(response.body);
        print(foods[0].foodName.toString());
        return foods;
      } else {
        print("Hata Oluştu!");
        return null;
      }
    } catch (e) {
      print("Hata Oluştu!\n" + e.toString());
      return null;
    }
  }


  static Future<FoodModel> createFood(FoodModel food) async {
    try {
      Map<String, String> header = {
        "Authorization": "Bearer " + Constants.BEARER_TOKEN,
        'Content-Type': 'application/json; charset=UTF-8',
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Credentials": "true",
      };
      print(food.user.name);

      List<FoodModel> foodModels = [food];

      final response = await http.post(url,
          headers: header, body: foodModelToJson(foodModels));
      if (response.statusCode == 200) {
        print(response.body);
        var jsonResponse = json.decode(response.body);
        FoodModel foodModel = FoodModel.fromJson(jsonResponse);
        return foodModel;
      } else {
        print("Hata Oluştu!");
        return null;
      }
    } catch (e) {
      print("Hata Oluştu!\n" + e.toString());
      return null;
    }
  }
}
