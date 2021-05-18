import 'package:flutter/material.dart';
import 'package:yemek_tarifi_odev_mobil/models/CategoryModel.dart';

import '../GlobalVariables.dart';

class CategorySelectItemCompnent extends StatefulWidget {
  CategoryModel categoryModel;
  bool selected = false;
  Function onClick;

  CategorySelectItemCompnent(
      {@required this.categoryModel,
      @required this.selected,
      @required this.onClick});

  @override
  _CategorySelectItemCompnentState createState() =>
      _CategorySelectItemCompnentState();
}

class _CategorySelectItemCompnentState
    extends State<CategorySelectItemCompnent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
            child: CheckboxListTile(
          checkColor: Colors.white,
          activeColor: Colors.amber,
          title: Row(
            children: [
              ClipOval(
                  child: Container(
                width: 50,
                height: 50,
                child: FadeInImage.assetNetwork(
                  fit: BoxFit.cover,
                  placeholder: 'assets/loading.gif',
                  image: widget.categoryModel.categoryImage != null
                      ? GlobalVariables.BASE_URL +
                          GlobalVariables.IMAGE_BASE_URL +
                          widget?.categoryModel.categoryImage.name
                      : 'assets/loading.gif',
                ),
              )),
              Text("    "+widget.categoryModel.nameTurkish,style: TextStyle(fontSize: 25),),
            ],
          ),
          value: widget.selected,
          onChanged: (checkedValue) {
            setState(() {
              widget.selected = !widget.selected;
            });
          },
          controlAffinity:
              ListTileControlAffinity.leading, //  <-- leading Checkbox
        )),
      ),
    );
  }
}
