import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:yemek_tarifi_odev_mobil/Components/CategorySelectComponent.dart';



import 'package:yemek_tarifi_odev_mobil/Components/CustomInputField1.dart';

import 'package:yemek_tarifi_odev_mobil/Components/DropDownComponent.dart';
import 'package:yemek_tarifi_odev_mobil/Components/ImagePickerComponent.dart';
import 'package:yemek_tarifi_odev_mobil/models/CategoryModel.dart';
import 'package:yemek_tarifi_odev_mobil/models/DropDownItemModel.dart';
import 'package:yemek_tarifi_odev_mobil/models/FileModel.dart';
import 'package:yemek_tarifi_odev_mobil/models/FoodModel.dart';
import 'package:yemek_tarifi_odev_mobil/models/IngredientJSONModel.dart';
import 'package:yemek_tarifi_odev_mobil/models/TempModel.dart';
import 'package:yemek_tarifi_odev_mobil/models/UserModel.dart';
import 'package:yemek_tarifi_odev_mobil/pages/IngredientsPage.dart';
import 'package:yemek_tarifi_odev_mobil/services/CategoryService.dart';
import 'package:yemek_tarifi_odev_mobil/services/FoodService.dart';

import '../GlobalVariables.dart';
import 'RouterPage.dart';

class UpdateFoodPage extends StatefulWidget {
  FoodModel foodModel;

  UpdateFoodPage({@required this.foodModel});

  @override
  _UpdateFoodPageState createState() => _UpdateFoodPageState();
}

class _UpdateFoodPageState extends State<UpdateFoodPage> {
  TextEditingController foodNameController = new TextEditingController();
  TextEditingController foodRecipeController = new TextEditingController();

  Set<DropDownItemModel> _hardnessValues = {
    new DropDownItemModel(1, "Zor"),
    new DropDownItemModel(2, "Orta"),
    new DropDownItemModel(3, "Kolay")
  };

  Set<DropDownItemModel> _personCounts = {
    new DropDownItemModel(1, "1 kişi"),
    new DropDownItemModel(2, "1-2 kişi"),
    new DropDownItemModel(3, "3 kişi"),
    new DropDownItemModel(4, "3-4 kişi"),
    new DropDownItemModel(5, "5 kişi"),
    new DropDownItemModel(6, "6 kişi"),
    new DropDownItemModel(7, "7 kişi"),
    new DropDownItemModel(8, "8 kişi"),
    new DropDownItemModel(9, "9 kişi"),
    new DropDownItemModel(10, "10+ kişi"),
    new DropDownItemModel(11, "100+ kişi")
  };

  Set<DropDownItemModel> _prepTime = {
    new DropDownItemModel(1, "1 dk"),
    new DropDownItemModel(2, "2 dk"),
    new DropDownItemModel(3, "3 dk"),
    new DropDownItemModel(5, "5 dk"),
    new DropDownItemModel(10, "10 dk"),
    new DropDownItemModel(15, "15 dk"),
    new DropDownItemModel(20, "20 dk"),
    new DropDownItemModel(25, "25 dk"),
    new DropDownItemModel(30, "30 dk"),
    new DropDownItemModel(45, "45 dk"),
    new DropDownItemModel(60, "60 dk"),
    new DropDownItemModel(90, "90 dk"),
    new DropDownItemModel(120, "120 dk"),
    new DropDownItemModel(150, "150 dk"),
    new DropDownItemModel(180, "180+"),
  };

  String _hardnessValue;
  int _hardnessKey = -1;
  String _personCountValue;
  int _personKey = -1;
  String _prepTimeValue;
  int _prepTimeKey = -1;

  List<CategoryModel> selectedCategories = null;
  List<CategoryModel> categoriesAll;

  static List<TempModel> tempSelected = [];
  static List<TempModel> tempAll = [];

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    GlobalVariables.FOOD_IMAGE_URL = null;
    GlobalVariables.INGREDIENT_LIST = [];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    CategoryService.getCategories().then((value) {
      setState(() {
        categoriesAll = value;
        selectedCategories = widget.foodModel.categoryList;

        categoriesAll.forEach((element) {
          tempAll.add(new TempModel(element.id, element.nameTurkish));
        });

        selectedCategories.forEach((element) {
          tempSelected.add(new TempModel(element.id, element.nameTurkish));
        });

        print("BAŞLANGIÇÇÇ ____________________");
        selectedCategories.forEach((sel) {
          print(sel.nameTurkish);
        });
        print("____________________");

        //GlobalVariables.IMAGE_ID == widget.foodModel.image.name;
        foodNameController.text = widget.foodModel.foodName;
        foodRecipeController.text = widget.foodModel.recipe;
        GlobalVariables.FOOD_IMAGE_URL = GlobalVariables.BASE_URL +
            GlobalVariables.IMAGE_BASE_URL +
            widget.foodModel.image.name;

        //print(ingredientsJsonModelFromJson(widget.foodModel.ingredients)[0].name);
        GlobalVariables.INGREDIENT_LIST =
            ingredientsJsonModelFromJson(widget.foodModel.ingredients);

        _hardnessKey = widget.foodModel.hardness;
        _hardnessValue = _hardnessValues
            .toList()[int.parse(widget.foodModel.hardness.toString()) - 1]
            .getValue()
            .toString();

        _prepTimeKey = widget.foodModel.prepTime;
        _prepTimeValue = _prepTime
            .firstWhere((item) => item.key == _prepTimeKey)
            .getValue()
            .toString();

        _personKey = widget.foodModel.personCount;
        _personCountValue = _personCounts
            .firstWhere((item) => item.key == _personKey)
            .getValue()
            .toString();
      });
    });
  }

  final _multiSelectKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
            backgroundColor: Color(0xFFFFC204), title: Text("Yemek Oluştur !")),
        body: categoriesAll != null
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    ImagePickerComponent(),
                    Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.amber)),
                      child: CustomInputField1(
                          filled: false,
                          maxLines: 2,
                          fontSize: 21,
                          hint: "Yemek Adı",
                          isNumeric: 0,
                          tcontrol: foodNameController,
                          size: Size(50, 60)),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.amber)),
                      child: CustomInputField1(
                          filled: false,
                          maxLines: 9,
                          fontSize: 21,
                          hint: "Tarifi",
                          isNumeric: 0,
                          tcontrol: foodRecipeController,
                          size: Size(50, 60)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DropDownComponent(
                      options: _hardnessValues,
                      detail: "Zorluk",
                      onChange: (val) {
                        setState(
                          () {
                            _hardnessValue = val.value;
                            _hardnessKey = val.key;
                            print("Hardness: " +
                                _hardnessValue +
                                "  key: " +
                                val.key.toString());
                          },
                        );
                      },
                      dropDownValue: _hardnessValue,
                    ),
                    DropDownComponent(
                      options: _personCounts,
                      detail: "Kişi Sayısı",
                      onChange: (val) {
                        setState(
                          () {
                            _personCountValue = val.value;
                            _personKey = val.key;
                            print("Kişi sayısı: " +
                                _personCountValue +
                                "  key: " +
                                val.key.toString());
                          },
                        );
                      },
                      dropDownValue: _personCountValue,
                    ),
                    DropDownComponent(
                      options: _prepTime,
                      detail: "Hazırlama Süresi",
                      onChange: (val) {
                        setState(
                          () {
                            _prepTimeValue = val.value;
                            _prepTimeKey = val.key;
                            print("Hazırlama süresi: " +
                                _prepTimeValue +
                                "  key: " +
                                val.key.toString());
                          },
                        );
                      },
                      dropDownValue: _prepTimeValue,
                    ),
                    Container(
                        margin: EdgeInsets.all(20),
                        child: Material(
                          elevation: 20,
                          borderRadius: BorderRadius.circular(20),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            IngredientsPage()));
                              });
                            },
                            child: Row(
                              children: [
                                SizedBox(
                                    width: 56,
                                    height: 56,
                                    child:
                                        Icon(Icons.add, color: Colors.orange)),
                                Text(
                                  "Malzeme Ekle",
                                  style: TextStyle(
                                      color: Colors.orange,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19),
                                )
                              ],
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 30,
                    ),




                    /*categoriesAll
                        .map((e) => MultiSelectItem(e, e.nameTurkish))
                        .toList(),*/

                    /*MultiSelectChipField<TempModel>(
                      initialValue: tempSelected,
                      items: tempAll
                          .map((data) =>
                              MultiSelectItem<TempModel>(data, data.name))
                          .toList(),
                      onTap: (values) {
                        tempSelected = values;
                      },
                    ),*/

                    /* MultiSelectChipField<TempModel>(
                      key: _multiSelectKey,
                      initialValue: tempSelected.toList(),
                      items: tempAll.map((data) => MultiSelectItem<TempModel>(data, data.name)).toList(),
                     // icon: Icon(Icons.check),
                      onTap: (values) {
                        tempSelected = values;
                        print("____________________");
                        tempSelected.forEach((sel) {
                          print(sel.name);
                        });
                        print("____________________");
                      },
                    ),*/

                    CategorySelectComponent(
                         categoriesAll: categoriesAll,
                          categories: selectedCategories,
                       ),
                    SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    btn(),
                    SizedBox(
                      height: 20,
                    ),

                    /* Container(
                  margin: EdgeInsets.only(left: 20),
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: TextFormField(
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                    keyboardType: TextInputType.number,
                     controller: personCountController,
                      maxLines: 1,
                      decoration: InputDecoration(
                        hintText: "kişi sayısı",
                      ))),*/
                  ],
                ),
              )
            : CircularProgressIndicator(),
      ),
    );
  }

  var _backGroundColor = 0xFFffffff;
  var _fontColor = 0xFFFFC204;

  Container btn() {
    return Container(
        margin: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width * 0.9,
        height: 50.0,
        child: RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.orange)),
            onPressed: () {
              print("Gondert bakam");
              createPost();
            },
            padding: EdgeInsets.all(10.0),
            color: Color(_backGroundColor),
            textColor: Color(_fontColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Gönder",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  width: 20,
                ),
                Icon(Icons.send),
              ],
            )));
  }

  int createPost() {
    if (foodNameController.text.isEmpty ||
        foodNameController.text.length < 3 ||
        foodRecipeController.text.isEmpty ||
        foodRecipeController.text.length < 3 ||
        _hardnessKey == -1 ||
        _personKey == -1 ||
        _prepTimeKey == -1) {
      showErrorDialog("Lütfen boş alan bırakmayın!");
      return 1;
    } else if (GlobalVariables.INGREDIENT_LIST.length < 3) {
      showErrorDialog("Lütfen en az 3 malzeme ekleyin!");
      return 1;
    } else if (widget.foodModel.image.id == 0) {
      showErrorDialog("Lütfen resim seçin!");
      return 1;
    }
    FoodModel food = new FoodModel();
    food.id = widget.foodModel.id;
    food.foodName = foodNameController.text.toString();
    food.recipe = foodRecipeController.text.toString();
    food.hardness = _hardnessKey;
    food.completedCount = 0;
    food.prepTime = _prepTimeKey;
    food.personCount = _personKey;

    /* List<IngredientsJsonModel> ingredientsList =
        List<IngredientsJsonModel>.from(GlobalVariables.INGREDIENT_LIST
            .map((model) =>  ingredientsJsonModelToJson(model)));*/

    food.ingredients =
        jsonEncode(GlobalVariables.INGREDIENT_LIST).toString() + "";

    print(food.ingredients);

    food.categoryList = new List();
    UserModel user = new UserModel();
    user.id = GlobalVariables.USER_ID;
    food.user = user;
    int imageID;
    if (GlobalVariables.IMAGE_ID != 0) {
      imageID = GlobalVariables.IMAGE_ID;
    } else if (widget.foodModel.image.id != 0) {
      imageID = widget.foodModel.image.id;
    } else {
      return 1;
    }

    FileModel image = new FileModel();
    image.id = imageID;
    GlobalVariables.IMAGE_ID = 0;
    food.image = image;
    //food.image=image;

    FoodService.updateFood(food).then((value) {
      if (value != null) {
        //Navigator.pop(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => RouterPage()));
        _showToast(context, "Yemek paylaşıldı");
        GlobalVariables.INGREDIENT_LIST = [];
      } else {
        showErrorDialog("Bir hata oldu :(");
      }
    });

    return 0;
  }

  Future<void> showErrorDialog(String error) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Uyarı!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(error),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Tamam'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showToast(BuildContext context, String str) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(str),
        action: SnackBarAction(
            label: 'Tamam', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}
