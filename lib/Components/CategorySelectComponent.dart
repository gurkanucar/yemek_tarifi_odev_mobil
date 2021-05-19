import 'package:flutter/material.dart';
import 'package:yemek_tarifi_odev_mobil/Components/CategorySelectItemComponent.dart';
import 'package:yemek_tarifi_odev_mobil/models/CategoryModel.dart';
import 'package:yemek_tarifi_odev_mobil/services/CategoryService.dart';

import '../GlobalVariables.dart';

class CategorySelectComponent extends StatefulWidget {
  List<CategoryModel> categories = GlobalVariables.CATEGORY_LIST.toList();
  List<CategoryModel> categoriesAll;
  bool onlyShow = false;

  CategorySelectComponent(
      {@required this.categories, @required this.categoriesAll, this.onlyShow});

  @override
  _CategorySelectComponentState createState() =>
      _CategorySelectComponentState();
}

class _CategorySelectComponentState extends State<CategorySelectComponent> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      //  categories = widget.categories;
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.categoriesAll != null
        ? Material(
            color: Colors.transparent,
            child: Container(
              //  color: Colors.amber,
              height: widget.onlyShow == false ? MediaQuery.of(context).size.height * 0.4 : MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.95,
              child: GridView.builder(
                  shrinkWrap: true,
                  //physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 3.0,
                    mainAxisSpacing: 3.0,
                  ),
                  key: UniqueKey(),
                  itemCount: null == widget.categoriesAll
                      ? 0
                      : widget.categoriesAll.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => FilterByCategoryPage(categoryModel:categories[index])));
                        },
                        child: Column(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            CategorySelectItemCompnent(
                              onlyShow:widget.onlyShow,
                              categoryModel: widget.categoriesAll[index],
                            ),
                            SizedBox(
                              width: 15,
                            )
                          ],
                        ));
                  }),
            ),
          )
        : CircularProgressIndicator();
  }
}
