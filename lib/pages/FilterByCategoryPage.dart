import 'package:flutter/material.dart';
import 'package:yemek_tarifi_odev_mobil/Components/FoodList.dart';
import 'package:yemek_tarifi_odev_mobil/Components/FoodListGrid.dart';
import 'package:yemek_tarifi_odev_mobil/models/CategoryModel.dart';

class FilterByCategoryPage extends StatefulWidget {
  CategoryModel categoryModel;

  FilterByCategoryPage({@required this.categoryModel});

  @override
  _FilterByCategoryPageState createState() => _FilterByCategoryPageState();
}

class _FilterByCategoryPageState extends State<FilterByCategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.categoryModel.nameTurkish),backgroundColor: Colors.amber,),
      body: SingleChildScrollView(
        child: FoodList(categoryID: widget.categoryModel.id,),
      ),
    );
  }
}
