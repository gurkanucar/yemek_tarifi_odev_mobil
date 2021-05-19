import 'package:flutter/material.dart';
import 'package:yemek_tarifi_odev_mobil/models/CategoryModel.dart';
import 'package:yemek_tarifi_odev_mobil/pages/FilterByCategoryPage.dart';

import '../GlobalVariables.dart';

class CategorySelectItemCompnent extends StatefulWidget {
  CategoryModel categoryModel;
  bool onlyShow;

  CategorySelectItemCompnent(
      {@required this.categoryModel, @required this.onlyShow});

  @override
  _CategorySelectItemCompnentState createState() =>
      _CategorySelectItemCompnentState();
}

class _CategorySelectItemCompnentState
    extends State<CategorySelectItemCompnent> {
  bool selected = null;

  bool checkIfIsInTheList() {
    var contain = GlobalVariables.CATEGORY_LIST
        .where((element) => element.id == widget.categoryModel.id);
    if (contain.isEmpty) {
      return false;
    } else {
      return true;
    }

    /* return
        .every((item) => item.id == widget.categoryModel.id);*/
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
    return selected != null
        ? Container(
            margin: EdgeInsets.only(left: widget.onlyShow==true ? 20:0,right: widget.onlyShow==true ? 20:0),
            width: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.width * 0.3,
            child: Material(
              color: selected == true && widget.onlyShow == false
                  ? Colors.amber
                  : Colors.white,
              elevation: 10,
              borderRadius: BorderRadius.circular(20),
              child: InkWell(
                  onTap: () {
                    setState(() {
                      selected = !selected;
                      if (selected == true && widget.onlyShow == false) {
                        GlobalVariables.CATEGORY_LIST.add(widget.categoryModel);
                      } else if (widget.onlyShow == false) {
                        GlobalVariables.CATEGORY_LIST.removeWhere(
                            (item) => item.id == widget.categoryModel.id);
                      } else if (widget.onlyShow == true) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FilterByCategoryPage(
                                    categoryModel: widget.categoryModel)));
                      }
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
                            maxLines: 1,overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 21)),
                      ],
                    ),
                  )),
            ),
          )
        : Container();
  }
}
