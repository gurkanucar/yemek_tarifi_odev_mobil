import 'package:flutter/material.dart';
import 'package:yemek_tarifi_odev_mobil/models/FoodModel.dart';
import 'package:yemek_tarifi_odev_mobil/pages/ProfilePage.dart';
import 'package:yemek_tarifi_odev_mobil/pages/RouterPage.dart';
import 'package:yemek_tarifi_odev_mobil/services/FoodService.dart';
import 'package:yemek_tarifi_odev_mobil/services/ToastService.dart';

import '../GlobalVariables.dart';
import 'BlurryDialog.dart';

class FoodListItem extends StatefulWidget {
  FoodModel foodModel;
  Function onPressed;

  FoodListItem({@required this.foodModel, @required this.onPressed});

  @override
  _FoodListItemState createState() => _FoodListItemState();
}

class _FoodListItemState extends State<FoodListItem> {
  bool isSaved = false;

  void checkSaved() {
    widget.foodModel.savedUsers.forEach((element) {
      if (element.id == GlobalVariables.USER_ID) {
        setState(() {
          isSaved = true;
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    checkSaved();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        print("silcen mi");
        _showDialog(context);
      },
      child: Material(
          borderRadius: BorderRadius.circular(20),
          elevation: 5,
          child: InkWell(
            onTap: widget.onPressed,
            child: Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              // height: MediaQuery.of(context).size.height * 0.62,
              width: MediaQuery.of(context).size.width * 0.96,
              decoration: BoxDecoration(
                  //border: Border.all(color: Colors.amber),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(height: 10),
                  Material(
                    child: InkWell(
                        onTap: () {
                          print("kullaniciya tıklandi");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfilePage(
                                      userID: widget.foodModel.user.id)));
                        },
                        child: Padding(
                          padding:
                              EdgeInsets.only(bottom: 10, left: 10, top: 10),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 60,
                                  child: Container(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(200),
                                      child: FadeInImage.assetNetwork(
                                        fit: BoxFit.cover,
                                        placeholder: 'assets/user.png',
                                        image: widget.foodModel.user
                                                    ?.profilePhoto !=
                                                null
                                            ? GlobalVariables.BASE_URL +
                                                GlobalVariables.IMAGE_BASE_URL +
                                                widget.foodModel.user
                                                    .profilePhoto.name
                                            : 'assets/user.png',
                                      ),
                                    ),
                                  ),
                                ),
                                flex: 1,
                              ),
                              Expanded(
                                child: Text(
                                  widget?.foodModel?.user != null
                                      ? "   " + widget?.foodModel?.user.username
                                      : "UserName",
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold),
                                ),
                                flex: 5,
                              )
                            ],
                          ),
                        )),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: FadeInImage.assetNetwork(
                      fit: BoxFit.cover,
                      placeholder: 'assets/loading.gif',
                      image: widget?.foodModel?.image?.url != null
                          ? GlobalVariables.BASE_URL +
                              GlobalVariables.IMAGE_BASE_URL +
                              widget.foodModel?.image?.name
                          : 'assets/loading.gif',
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.only(left: 10, top: 10),
                        child: Text(
                          widget?.foodModel?.foodName != null
                              ? widget?.foodModel?.foodName
                              : "Yemek Adı",
                          style: TextStyle(
                            fontSize: 28,
                            color: Color(0xff4C4C4C),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.all(15),
                      child: Text(
                        widget?.foodModel?.recipe,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style:
                            TextStyle(fontSize: 19, color: Color(0xff4C4C4C)),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Row(
                        children: [
                          Icon(Icons.timer),
                          SizedBox(
                            width: 5,
                          ),
                          Text(widget?.foodModel?.prepTime?.toString() + " dk",
                              style: TextStyle(fontSize: 18))
                          /* Text(
                    "20 dk",
                    style: TextStyle(fontSize: 18),
                  )*/
                        ],
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.people),
                          SizedBox(
                            width: 5,
                          ),
                          widget?.foodModel?.prepTime > 1
                              ? Text(
                                  (widget?.foodModel?.personCount - 1)
                                          .toString() +
                                      " - " +
                                      (widget?.foodModel?.personCount + 1)
                                          .toString() +
                                      " kişilik",
                                  style: TextStyle(fontSize: 18))
                              : Text(
                                  (widget?.foodModel?.personCount).toString() +
                                      " kişilik",
                                  style: TextStyle(fontSize: 18)),
                          SizedBox(
                            width: 25,
                          ),
                          Material(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  isSaved = !isSaved;
                                  FoodService.updateSavedRecipe(
                                      widget.foodModel.id);
                                  print("saved: " + isSaved.toString());
                                });
                              },
                              child: isSaved == true
                                  ? Icon(
                                      Icons.save_alt,
                                      color: Colors.amber,
                                    )
                                  : Icon(Icons.save_alt),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }

  void _showDialog(BuildContext context) {
    VoidCallback continueCallBack = () {
      Navigator.of(context).pop();
      // code on continue comes here
      if (widget.foodModel.user.id == GlobalVariables.USER_ID ||
          GlobalVariables.ROLE != "USER") {
        print("Yemeği Sildiniz beyfendi!");
        FoodService.deleteFoodByID(widget.foodModel.id);
        ToastService.showToast(context, "Yemeği Sildiniz !");
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => RouterPage()),
              (Route<dynamic> route) => false,
        );
      } else {
        print("Yemeği Şikayet Ettiniz beyfendi!");
        ToastService.showToast(context, "Yemeği Şikayet Ettiniz !");
        FoodService.deleteFoodByID(widget.foodModel.id);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => RouterPage()));
      }
    };

    BlurryDialog alert;

    if (widget.foodModel.user.id == GlobalVariables.USER_ID ||
        GlobalVariables.ROLE != "USER") {
      alert = BlurryDialog(
          "Uyarı!", "Yemeği Silmek İstiyor musunuz?", continueCallBack);
    } else {
      alert = BlurryDialog(
          "Uyarı!", "Yemeği Şikayet Etmek İstiyor musunuz?", continueCallBack);
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
