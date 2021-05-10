import 'package:flutter/material.dart';
import 'package:yemek_tarifi_odev_mobil/Components/CommentComponent.dart';
import 'package:yemek_tarifi_odev_mobil/Components/CommentListItem.dart';
import 'package:yemek_tarifi_odev_mobil/Components/CommentList.dart';
import 'package:yemek_tarifi_odev_mobil/Components/CustomButton.dart';
import 'package:yemek_tarifi_odev_mobil/Components/CustomInputField1.dart';
import 'package:yemek_tarifi_odev_mobil/Components/FoodList.dart';
import 'package:yemek_tarifi_odev_mobil/Components/FoodListGrid.dart';
import 'package:yemek_tarifi_odev_mobil/Components/FoodListItem.dart';
import 'package:yemek_tarifi_odev_mobil/models/CommentModel.dart';
import 'package:yemek_tarifi_odev_mobil/models/FoodModel.dart';
import 'package:yemek_tarifi_odev_mobil/pages/LoginPage.dart';
import 'package:yemek_tarifi_odev_mobil/pages/MyProfilePage.dart';
import 'package:yemek_tarifi_odev_mobil/services/FoodService.dart';

class RouterPage extends StatefulWidget {
  @override
  _RouterPageState createState() => _RouterPageState();
}

class _RouterPageState extends State<RouterPage> {
  List<FoodModel> _foods;
  bool _loading;

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 50, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[

    CommentComponent(foodID: 1,),

    FoodList(),
    // CommentItem(commentModel: new CommentModel()),
    // CommentList(foodId: 1),




    MyProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void getFoods() {
    _loading = true;
    FoodService.getFoods().then((value) {
      setState(() {
        _foods = value;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_circle_outline),
                label: 'Oluştur',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.amber[800],
            onTap: _onItemTapped,
          ),
          body: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
        ));
  }
}
