import 'package:flutter/material.dart';
import 'package:yemek_tarifi_odev_mobil/models/CategoryModel.dart';

import '../Constans.dart';

class CategoryListItem extends StatefulWidget {

  CategoryModel categoryModel;
  Function onPressed;

  CategoryListItem({@required this.categoryModel,@required this.onPressed});

  @override
  _CategoryListItemState createState() => _CategoryListItemState();
}

class _CategoryListItemState extends State<CategoryListItem> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50,left: 20,right: 20),
      child:Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.2,
            height: MediaQuery.of(context).size.width * 0.2,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(180),
              boxShadow: [
                BoxShadow(color: Colors.black12, blurRadius: 5)
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(180),
              child: FadeInImage.assetNetwork(
                fit: BoxFit.cover,
                placeholder: 'assets/loading.gif',
                image: widget.categoryModel.categoryImage != null
                    ? Constants.BASE_URL +
                    Constants.IMAGE_BASE_URL +
                    widget?.categoryModel.categoryImage.name
                    : 'assets/loading.gif',
              ),
            ),
          ),
          Text(widget.categoryModel.nameTurkish,style: TextStyle(fontSize: 25),),
        ],

      )
    );
  }
}
