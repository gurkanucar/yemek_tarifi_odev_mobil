import 'package:http/http.dart' as http;

import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yemek_tarifi_odev_mobil/models/UserModel.dart';
import '../GlobalVariables.dart';
import 'UserBanCheckService.dart';


class UserService {
  static String url = GlobalVariables.BASE_URL + "/api/user";

  static Future<String> login(String username, String password) async {
    try {
      String token;

      final response = await http.post(
        url + "/login",
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'username': username,
          'password': password,
        }),
      ); //headers: header);
      if (response.statusCode == 200) {
        token = response.body;
        print("Token:  " + token);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString("token", token);
        GlobalVariables.BEARER_TOKEN = token;
        UserModel user;
       await getSelf(token).then((value) {
        user=value;
        });
        GlobalVariables.USER=user;
        GlobalVariables.ROLE=user.role.toString();
        GlobalVariables.USER_ID=user.id;
        print("Login Olan USER!!!!! "+user.id.toString());
        return token;
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


  static Future<UserModel> register(String username, String password) async {
    try {
      String token;

      final response = await http.post(
        url + "/register",
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'username': username,
          'password': password,
          'email': username,
        }),
      ); //headers: header);
      if (response.statusCode == 200) {
        return new UserModel();
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


  static Future<UserModel> getSelf(String token) async {
    try{
      Map<String,String> header={
        "Authorization":"Bearer "+token,
        'Content-Type': 'application/json; charset=UTF-8',
      };
      final response = await http.get(url+"/self",headers: header);
      if(response.statusCode==200){
        UserModel user= userModelFromJson(response.body);
        return user;
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

  static Future<UserModel> getPublic(int id) async {
    try{
      Map<String,String> header={
        "Authorization":"Bearer "+GlobalVariables.BEARER_TOKEN,
        'Content-Type': 'application/json; charset=UTF-8',
      };
      final response = await http.get(url+"/public/"+id.toString(),headers: header);
      if(response.statusCode==200){
        UserModel user= userModelFromJson(response.body);
        return user;
      }
      else{
        print("Hata Oluştu!");

        return null;
      }
    }
    catch (e){
      print("Hata Oluştu!\n"+e.toString());
      UserBanCheckService.check(GlobalVariables.CONTEXT);
      return null;
    }
  }

}
