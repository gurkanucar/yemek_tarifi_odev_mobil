import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yemek_tarifi_odev_mobil/Components/CategoryListGrid.dart';
import 'package:yemek_tarifi_odev_mobil/Constans.dart';
import 'package:yemek_tarifi_odev_mobil/models/FoodModel.dart';
import 'package:yemek_tarifi_odev_mobil/services/FoodService.dart';

import 'CustomInputText1.dart';
import 'FoodList.dart';

class SearchFoodComponent extends StatefulWidget {

  bool isFirst=false;

  SearchFoodComponent(@required this.isFirst);

  @override
  _SearchFoodComponentState createState() => _SearchFoodComponentState();
}

class _SearchFoodComponentState extends State<SearchFoodComponent> {
  List<FoodModel> _foods;
  bool _loading = false;
  TextEditingController textEditingController = new TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textEditingController.text = Constants.SEARCHED;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: widget.isFirst==true ? PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.3),
          child: Container(
            padding:
                const EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Material(
                // borderRadius: BorderRadius.circular(30),
                //elevation: 2,
                child: Container(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: textEditingController,
                      // textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        suffixIcon: InkWell(
                          child: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          onTap: () {
                            setState(() {
                              _loading = true;
                              Constants.SEARCHED = textEditingController.text;
                              textEditingController.text = Constants.SEARCHED;

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          SearchFoodComponent(false)));

                              _loading = false;
                            });
                          },
                        ),
                        hintText: " Yemek ara...",
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(30.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).viewInsets.bottom,
                  ),
                ],
              ),
            )),
          ),
        ):AppBar(title: Text("Arama Yap"),backgroundColor: Colors.amber,),
        body: SingleChildScrollView(
          child: widget.isFirst == false
              ? FoodList(
                  categoryID: -2,
                  searched: Constants.SEARCHED,
                )
              : SingleChildScrollView(
            child: Column(
              children: [
                CategoryListGrid(),
                SizedBox(height: 30,)
              ],
            ),
          ),
        ));
  }
}
