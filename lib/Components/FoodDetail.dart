import 'package:flutter/material.dart';
import 'package:yemek_tarifi_odev_mobil/models/FoodModel.dart';
import 'package:yemek_tarifi_odev_mobil/models/IngredientJSONModel.dart';
import 'package:yemek_tarifi_odev_mobil/pages/ProfilePage.dart';
import 'package:yemek_tarifi_odev_mobil/pages/RouterPage.dart';
import 'package:yemek_tarifi_odev_mobil/pages/UpdateFoodPage.dart';
import 'package:yemek_tarifi_odev_mobil/services/FoodService.dart';
import 'package:yemek_tarifi_odev_mobil/services/ToastService.dart';

import '../GlobalVariables.dart';
import 'CommentComponent.dart';
import 'CommentList.dart';

class FoodDetail extends StatefulWidget {
  FoodModel foodModel;

  FoodDetail({@required this.foodModel});

  @override
  _FoodDetailState createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  bool isLoading = true;
  FoodModel foodModel = new FoodModel();
  String ingredientsParsed = "";
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


  void getFood() {
    isLoading = true;
    FoodService.getFoodByID(widget?.foodModel?.id).then((value) {
      setState(() {
        if(value!=null){
          foodModel = value;
          checkSaved();
          ingredientsJsonModelFromJson(widget.foodModel.ingredients).forEach((element) {
            ingredientsParsed += element.name+"  "+element.count+"\n";
          });

          isLoading = false;
        }else{
          Navigator.of(context).pop();
          ToastService.showToast(context, "Yemek bulunamadı!");
        }

      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFood();
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
                        elevation: 10,
                        borderRadius: BorderRadius.circular(20),
                        child: Column(
                          children: [
                            Material(
                              child: InkWell(
                                  onTap: () {
                                    print("kullaniciya tıklandi");
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ProfilePage(
                                                  userID: foodModel?.user?.id,
                                                )));
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        bottom: 10, top: 10, left: 10),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ClipOval(
                                            child: Container(
                                          height: 70,
                                          width: 70,
                                          child: FadeInImage.assetNetwork(
                                            fit: BoxFit.cover,
                                            placeholder: 'assets/user.png',
                                            image: widget.foodModel.user
                                                        ?.profilePhoto !=
                                                    null
                                                ? GlobalVariables.BASE_URL +
                                                    GlobalVariables
                                                        .IMAGE_BASE_URL +
                                                    widget.foodModel.user
                                                        .profilePhoto.name
                                                : 'assets/user.png',
                                          ),
                                        )),
                                        Expanded(
                                          child: Text(
                                            widget?.foodModel?.user != null
                                                ? "   " +
                                                    widget?.foodModel?.user
                                                        .username
                                                : "UserName",
                                            style: TextStyle(
                                                fontSize: 19,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          flex: 3,
                                        ),

                                        Expanded(child: Material(
                                          child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                isSaved = !isSaved;
                                                FoodService.updateSavedRecipe(
                                                    widget.foodModel.id);
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) => RouterPage()));
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
                                        flex: 1,),

                                        widget.foodModel.user.id ==
                                                GlobalVariables.USER_ID
                                            ? Expanded(
                                                flex: 2,
                                                child: Container(
                                                  height: 80,
                                                  margin:
                                                      EdgeInsets.only(left: 20),
                                                  child: Material(
                                                    child: InkWell(
                                                      onTap: () {
                                                        print("edit clicked");
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        UpdateFoodPage(
                                                                          foodModel:
                                                                              foodModel,
                                                                        )));
                                                      },
                                                      child: Icon(Icons.edit),
                                                    ),
                                                  ),
                                                ))
                                            : SizedBox()
                                      ],
                                    ),
                                  )),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: FadeInImage.assetNetwork(
                                fit: BoxFit.cover,
                                placeholder: 'assets/user.png',
                                image: foodModel?.image != null
                                    ? GlobalVariables.BASE_URL +
                                        GlobalVariables.IMAGE_BASE_URL +
                                        foodModel?.image?.name
                                    : 'assets/user.png',
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
                                                .substring(1,
                                                    foodModel.foodName.length)
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
                                  ingredientsParsed,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 22, color: Color(0xff4C4C4C)),
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
                                  style: TextStyle(
                                      fontSize: 22, color: Color(0xff4C4C4C)),
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
                                    Text(
                                        foodModel?.prepTime?.toString() + " dk",
                                        style: TextStyle(fontSize: 18))
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
                                            (foodModel?.personCount - 1)
                                                    .toString() +
                                                " - " +
                                                (foodModel?.personCount + 1)
                                                    .toString() +
                                                " kişilik",
                                            style: TextStyle(fontSize: 18))
                                        : Text(
                                            (foodModel?.personCount)
                                                    .toString() +
                                                " kişilik",
                                            style: TextStyle(fontSize: 18)),
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
                      SizedBox(
                        height: 50,
                      ),
                      CommentList(foodId: widget?.foodModel?.id),
                      SizedBox(
                        height: 50,
                      ),
                      CommentComponent(
                        foodID: foodModel.id,
                        onClick: () {
                          setState(() {
                            print("Geldi abeeey");
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        super.widget));
                          });
                        },
                      ),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              )
            : null //CircularProgressIndicator(),
        );
  }
}
