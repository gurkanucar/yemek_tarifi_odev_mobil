import 'package:flutter/material.dart';
import 'package:yemek_tarifi_odev_mobil/models/CategoryModel.dart';

import '../GlobalVariables.dart';

class CategorySelectItemCompnent extends StatefulWidget {
  CategoryModel categoryModel;
  bool create;

  CategorySelectItemCompnent({
    @required this.categoryModel,@required this.create
  });

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
                      if (selected == true) {
                        GlobalVariables.CATEGORY_LIST.add(widget.categoryModel);
                      } else {
                        GlobalVariables.CATEGORY_LIST.removeWhere(
                            (item) => item.id == widget.categoryModel.id);
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
                            style: TextStyle(fontSize: 21)),
                      ],
                    ),
                  )),
            ),
          )
        : Container();
  }
}
