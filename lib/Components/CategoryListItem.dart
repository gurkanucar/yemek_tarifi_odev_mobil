import 'package:flutter/material.dart';
import 'package:yemek_tarifi_odev_mobil/models/CategoryModel.dart';
import 'package:yemek_tarifi_odev_mobil/services/TextService.dart';

import '../GlobalVariables.dart';

class CategoryListItem extends StatefulWidget {
  CategoryModel categoryModel;
  Function onPressed;

  CategoryListItem({@required this.categoryModel, @required this.onPressed});

  @override
  _CategoryListItemState createState() => _CategoryListItemState();
}

class _CategoryListItemState extends State<CategoryListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 50, left: 20, right: 20,bottom: 20),
        child: Column(
          children: [
            ClipOval(
              child: FadeInImage.assetNetwork(
                width: MediaQuery.of(context).size.height*0.1,
                height: MediaQuery.of(context).size.height*0.1,
                fit: BoxFit.cover,
                placeholder: 'assets/loading.gif',
                image: widget.categoryModel.categoryImage != null
                    ? GlobalVariables.BASE_URL +
                        GlobalVariables.IMAGE_BASE_URL +
                        widget?.categoryModel.categoryImage.name
                    : 'assets/loading.gif',
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              TextService.checkLength(widget.categoryModel.nameTurkish,),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 23),
            ),
          ],
        ));
  }
}
