import 'package:flutter/material.dart';
import 'package:yemek_tarifi_odev_mobil/GlobalVariables.dart';
import 'package:yemek_tarifi_odev_mobil/pages/LoginPage.dart';
import 'package:yemek_tarifi_odev_mobil/services/UserService.dart';

class UserBanPage extends StatefulWidget {
  @override
  _UserBanPageState createState() => _UserBanPageState();
}

class _UserBanPageState extends State<UserBanPage> {
  bool banned = false;

  void checkBanned() {
    UserService.getSelf(GlobalVariables.BEARER_TOKEN).then((value) {
      if (value == null) {
        banned = true;
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkBanned();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "YOU ARE BANNED FROM THE APP !",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.red,fontSize: 70),
          ),
          SizedBox(height: 40,),
          Material(
            borderRadius: BorderRadius.circular(30),
            color: Colors.yellow,
            child: InkWell(
              onTap: () {  Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LoginPage()));},
              child: Text(
                "   OK   ",
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold,fontSize: 50),
              ),
            ),
          )
        ],
      )),
    );
  }
}
