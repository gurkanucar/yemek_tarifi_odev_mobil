import 'package:http/http.dart' as http;

import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yemek_tarifi_odev_mobil/models/UserModel.dart';
import '../Constans.dart';


class UserService {
  static String url = Constants.BASE_URL + "/api/user";

  static Future<String> login(String username, String password) async {
    try {
      String token;
      Map<String, String> header = {
        "Authorization": "Bearer " + "UserData.token",
      };
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
        Constants.BEARER_TOKEN = token;
        UserModel user;
       await getSelf(token).then((value) {
        user=value;
        });
        Constants.USER=user;
        Constants.USER_ID=user.id;
        print("User id: "+user.id.toString());
        return token;
      } else {
        print("Hata Oluştu!");
        return null;
      }
    } catch (e) {
      print("Hata Oluştu!\n" + e.toString());
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



}
