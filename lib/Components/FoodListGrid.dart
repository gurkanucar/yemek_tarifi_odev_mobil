import 'package:flutter/material.dart';
import 'package:yemek_tarifi_odev_mobil/models/FoodModel.dart';
import 'package:yemek_tarifi_odev_mobil/services/FoodService.dart';

import '../Constans.dart';
import 'FoodDetail.dart';

class FoodListGrid extends StatefulWidget {
  int userId;

  FoodListGrid({@required this.userId});

  @override
  _FoodListGridState createState() => _FoodListGridState();
}

class _FoodListGridState extends State<FoodListGrid> {
  List<FoodModel> _foods;
  bool _loading = true;

  void getFoods() {
    _loading = true;
    FoodService.getFoodByUserID(widget.userId).then((value) {
      setState(() {
        _foods = value;
        _foods.add(_foods[0]);
        _foods.add(_foods[0]);
        _foods.add(_foods[0]);
        _foods.add(_foods[0]);
        _foods.add(_foods[0]);
        _foods.add(_foods[0]);
        _foods.add(_foods[0]);
        _foods.add(_foods[0]);
        _foods.add(_foods[0]);
        _foods.add(_foods[0]);
        _foods.add(_foods[0]);
        _foods.add(_foods[0]);
        _foods.add(_foods[0]);
        _foods.add(_foods[0]);
        _foods.add(_foods[0]);
        _foods.add(_foods[0]);

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
    return Center(
        child: _loading == false
            ? GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _foods.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Material(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    FoodDetail(foodModel: _foods[index])));
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: FadeInImage.assetNetwork(
                          fit: BoxFit.cover,
                          placeholder: 'assets/loading.gif',
                          image: _foods[index]?.image?.url != null
                              ? Constants.BASE_URL +
                                  Constants.IMAGE_BASE_URL +
                                  _foods[index]?.image?.name
                              : 'assets/loading.gif',
                        ),
                      ),
                    ),
                  );
                },
              )
            : _foods == null
                ? null
                : CircularProgressIndicator());
  }
}
