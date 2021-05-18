
import 'package:flutter/material.dart';
import 'package:yemek_tarifi_odev_mobil/pages/UserBanPage.dart';

import '../GlobalVariables.dart';
import 'UserService.dart';

class UserBanCheckService{

  static bool check(BuildContext context){
    bool banned=false;
    UserService.getSelf(GlobalVariables.BEARER_TOKEN).then((value) {
      if (value == null) {
        banned = true;
        GlobalVariables.IS_USER_BANNED=true;
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => UserBanPage()),
              (Route<dynamic> route) => false,
        );
      }
    });
    return banned;
  }


}