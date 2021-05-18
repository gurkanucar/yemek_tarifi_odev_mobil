import 'package:flutter/material.dart';
import 'package:yemek_tarifi_odev_mobil/models/CategoryModel.dart';
import 'package:yemek_tarifi_odev_mobil/models/TempModel.dart';

import '../GlobalVariables.dart';

class CategorySelectItemCompnent extends StatefulWidget {
  CategoryModel categoryModel;
  List<CategoryModel> selectedCategories;
  bool selected = false;

  CategorySelectItemCompnent(
      {@required this.categoryModel,
      @required this.selected,
      @required this.selectedCategories});

  @override
  _CategorySelectItemCompnentState createState() =>
      _CategorySelectItemCompnentState();
}

class _CategorySelectItemCompnentState
    extends State<CategorySelectItemCompnent> {
  bool selected = null;

  bool checkIfIsInTheList() {
    return widget.selectedCategories
        .every((item) => item.id == widget.categoryModel.id);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      selected = checkIfIsInTheList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      height: MediaQuery.of(context).size.width * 0.3,

      child: Material(
        color: selected == true ? Colors.amber : Colors.white,
        elevation: 10,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
            onTap: () {
              setState(() {
                selected = !selected;
              });
            },
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipOval(
                      child: Container(
                    width: MediaQuery.of(context).size.width * 0.12,
                    height: MediaQuery.of(context).size.width * 0.12,
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
                  SizedBox(
                    height: 10,
                  ),
                  Text(widget.categoryModel.nameTurkish,
                      style: TextStyle(fontSize: 21)),
                ],
              ),
            )),
      ),
    );
  }
}
