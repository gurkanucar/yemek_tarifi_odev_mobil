import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:yemek_tarifi_odev_mobil/Components/FoodDetail.dart';
import 'package:yemek_tarifi_odev_mobil/Components/FoodList.dart';
import 'package:yemek_tarifi_odev_mobil/Components/FoodListGrid.dart';
import 'package:yemek_tarifi_odev_mobil/Components/FoodListItem.dart';
import 'package:yemek_tarifi_odev_mobil/models/CategoryModel.dart';
import 'package:yemek_tarifi_odev_mobil/models/FoodModel.dart';
import 'package:yemek_tarifi_odev_mobil/services/FoodService.dart';
import 'package:yemek_tarifi_odev_mobil/services/TextService.dart';

import '../GlobalVariables.dart';

class FilterByCategoryPage extends StatefulWidget {
  CategoryModel categoryModel;

  FilterByCategoryPage({@required this.categoryModel});

  @override
  _FilterByCategoryPageState createState() => _FilterByCategoryPageState();
}

class _FilterByCategoryPageState extends State<FilterByCategoryPage> {
  List<FoodModel> _foods = [];
  bool _loading = true;

  bool _pinned = true;
  bool _snap = false;
  bool _floating = false;

  void getFoodsByCategory() {
    _loading = true;
    FoodService.getFoodByCategoryID(widget.categoryModel.id).then((value) {
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
    getFoodsByCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _loading == false && _foods != null
          ? CustomScrollView(
              slivers: <Widget>[
                sliverAppBar(),
                SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                  return _foods[index] != null && _loading == false
                      ? FoodListItem(
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
                        )
                      : SizedBox();
                }, childCount: _foods?.length))
              ],
            )
          : Center(
              child: _loading == false
                  ? CustomScrollView(
                      slivers: <Widget>[sliverAppBar()],
                    )
                  : CircularProgressIndicator(),
            ),
    );
  }

  SliverAppBar sliverAppBar() {
    return SliverAppBar(
      leading: IconButton(
        icon: Material(
          elevation: 10,
          borderRadius: BorderRadius.circular(20),
          child: Icon(Icons.arrow_back, color: Colors.black),
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
      backgroundColor: Colors.white,
      pinned: _pinned,
      snap: _snap,
      floating: _floating,
      expandedHeight: MediaQuery.of(context).size.height * 0.5,
      flexibleSpace: FlexibleSpaceBar(
        //titlePadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
        title: Material(
            borderRadius: BorderRadius.circular(10),
            elevation: 12,
            child: Container(
              margin: EdgeInsets.only(top: 3, left: 10, right: 10, bottom: 1),
              child: Text(
                TextService.checkLength(widget.categoryModel.nameTurkish,),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            )),
        background: FadeInImage.assetNetwork(
          width: MediaQuery.of(context).size.height * 0.1,
          height: MediaQuery.of(context).size.height * 0.1,
          fit: BoxFit.cover,
          placeholder: 'assets/loading.gif',
          image: widget.categoryModel.categoryImage != null
              ? GlobalVariables.BASE_URL +
                  GlobalVariables.IMAGE_BASE_URL +
                  widget?.categoryModel.categoryImage.name
              : 'assets/loading.gif',
        ),
      ),
    );
  }
}
