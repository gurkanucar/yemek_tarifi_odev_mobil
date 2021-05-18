import 'package:flutter/material.dart';
import 'package:yemek_tarifi_odev_mobil/Components/CategorySelectItemComponent.dart';
import 'package:yemek_tarifi_odev_mobil/models/CategoryModel.dart';
import 'package:yemek_tarifi_odev_mobil/services/CategoryService.dart';

class CategorySelectComponent extends StatefulWidget {
  List<CategoryModel> categories;
  List<CategoryModel> categoriesAll;

  CategorySelectComponent(
      {@required this.categories, @required this.categoriesAll});

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
            child: Container(
              //  color: Colors.amber,
              height: MediaQuery.of(context).size.height * 0.4,
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
                              categoryModel: widget.categoriesAll[index],
                              selectedCategories: widget.categories,
                              selected: false,
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
