import 'package:http/http.dart' as http;
import 'package:yemek_tarifi_odev_mobil/GlobalVariables.dart';
import 'package:yemek_tarifi_odev_mobil/models/CommentModel.dart';

import 'dart:async';
import 'dart:convert';

import 'package:yemek_tarifi_odev_mobil/models/FoodModel.dart';

class CommentService {
  static String url = GlobalVariables.BASE_URL + "/api/comment";


  static Future<FoodModel> createComment(FoodModel food,CommentModel comment) async {
    try {
      Map<String, String> header = {
        "Authorization": "Bearer " + GlobalVariables.BEARER_TOKEN,
        'Content-Type': 'application/json; charset=UTF-8',
      };

      final response = await http.post(url+"/foodID/"+food.id.toString(),
          headers: header, body: commentModelToJson(comment));
      if (response.statusCode == 200) {
        print(response.body);
        return null;
      } else {
        print("Hata Oluştu!");
        return null;
      }
    } catch (e) {
      print("Hata Oluştu!\n" + e.toString());
      return null;
    }
  }


  static Future<List<CommentModel>> getCommentsByFoodID(int id) async {
    try {
      Map<String, String> header = {
        "Authorization": "Bearer " + GlobalVariables.BEARER_TOKEN,
        'Content-Type': 'application/json; charset=UTF-8',
      };
      final response = await http.get(url + "/foodID/" + id.toString(),
          headers: header);
      if (response.statusCode == 200) {
        //print(response.body);
        List<CommentModel> comments = commentModelFromJson(response.body);
        return comments;
      } else {
        print("Hata Oluştu!");
        return null;
      }
    } catch (e) {
      print("Hata Oluştu!\n" + e.toString());
      return null;
    }
  }

  static Future<CommentModel> getCommentByID(int commentID) async {
    try {
      Map<String, String> header = {
        "Authorization": "Bearer " + GlobalVariables.BEARER_TOKEN,
        'Content-Type': 'application/json; charset=UTF-8',
      };
      final response = await http.get(url + "/" + commentID.toString(),
          headers: header);
      if (response.statusCode == 200) {
        // print(response.body);
        var jsonResponse = json.decode(response.body);
        CommentModel comment = CommentModel.fromJson(jsonResponse);
        return comment;
      } else {
        print("Hata Oluştu!");
        return null;
      }
    } catch (e) {
      print("Hata Oluştu!\n" + e.toString());
      return null;
    }
  }

  static Future<CommentModel> deleteCommentByID(int commentID) async {
    try {
      Map<String, String> header = {
        "Authorization": "Bearer " + GlobalVariables.BEARER_TOKEN,
        'Content-Type': 'application/json; charset=UTF-8',
      };
      final response = await http.delete(url + "/" + commentID.toString(),
          headers: header);
      if (response.statusCode == 200) {
        return null;
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
