import 'package:flutter/material.dart';
import 'package:yemek_tarifi_odev_mobil/Components/FoodListGrid.dart';
import 'package:yemek_tarifi_odev_mobil/Constans.dart';
import 'package:yemek_tarifi_odev_mobil/models/UserModel.dart';
import 'package:yemek_tarifi_odev_mobil/services/UserService.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  UserModel userModel;
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    UserService.getSelf(Constants.BEARER_TOKEN).then((value) {
      setState(() {
        userModel = value;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: isLoading == false
          ? Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.width * 0.4,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(180),
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 5)
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(180),
                    child: FadeInImage.assetNetwork(
                      fit: BoxFit.cover,
                      placeholder: 'assets/loading.gif',
                      image: userModel?.profilePhoto != null
                          ? Constants.BASE_URL +
                              Constants.IMAGE_BASE_URL +
                              userModel?.profilePhoto.name
                          : 'assets/loading.gif',
                    ),
                  ),
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),

                Text(userModel.username,style: TextStyle(fontSize: 25),),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),

                FoodListGrid(),
              ],
            )
          : CircularProgressIndicator(),
    );
  }
}
