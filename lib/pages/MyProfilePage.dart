import 'package:flutter/material.dart';
import 'package:yemek_tarifi_odev_mobil/Components/FoodListGrid.dart';
import 'package:yemek_tarifi_odev_mobil/Constans.dart';
import 'package:yemek_tarifi_odev_mobil/models/UserModel.dart';
import 'package:yemek_tarifi_odev_mobil/pages/LoginPage.dart';
import 'package:yemek_tarifi_odev_mobil/services/UserService.dart';

class MyProfilePage extends StatefulWidget {
  @override
  _MyProfilePageState createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
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
        print("USER SELF: "+userModel.username);
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
                  height: MediaQuery.of(context).size.height * 0.08,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Material(
                    child: InkWell(
                      onTap: (){

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));

                        Constants.USER_ID=0;
                        Constants.USER=null;
                        Constants.BEARER_TOKEN="";

                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.exit_to_app,size: 30,),
                          SizedBox(width: 20,),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
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

                Text(userModel?.username==null ? "":userModel?.username,style: TextStyle(fontSize: 25),),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),

                FoodListGrid(userId: Constants.USER_ID),
              ],
            )
          : null,
    );
  }
}
