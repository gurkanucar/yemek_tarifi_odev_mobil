import 'package:flutter/material.dart';
import 'package:yemek_tarifi_odev_mobil/Components/FoodListGrid.dart';
import 'package:yemek_tarifi_odev_mobil/Components/ProfileImageComponent.dart';
import 'package:yemek_tarifi_odev_mobil/GlobalVariables.dart';
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
    UserService.getPublic(GlobalVariables.USER_ID).then((value) {
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
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
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

                        GlobalVariables.USER_ID=0;
                        GlobalVariables.USER=null;
                        GlobalVariables.BEARER_TOKEN="";

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
                /*Container(
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
                      placeholder:'assets/user.png',
                      image: userModel?.profilePhoto != null
                          ? GlobalVariables.BASE_URL +
                              GlobalVariables.IMAGE_BASE_URL +
                              userModel?.profilePhoto.name
                          : 'assets/user.png',
                    ),
                  ),
                ),
*/
                ProfileImageComponent(),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),

                Text(userModel?.username==null ? "":userModel?.username,style: TextStyle(fontSize: 25),),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),

                FoodListGrid(userId: GlobalVariables.USER_ID,savedRecipes: false,),
              ],
            )
          : null,
    );
  }
}
