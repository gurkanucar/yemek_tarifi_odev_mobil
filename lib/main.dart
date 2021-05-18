import 'package:flutter/material.dart';
import 'package:yemek_tarifi_odev_mobil/pages/LoginPage.dart';
import 'package:yemek_tarifi_odev_mobil/pages/RouterPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
