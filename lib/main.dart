import 'package:flutter/material.dart';
import 'package:yemek_tarifi_odev_mobil/pages/login_page.dart';
import 'package:yemek_tarifi_odev_mobil/pages/router_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RouterPage(),
    );
  }
}
