import 'package:http/http.dart' as http;
import 'package:yemek_tarifi_odev_mobil/GlobalVariables.dart';

import 'dart:async';
import 'dart:convert';

import 'package:yemek_tarifi_odev_mobil/models/FoodModel.dart';
import 'package:yemek_tarifi_odev_mobil/services/UserBanCheckService.dart';

class FoodService {
  static String url = GlobalVariables.BASE_URL + "/api/food";

  static Future<List<FoodModel>> getFoods() async {
    try {
      Map<String, String> header = {
        "Authorization": "Bearer " + GlobalVariables.BEARER_TOKEN,
        'Content-Type': 'application/json; charset=UTF-8',
      };
      final response = await http.get(url, headers: header);
      if (response.statusCode == 200) {
        List<FoodModel> foods = foodModelFromJson(response.body);
        return foods;
      } else {
        print("Hata Oluştu!");
        UserBanCheckService.check(GlobalVariables.CONTEXT);
        return null;
      }
    } catch (e) {
      print("Hata Oluştu!\n" + e.toString());
      UserBanCheckService.check(GlobalVariables.CONTEXT);
      return null;
    }
  }

  static Future<FoodModel> getFoodByID(int id) async {
    try {
      Map<String, String> header = {
        "Authorization": "Bearer " + GlobalVariables.BEARER_TOKEN,
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
        UserBanCheckService.check(GlobalVariables.CONTEXT);
        return null;
      }
    } catch (e) {
      print("Hata Oluştu!\n" + e.toString());
      UserBanCheckService.check(GlobalVariables.CONTEXT);
      return null;
    }
  }

  static Future<FoodModel> deleteFoodByID(int id) async {
    try {
      Map<String, String> header = {
        "Authorization": "Bearer " + GlobalVariables.BEARER_TOKEN,
        'Content-Type': 'application/json; charset=UTF-8',
      };
      final response =
          await http.delete(url + "/" + id.toString(), headers: header);
      if (response.statusCode == 200) {
        // print(response.body);
        var jsonResponse = json.decode(response.body);
        FoodModel food = FoodModel.fromJson(jsonResponse);
        return food;
      } else {
        print("Hata Oluştu!");
        UserBanCheckService.check(GlobalVariables.CONTEXT);
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
        "Authorization": "Bearer " + GlobalVariables.BEARER_TOKEN,
        'Content-Type': 'application/json; charset=UTF-8',
      };
      final response =
          await http.get(url + "/userID/" + id.toString(), headers: header);
      if (response.statusCode == 200) {
        List<FoodModel> foods = foodModelFromJson(response.body);
        print(foods[0].foodName.toString());
        return foods;
      } else {
        print("Hata Oluştu!");
        UserBanCheckService.check(GlobalVariables.CONTEXT);
        return null;
      }
    } catch (e) {
      print("Hata Oluştu!\n" + e.toString());
      UserBanCheckService.check(GlobalVariables.CONTEXT);
      return null;
    }
  }

  static Future<List<FoodModel>> getFoodByCategoryID(int id) async {
    try {
      Map<String, String> header = {
        "Authorization": "Bearer " + GlobalVariables.BEARER_TOKEN,
        'Content-Type': 'application/json; charset=UTF-8',
      };
      final response =
          await http.get(url + "/category/" + id.toString(), headers: header);
      if (response.statusCode == 200) {
        List<FoodModel> foods = foodModelFromJson(response.body);
        print(foods[0].foodName.toString());
        return foods;
      } else {
        print("Hata Oluştu!");
        UserBanCheckService.check(GlobalVariables.CONTEXT);
        return null;
      }
    } catch (e) {
      print("Hata Oluştu!\n" + e.toString());
      UserBanCheckService.check(GlobalVariables.CONTEXT);
      return null;
    }
  }

  static Future<List<FoodModel>> getFoodByName(String name) async {
    try {
      Map<String, String> header = {
        "Authorization": "Bearer " + GlobalVariables.BEARER_TOKEN,
        'Content-Type': 'application/json; charset=UTF-8',
      };
      final response = await http.get(url + "/search/" + name, headers: header);
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
      UserBanCheckService.check(GlobalVariables.CONTEXT);
      return null;
    }
  }

  static Future<FoodModel> createFood(FoodModel food) async {
    try {
      Map<String, String> header = {
        "Authorization": "Bearer " + GlobalVariables.BEARER_TOKEN,
        'Content-Type': 'application/json; charset=UTF-8',
      };
      final response =
          await http.post(url, headers: header, body: foodToJson(food));
      if (response.statusCode == 200) {
        return food;
      } else {
        print("Hata Oluştu!");
        UserBanCheckService.check(GlobalVariables.CONTEXT);
        return null;
      }
    } catch (e) {
      print("Hata Oluştu!\n" + e.toString());
      UserBanCheckService.check(GlobalVariables.CONTEXT);
      return null;
    }
  }

  static Future<FoodModel> updateFood(FoodModel food) async {
    try {
      Map<String, String> header = {
        "Authorization": "Bearer " + GlobalVariables.BEARER_TOKEN,
        'Content-Type': 'application/json; charset=UTF-8',
      };
      final response =
          await http.put(url, headers: header, body: foodToJson(food));
      if (response.statusCode == 200) {
        return food;
      } else {
        print("Hata Oluştu!");
        UserBanCheckService.check(GlobalVariables.CONTEXT);
        return null;
      }
    } catch (e) {
      print("Hata Oluştu!\n" + e.toString());
      UserBanCheckService.check(GlobalVariables.CONTEXT);
      return null;
    }
  }

  static Future<List<FoodModel>> getSavedFoodByUserId(int id) async {
    try {
      Map<String, String> header = {
        "Authorization": "Bearer " + GlobalVariables.BEARER_TOKEN,
        'Content-Type': 'application/json; charset=UTF-8',
      };
      final response = await http.get(url + "/savedRecipes/" + id.toString(),
          headers: header);
      if (response.statusCode == 200) {
        List<FoodModel> foods = foodModelFromJson(response.body);
        print(foods[0].foodName.toString());
        return foods;
      } else {
        print("Hata Oluştu!");
        UserBanCheckService.check(GlobalVariables.CONTEXT);
        return null;
      }
    } catch (e) {
      print("Hata Oluştu!\n" + e.toString());
      UserBanCheckService.check(GlobalVariables.CONTEXT);
      return null;
    }
  }

  static Future<int> updateSavedRecipe(int foodID) async {
    try {
      Map<String, String> header = {
        "Authorization": "Bearer " + GlobalVariables.BEARER_TOKEN,
        'Content-Type': 'application/json; charset=UTF-8',
      };
      final response = await http.get(
          url +
              "/savedRecipes/" +
              GlobalVariables.USER_ID.toString() +
              "/" +
              foodID.toString(),
          headers: header);
      if (response.statusCode == 200) {
        return 1;
      } else {
        print("Hata Oluştu!");
        UserBanCheckService.check(GlobalVariables.CONTEXT);
        return null;
      }
    } catch (e) {
      print("Hata Oluştu!\n" + e.toString());
      UserBanCheckService.check(GlobalVariables.CONTEXT);
      return null;
    }
  }
}
