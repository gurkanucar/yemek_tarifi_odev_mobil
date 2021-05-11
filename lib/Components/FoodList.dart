import 'package:flutter/material.dart';
import 'package:yemek_tarifi_odev_mobil/Components/FoodDetail.dart';
import 'package:yemek_tarifi_odev_mobil/Components/FoodListItem.dart';
import 'package:yemek_tarifi_odev_mobil/models/FoodModel.dart';
import 'package:yemek_tarifi_odev_mobil/services/FoodService.dart';

class FoodList extends StatefulWidget {
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFoods();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.95,
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
                : null;
          }),
    );
  }
}
