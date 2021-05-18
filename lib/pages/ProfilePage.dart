import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yemek_tarifi_odev_mobil/Components/BlurryDialog.dart';
import 'package:yemek_tarifi_odev_mobil/Components/FoodListGrid.dart';
import 'package:yemek_tarifi_odev_mobil/GlobalVariables.dart';
import 'package:yemek_tarifi_odev_mobil/models/UserModel.dart';
import 'package:yemek_tarifi_odev_mobil/pages/RouterPage.dart';
import 'package:yemek_tarifi_odev_mobil/services/UserService.dart';

class ProfilePage extends StatefulWidget {
  int userID;

  ProfilePage({@required this.userID});

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
    UserService.getPublic(widget.userID).then((value) {
      setState(() {
        userModel = value;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        child: isLoading == false
            ? Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  widget.userID != GlobalVariables.USER_ID &&
                          GlobalVariables.ROLE != "USER"
                      ? BanButton()
                      : SizedBox(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
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
                        placeholder: 'assets/user.png',
                        image: userModel?.profilePhoto != null
                            ? GlobalVariables.BASE_URL +
                                GlobalVariables.IMAGE_BASE_URL +
                                userModel?.profilePhoto.name
                            : 'assets/user.png',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Text(
                    userModel.username,
                    style: TextStyle(fontSize: 25),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  FoodListGrid(
                    userId: widget.userID,
                  ),
                ],
              )
            : null,
      ),
    );
  }

  Align BanButton() {
    return Align(
        alignment: Alignment.topRight,
        child: Container(
          margin: EdgeInsets.only(right: 30),
          child: Material(
            elevation: 20,
            borderRadius: BorderRadius.circular(20),
            child: InkWell(
              onTap: () {
                _showDialog(context);
              },
              child: Icon(
                Icons.block,
                color: Colors.red,
                size: 50,
              ),
            ),
          ),
        ));
  }

  void _showDialog(BuildContext context) {
    VoidCallback continueCallBack = () {
      Navigator.of(context).pop();
      // code on continue comes here
      print(widget.userID.toString() + " id'li user banlandı!");
      UserService.delete(widget.userID).then((value) => {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => RouterPage()),
              (Route<dynamic> route) => false,
            )
          });
    };

    BlurryDialog alert;
    alert = BlurryDialog(
        "Uyarı!", "Kullanıcıyı Banlamak İstiyor musunuz?", continueCallBack);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
