import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yemek_tarifi_odev_mobil/Components/CustomButton.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(100),
                      bottomLeft: Radius.circular(100)),
                ),
                child: Center(
                  child: Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.03),
                      child: Text(
                        "Giriş Yap",
                        style: TextStyle(
                            fontSize: 50,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                )),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              margin: EdgeInsets.only(top: 20),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: "Email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              margin: EdgeInsets.only(top: 20),
              child: TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            CustomButton(
                size: Size(MediaQuery.of(context).size.width * 0.7, 45),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                  ],
                ),
                onPressed: () {},
                color: Colors.amber),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Text(
              "Don't have an account?",
              style: TextStyle(color: Colors.amber, fontSize: 20),
            ),
          ],
        ),
      )),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
    );
  }
}
