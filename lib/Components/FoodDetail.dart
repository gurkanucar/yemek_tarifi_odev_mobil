import 'package:flutter/material.dart';
import 'package:yemek_tarifi_odev_mobil/models/FoodModel.dart';
import 'package:yemek_tarifi_odev_mobil/pages/ProfilePage.dart';
import 'package:yemek_tarifi_odev_mobil/services/FoodService.dart';

import '../Constans.dart';
import 'CommentList.dart';

class FoodDetail extends StatefulWidget {
  FoodModel foodModel;

  FoodDetail({@required this.foodModel});

  @override
  _FoodDetailState createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  bool isLoading = true;
  FoodModel foodModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FoodService.getFoodByID(widget.foodModel.id).then((value) {
      setState(() {
        foodModel = value;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          widget.foodModel.foodName != null
              ? widget.foodModel.foodName[0].toUpperCase() +
                  widget.foodModel.foodName
                      .toLowerCase()
                      .substring(1, widget.foodModel.foodName.length)
              : "",
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
      body: isLoading == false
          ? SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(10),
                // height: MediaQuery.of(context).size.height * 0.62,
                width: MediaQuery.of(context).size.width * 0.96,
                decoration: BoxDecoration(
                    //border: Border.all(color: Colors.amber),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(height: 10),
                    Material(
                      elevation: 1,
                      color: Colors.white,
                      child: InkWell(
                          onTap: () {
                            print("kullaniciya tıklandi");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProfilePage(
                                          userID: foodModel.user.id,
                                        )));
                          },
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    height: 60,
                                    child: Container(
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(200),
                                        child: FadeInImage.assetNetwork(
                                          fit: BoxFit.cover,
                                          placeholder: 'assets/loading.gif',
                                          image: widget.foodModel.user
                                                      ?.profilePhoto !=
                                                  null
                                              ? Constants.BASE_URL +
                                                  Constants.IMAGE_BASE_URL +
                                                  widget.foodModel.user
                                                      .profilePhoto.name
                                              : 'assets/loading.gif',
                                        ),
                                      ),
                                    ),
                                  ),
                                  flex: 1,
                                ),
                                Expanded(
                                  child: Text(
                                    widget?.foodModel?.user != null
                                        ? "   " +
                                            widget?.foodModel?.user.username
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
                        image: foodModel?.image?.url != null
                            ? Constants.BASE_URL +
                                Constants.IMAGE_BASE_URL +
                                foodModel?.image?.name
                            : 'assets/loading.gif',
                      ),
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          margin: EdgeInsets.only(left: 10, top: 10),
                          child: Text(
                            foodModel?.foodName != null
                                ? foodModel.foodName[0].toUpperCase() +
                                    foodModel.foodName
                                        .toLowerCase()
                                        .substring(1, foodModel.foodName.length)
                                : "Yemek Adı",
                            style: TextStyle(
                                fontSize: 28, color: Color(0xff4C4C4C)),
                          ),
                        )),
                    SizedBox(height: 5),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.all(15),
                        child: Text(
                          foodModel?.ingredients,
                          textAlign: TextAlign.left,
                          style:
                              TextStyle(fontSize: 22, color: Color(0xff4C4C4C)),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.all(15),
                        child: Text(
                          foodModel?.recipe,
                          textAlign: TextAlign.left,
                          style:
                              TextStyle(fontSize: 22, color: Color(0xff4C4C4C)),
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
                            Text(foodModel?.prepTime?.toString() + " dk",
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
                            foodModel?.prepTime > 1
                                ? Text(
                                    (foodModel?.personCount - 1).toString() +
                                        " - " +
                                        (foodModel?.personCount + 1)
                                            .toString() +
                                        " kişilik",
                                    style: TextStyle(fontSize: 18))
                                : Text(
                                    (foodModel?.personCount).toString() +
                                        " kişilik",
                                    style: TextStyle(fontSize: 18)),
                            /*  Text(
                    "2-4 kişilik",
                    style: TextStyle(fontSize: 18),
                  ),*/
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

                    SizedBox(
                      height: 50,
                    ),

                   CommentList(foodId: foodModel.id),

                  ],
                ),
              ),
            )
          : CircularProgressIndicator(),
    );
  }
}
