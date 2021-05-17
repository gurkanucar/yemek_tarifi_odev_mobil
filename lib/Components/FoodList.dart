import 'package:flutter/material.dart';
import 'package:yemek_tarifi_odev_mobil/Components/FoodDetail.dart';
import 'package:yemek_tarifi_odev_mobil/Components/FoodListItem.dart';
import 'package:yemek_tarifi_odev_mobil/GlobalVariables.dart';
import 'package:yemek_tarifi_odev_mobil/models/FoodModel.dart';
import 'package:yemek_tarifi_odev_mobil/services/FoodService.dart';

class FoodList extends StatefulWidget {
  int categoryID = -1;
  String searched = "";

  FoodList({this.categoryID, this.searched});

  @override
  _FoodListState createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  List<FoodModel> _foods;
  bool _loading;

  void getFoods() {
    _loading = true;
    FoodService.getFoods().then((value) {
      setState(() {
        _foods = value;
        _loading = false;
      });
    });
  }

  void getFoodsByCategory() {
    _loading = true;
    FoodService.getFoodByCategoryID(widget.categoryID).then((value) {
      setState(() {
        _foods = value;
        _loading = false;
      });
    });
  }

  void getFoodsByName(String name) {
    GlobalVariables.SEARCHED = "";
    _loading = true;
    FoodService.getFoodByName(name).then((value) {
      setState(() {
        _foods = value;
        _loading = false;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.categoryID == -1) {
      getFoods();
    } else if (widget.categoryID == -2) {
      getFoodsByName(widget.searched);
    } else {
      getFoodsByCategory();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width * 0.98,
      child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          key: UniqueKey(),
          itemCount: null == _foods ? 0 : _foods.length,
          itemBuilder: (context, index) {
            return _loading == false
                ? InkWell(
                    child: Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      FoodListItem(
                        foodModel: _foods[index],
                        onPressed: () {
                          print(_foods[index].id.toString() +
                              " id li food tiklandi");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      FoodDetail(foodModel: _foods[index])));
                        },
                      ),
                      SizedBox(
                        height: 15,
                      )
                    ],
                  ))
                : _foods == null
                    ? null
                    : CircularProgressIndicator();
          }),
    );
  }
}
