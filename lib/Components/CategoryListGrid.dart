import 'package:flutter/material.dart';
import 'package:yemek_tarifi_odev_mobil/models/CategoryModel.dart';
import 'package:yemek_tarifi_odev_mobil/models/FoodModel.dart';
import 'package:yemek_tarifi_odev_mobil/pages/FilterByCategoryPage.dart';
import 'package:yemek_tarifi_odev_mobil/services/CategoryService.dart';
import 'package:yemek_tarifi_odev_mobil/services/FoodService.dart';
import 'package:yemek_tarifi_odev_mobil/services/TextService.dart';

import '../GlobalVariables.dart';
import 'FoodDetail.dart';

class CategoryListGrid extends StatefulWidget {
  @override
  _CategoryListGridState createState() => _CategoryListGridState();
}

class _CategoryListGridState extends State<CategoryListGrid> {
  List<CategoryModel> _categories;
  bool _loading = true;

  void getCategories() {
    _loading = true;
    CategoryService.getCategories().then((value) {
      setState(() {
        _categories = value;
        _loading = false;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: _loading == false && _categories!=null
            ? GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _categories.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 3.0,
                  mainAxisSpacing: 3.0,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    //padding: EdgeInsets.all(20),
                    margin: EdgeInsets.only(left: 7,right: 7,top: 5),
                    child: Material(
                      elevation: 10,
                      borderRadius: BorderRadius.circular(30),
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        FilterByCategoryPage(categoryModel: _categories[index])));
                          },
                          child: Column(
                            children: [
                             Container(
                               margin: EdgeInsets.all(20),
                               child:  ClipRRect(
                                 borderRadius: BorderRadius.circular(20.0),
                                 child: FadeInImage.assetNetwork(
                                   width: MediaQuery.of(context).size.width*0.44,
                                   height: MediaQuery.of(context).size.height*0.15,
                                   fit: BoxFit.cover,
                                   placeholder: 'assets/loading.gif',
                                   image: _categories[index]?.categoryImage?.url != null
                                       ? GlobalVariables.BASE_URL +
                                       GlobalVariables.IMAGE_BASE_URL +
                                       _categories[index]?.categoryImage?.name
                                       : 'assets/loading.gif',
                                 ),
                               ),
                             ),
                              Center(
                                child: Text(TextService.checkLength(_categories[index].nameTurkish),style: TextStyle(fontSize: 20),),
                              ),
                            ],
                          )
                      ),
                    ),
                  );
                },
              )
            : CircularProgressIndicator());
  }
}
