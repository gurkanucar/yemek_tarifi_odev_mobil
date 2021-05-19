
import 'package:flutter/cupertino.dart';
import 'package:yemek_tarifi_odev_mobil/models/CategoryModel.dart';

import 'models/IngredientJSONModel.dart';
import 'models/UserModel.dart';

class GlobalVariables {
  static String SEARCHED="";
  static String BASE_URL = "http://192.168.0.21:8080";
  static String IMAGE_BASE_URL = "/api/files/downloadFile/";
  static String FOOD_IMAGE_URL = null;
  static String PROFILE_IMAGE_URL = null;
  static String PROFILE_IMAGE_ID ="";
  static String CHAR_NEW_LINE="#n#";
  static String CHAR_IN_LINE="#-#";
  static String BEARER_TOKEN = "";
  static int USER_ID = 1;
  static UserModel USER;
  static String ROLE="";
  static int IMAGE_ID = 0;
  static List<IngredientsJsonModel> INGREDIENT_LIST = [];
  static List<CategoryModel> CATEGORY_LIST = [];
  static int CATEGORY_LIST_FOOD_ID = 0;
  static bool IS_USER_BANNED=false;
  static BuildContext CONTEXT=null;
}
