
import 'package:http/http.dart' as http;
import 'package:yemek_tarifi_odev_mobil/models/CategoryModel.dart';
import 'dart:async';
import 'dart:convert';

import '../Constans.dart';


class CategoryService {

  static String url = Constants.BASE_URL + "/api/category";



  static Future<List<CategoryModel>> getCategories() async{
    try{
      Map<String,String> header={
        "Authorization":"Bearer "+Constants.BEARER_TOKEN,
        'Content-Type': 'application/json; charset=UTF-8',
      };
      final response = await http.get(url,headers: header);
      if(response.statusCode==200){
        List<CategoryModel> categories=categoryModelFromJson(response.body);
        print(categories.toString());
        return categories;
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

  static Future<CategoryModel> getCategoryByID(int id) async{
    try{
      Map<String,String> header={
        "Authorization":"Bearer "+Constants.BEARER_TOKEN,
        'Content-Type': 'application/json; charset=UTF-8',
      };
      final response = await http.get(url+"/"+id.toString(),headers: header);
      if(response.statusCode==200){
        // print(response.body);
        var jsonResponse = json.decode(response.body);
        CategoryModel category= CategoryModel.fromJson(jsonResponse);
        return category;
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

}