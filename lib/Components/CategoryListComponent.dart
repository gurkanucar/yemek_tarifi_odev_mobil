import 'package:flutter/material.dart';
import 'package:yemek_tarifi_odev_mobil/Components/CategoryListItem.dart';
import 'package:yemek_tarifi_odev_mobil/models/CategoryModel.dart';
import 'package:yemek_tarifi_odev_mobil/pages/FilterByCategoryPage.dart';
import 'package:yemek_tarifi_odev_mobil/services/CategoryService.dart';

class CategoryListComponent extends StatefulWidget {
  @override
  _CategoryListComponentState createState() => _CategoryListComponentState();
}

class _CategoryListComponentState extends State<CategoryListComponent> {
  List<CategoryModel> categories;
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CategoryService.getCategories().then((value) {
      Future.delayed(const Duration(milliseconds: 700), () {
        setState(() {
          categories = value;
          isLoading = false;
        });
      });

    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading==false ? Material(
      elevation: 10,
      borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(50), bottomLeft: Radius.circular(50)),
      child: Container(
        //  color: Colors.amber,
        height: MediaQuery.of(context).size.height * 0.23,
        width: MediaQuery.of(context).size.width * 0.95,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            //physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            key: UniqueKey(),
            itemCount: null == categories ? 0 : categories.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => FilterByCategoryPage(categoryModel:categories[index])));
                },
                  child: Column(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  CategoryListItem(
                    categoryModel: categories[index],
                    onPressed: () {
                      print(categories[index].id.toString() +
                          " id li category tiklandi");
                      //Navigator.push(context, MaterialPageRoute(builder: (context) => C(foodModel:_foods[index])));
                    },
                  ),
                  SizedBox(
                    width: 15,
                  )
                ],
              ));
            }),
      ),
    ):CircularProgressIndicator();
  }
}
