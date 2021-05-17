import 'package:flutter/material.dart';
import 'package:yemek_tarifi_odev_mobil/models/FoodModel.dart';
import 'package:yemek_tarifi_odev_mobil/services/FoodService.dart';

import '../GlobalVariables.dart';
import 'FoodDetail.dart';

class FoodListGrid extends StatefulWidget {
  int userId;
  bool savedRecipes = false;

  FoodListGrid({@required this.userId, this.savedRecipes});

  @override
  _FoodListGridState createState() => _FoodListGridState();
}

class _FoodListGridState extends State<FoodListGrid> {
  List<FoodModel> _foods=[];
  bool _loading = true;

  void getFoods() {
    _loading = true;
    FoodService.getFoodByUserID(widget.userId).then((value) {
      setState(() {

          if(value==null){
            _loading=true;
          }else{
            _foods = value;
            _loading = false;
          }

      });
    });
  }

  void getSavedRecipes() {
    _loading = true;
    FoodService.getSavedFoodByUserId(widget.userId).then((value) {
      setState(() {
        if(value==null){
          _loading=true;
        }else{
          _foods = value;
          _loading = false;
        }
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget?.savedRecipes == true) {
      getSavedRecipes();
    } else {
     getFoods();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: _loading == false
            ? GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _foods?.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Material(
                    child: InkWell(
                      onTap: () {
                        print("GRİDDEN PUSHLANDI");
                        print(_foods[index].id.toString());

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    FoodDetail(foodModel: _foods[index])));
                      },
                      child: Container(
                        margin: EdgeInsets.all(20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: FadeInImage.assetNetwork(
                            fit: BoxFit.cover,
                            placeholder: 'assets/loading.gif',
                            image: _foods[index]?.image?.url != null
                                ? GlobalVariables.BASE_URL +
                                GlobalVariables.IMAGE_BASE_URL +
                                _foods[index]?.image?.name
                                : 'assets/loading.gif',
                          ),
                        ),
                      )
                    ),
                  );
                },
              )
            : Container());
  }
}
