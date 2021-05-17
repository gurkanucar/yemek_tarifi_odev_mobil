import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yemek_tarifi_odev_mobil/Components/CustomInputText1.dart';
import 'package:yemek_tarifi_odev_mobil/GlobalVariables.dart';
import 'package:yemek_tarifi_odev_mobil/models/IngredientModel.dart';

class IngredientsPage extends StatefulWidget {
  @override
  _IngredientsPageState createState() => _IngredientsPageState();
}

class _IngredientsPageState extends State<IngredientsPage> {
  List<IngredientModel> ingredientModels = new List();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (GlobalVariables?.INGREDIENT_LIST!=null && GlobalVariables?.INGREDIENT_LIST?.length > 0) {
      ingredientModels = GlobalVariables.INGREDIENT_LIST;
    } else {
      IngredientModel temp = new IngredientModel("", "");
      ingredientModels.add(temp);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Malzeme Listesi"),
          backgroundColor: Colors.amber,
          actions: [
            Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      ingredientModels.add(new IngredientModel("", ""));
                      GlobalVariables.INGREDIENT_LIST = ingredientModels;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 20, top: 15),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Icon(
                        Icons.add_circle,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: ListView.builder(
              key: UniqueKey(),
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: null == ingredientModels ? 0 : ingredientModels.length,
              itemBuilder: (context, index) {
                return new Container(
                    margin: EdgeInsets.only(top: 5, left: 10, right: 10),
                    child: Column(
                      children: [
                        Material(
                            child: InkWell(
                          onTap: () {
                            setState(() {
                              ingredientModels.removeAt(index);
                              GlobalVariables.INGREDIENT_LIST = ingredientModels;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 20, top: 10),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Icon(
                                Icons.delete,
                                size: 30,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomInputText1(
                              initialVal: ingredientModels[index].name,
                             onChanged: (text) {
                                print("malzeme adi: $text");
                                ingredientModels[index].name=text;
                                GlobalVariables.INGREDIENT_LIST = ingredientModels;
                              },
                              hint: "Malzeme adı",
                              size: Size(
                                  MediaQuery.of(context).size.width * 0.4, 70),
                            ),
                            Icon(
                              Icons.clear,
                              size: 30,
                            ),
                            CustomInputText1(
                              initialVal: ingredientModels[index].count,
                              onChanged: (text) {
                                print("malzeme adi: $text");
                                ingredientModels[index].count=text;
                                GlobalVariables.INGREDIENT_LIST = ingredientModels;
                              },
                              hint: "Adet",
                              size: Size(
                                  MediaQuery.of(context).size.width * 0.4, 70),
                            )
                          ],
                        ),
                      ],
                    ));
              }),
        ));
  }
}
