import 'package:flutter/cupertino.dart';
import 'package:yemek_tarifi_odev_mobil/models/IngredientModel.dart';

import 'models/UserModel.dart';

class Constants {
  static String SEARCHED="";
  static String BASE_URL = "http://192.168.0.21:8080";
  static String IMAGE_BASE_URL = "/api/files/downloadFile/";
  static String BEARER_TOKEN = "";
  static int USER_ID = 1;
  static UserModel USER;
  static int IMAGE_ID = 0;
  static List<IngredientModel> INGREDIENT_LIST = [];
}
