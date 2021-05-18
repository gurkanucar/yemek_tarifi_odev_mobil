import 'package:flutter/material.dart';
import 'package:yemek_tarifi_odev_mobil/Components/FoodListGrid.dart';
import 'package:yemek_tarifi_odev_mobil/GlobalVariables.dart';

class SavedRecipesPage extends StatefulWidget {
  @override
  _SavedRecipesPageState createState() => _SavedRecipesPageState();
}

class _SavedRecipesPageState extends State<SavedRecipesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    /*appBar: AppBar(
          title: Text(
            "Kayıtlı Yemeklerim",
            style: TextStyle(color: Colors.amber),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
        ),*/
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Text("Kayıtlı Yemeklerim",style: TextStyle(fontSize: 25),),
              SizedBox(
                height: 25,
              ),
              FoodListGrid(
                savedRecipes: true,
                userId: GlobalVariables.USER_ID,
              ),
            ],
          )
        ));
  }
}
