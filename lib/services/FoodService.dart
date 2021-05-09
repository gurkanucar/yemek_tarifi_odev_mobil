import 'package:http/http.dart' as http;
import 'package:yemek_tarifi_odev_mobil/Constans.dart';

import 'dart:async';
import 'dart:convert';

import 'package:yemek_tarifi_odev_mobil/models/FoodModel.dart';

class FoodService {
  static String url = Constants.BASE_URL + "/api/food";

  static Future<List<Food>> getFoods() async {
    try {
      Map<String, String> header = {
        "Authorization": "Bearer " + Constants.BEARER_TOKEN,
        'Content-Type': 'application/json; charset=UTF-8',
      };
      final response = await http.get(url, headers: header);
      if (response.statusCode == 200) {
        List<Food> foods = foodFromJson(response.body);
        print(foods.toString());
        return foods;
      } else {
        print("Hata Oluştu!");
        return List<Food>();
      }
    } catch (e) {
      print("Hata Oluştu!\n" + e.toString());
      return List<Food>();
    }
  }

  static Future<Food> getFoodByID(int id) async {
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
        Food food = Food.fromJson(jsonResponse);
        return food;
      } else {
        print("Hata Oluştu!");
        return Food();
      }
    } catch (e) {
      print("Hata Oluştu!\n" + e.toString());
      return Food();
    }
  }

  /*static Future<Food> createFood(Food food) async{
   try{
     Map<String,String> header={
       "Authorization":"Bearer "+Constants.BEARER_TOKEN,
       'Content-Type': 'application/json; charset=UTF-8',
     };
      print(food.user.name);
     final response = await http.post(url,headers: header,body: foodToJson(food));
     if(response.statusCode==200){
        print(response.body);
       var jsonResponse = json.decode(response.body);
       Food food= Food.fromJson(jsonResponse);
       return food;
     }
     else{
       print("Hata Oluştu!");
       return null;
     }
   }
   catch (e){
     print("Hata Oluştu!\n"+e.toString());
     return null;
   }
 }
*/

  /*static Future<List<Comment>> getCommentsByFoodID(int id) async{
   try{
     Map<String,String> header={
       "Authorization":"Bearer "+Constants.BEARER_TOKEN,
       'Content-Type': 'application/json; charset=UTF-8',
     };
     final response = await http.get(url+"/comment/foodID/"+id.toString(),headers: header);
     if(response.statusCode==200){
       // print(response.body);
       List<Comment> comments = commentFromJson(response.body);
       return comments;
     }
     else{
       print("Hata Oluştu!");
       return List<Comment>();
     }
   }
   catch (e){
     print("Hata Oluştu!\n"+e.toString());
     return List<Comment>();
   }
 }

 static Future<Comment> getCommentByID(int commentID) async{
   try{
     Map<String,String> header={
       "Authorization":"Bearer "+Constants.BEARER_TOKEN,
       'Content-Type': 'application/json; charset=UTF-8',
     };
     final response = await http.get(url+"/comment/"+commentID.toString(),headers: header);
     if(response.statusCode==200){
       // print(response.body);
       var jsonResponse = json.decode(response.body);
       Comment comment= Comment.fromJson(jsonResponse);
       return comment;
     }
     else{
       print("Hata Oluştu!");
       return Comment();
     }
   }
   catch (e){
     print("Hata Oluştu!\n"+e.toString());
     return Comment();
   }
 }

*/

}
