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
        setState(() {
          categories = value;
          isLoading = false;
          print("Categories Length: " + categories.length.toString());
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading == false && categories != null && categories.length > 0
        ? Material(
            elevation: 10,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
                bottomLeft: Radius.circular(50)),
            child: Container(
              //  color: Colors.amber,
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width ,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  //physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  key: UniqueKey(),
                  itemCount: null == categories ? 0 : categories.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FilterByCategoryPage(
                                      categoryModel: categories[index])));
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
                              },
                            ),
                            SizedBox(
                              width: 15,
                            )
                          ],
                        ));
                  }),
            ),
          )
        : isLoading == false && categories.length == 0 && categories != null
            ? SizedBox()
            : CircularProgressIndicator();
  }
}
