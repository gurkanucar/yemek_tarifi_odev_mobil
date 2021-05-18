import 'package:flutter/material.dart';
import 'package:yemek_tarifi_odev_mobil/Components/CategorySelectItemComponent.dart';
import 'package:yemek_tarifi_odev_mobil/models/CategoryModel.dart';
import 'package:yemek_tarifi_odev_mobil/services/CategoryService.dart';

class CategorySelectComponent extends StatefulWidget {
  @override
  _CategorySelectComponentState createState() =>
      _CategorySelectComponentState();
}

class _CategorySelectComponentState extends State<CategorySelectComponent> {
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
        print(categories.toString());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading==false && categories!=null ? Material(
        child: Container(
        //  color: Colors.amber,
        // height: MediaQuery.of(context).size.height * 0.23,
        // width: MediaQuery.of(context).size.width * 0.95,
        child: ListView.builder(
            //physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            key: UniqueKey(),
            itemCount: null == categories ? 0 : categories.length,
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: (){
                   // Navigator.push(context, MaterialPageRoute(builder: (context) => FilterByCategoryPage(categoryModel:categories[index])));
                  },
                  child: Column(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      CategorySelectItemCompnent(
                        selected: false,
                        categoryModel: categories[index],
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
