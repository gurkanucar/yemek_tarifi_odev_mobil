import 'package:flutter/material.dart';
import 'package:yemek_tarifi_odev_mobil/Components/CategoryListComponent.dart';

import 'package:yemek_tarifi_odev_mobil/Components/FoodList.dart';
import 'package:yemek_tarifi_odev_mobil/Components/SearchFoodComponent.dart';
import 'package:yemek_tarifi_odev_mobil/pages/MyProfilePage.dart';
import 'package:yemek_tarifi_odev_mobil/pages/SavedRecipes.dart';

import 'CreateFoodPage.dart';

class RouterPage extends StatefulWidget {
  @override
  _RouterPageState createState() => _RouterPageState();
}

class _RouterPageState extends State<RouterPage> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CategoryListComponent(),
          FoodList(
            categoryID: -1,
          ),
        ],
      ),
    ),
    SearchFoodComponent(true),
    SavedRecipesPage(),
    MyProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButton: InkWell(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.orange,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            iconSize: 32,
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              Future.delayed(Duration.zero, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateFoodPage()),
                );
              });
            },
          ),
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          unselectedItemColor: Colors.black38,
          //showUnselectedLabels: true,
          onTap: _onItemTapped,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.save_alt),
              label: 'Saved',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
      body: RefreshIndicator(
        child: _widgetOptions.elementAt(_selectedIndex),
        onRefresh: () async {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => super.widget));
        },
      ),
    );
  }
}
