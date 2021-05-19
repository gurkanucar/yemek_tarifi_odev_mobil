import 'package:flutter/material.dart';
import 'package:yemek_tarifi_odev_mobil/Components/CategoryListItem.dart';
import 'package:yemek_tarifi_odev_mobil/models/CategoryModel.dart';
import 'package:yemek_tarifi_odev_mobil/pages/FilterByCategoryPage.dart';
import 'package:yemek_tarifi_odev_mobil/services/CategoryService.dart';

import 'CategorySelectItemComponent.dart';

class CategoryComponentInFoodDetail extends StatefulWidget {
  List<CategoryModel> categories;

  CategoryComponentInFoodDetail({@required this.categories});

  @override
  _CategoryComponentInFoodDetailState createState() => _CategoryComponentInFoodDetailState();
}

class _CategoryComponentInFoodDetailState extends State<CategoryComponentInFoodDetail> {


  @override
  Widget build(BuildContext context) {
    return widget.categories!=null ? Material(
      elevation: 0,
      color: Colors.transparent,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.23,
        width: MediaQuery.of(context).size.width * 0.85,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            key: UniqueKey(),
            itemCount: null == widget.categories ? 0 : widget.categories.length,
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => FilterByCategoryPage(categoryModel:widget.categories[index])));
                  },
                  child: Column(
                    children: [
                      CategorySelectItemCompnent(
                        onlyShow:true,
                        categoryModel: widget.categories[index],
                      ),
                      SizedBox(
                        height: 50,
                      )
                    ],
                  ));
            }),
      ),
    ):CircularProgressIndicator();
  }
}
