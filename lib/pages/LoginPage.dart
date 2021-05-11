import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yemek_tarifi_odev_mobil/Components/CustomButton.dart';
import 'package:yemek_tarifi_odev_mobil/pages/RouterPage.dart';
import 'package:yemek_tarifi_odev_mobil/services/UserService.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String loginPassword = "";
  String loginPassword2 = "";
  String loginUsername="";

  bool isRegister = false;

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
                       isRegister==false ? "Giriş Yap": "Kayıt Ol",
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
                onChanged: (text) {
                  setState(() {
                    loginUsername = text;
                  });
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: "Username",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              margin: EdgeInsets.only(top: 20),
              child: TextFormField(
                obscureText: true,
                onChanged: (text) {
                  setState(() {
                    loginPassword = text;
                  });
                },
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    labelText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
              ),
            ),
            registerWidget(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            CustomButton(
                size: Size(MediaQuery.of(context).size.width * 0.7, 45),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      isRegister == false ? "Login" : "Register",
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
                onPressed: () async {
                  if (isRegister == false) {
                    print(loginUsername + "  " + loginPassword);
                    loginPassword="admin123";
                    await UserService.login(loginUsername, loginPassword).then(
                        (value) => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RouterPage())));
                  } else {
                    if (loginPassword == loginPassword2) {
                      print(loginUsername + "  " + loginPassword);
                      print("register olundu");
                      UserService.register(loginUsername, loginPassword)
                          .then((value) {
                        setState(() {
                          isRegister = false;
                        });
                      });
                    }
                  }
                },
                color: Colors.amber),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            GestureDetector(
              onTap: () {
                setState(() {
                  isRegister = !isRegister;
                });
              },
              child: Text(
                isRegister == false
                    ? "Don't have an account?"
                    : "Login your account!",
                style: TextStyle(color: Colors.amber, fontSize: 20),
              ),
            )
          ],
        ),
      )),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
    );
  }

  Widget registerWidget() {
    if (isRegister == true) {
      return Container(
        width: MediaQuery.of(context).size.width * 0.9,
        margin: EdgeInsets.only(top: 20),
        child: TextFormField(
          obscureText: true,
          onChanged: (text) {
            setState(() {
              loginPassword2 = text;
            });
          },
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock),
              labelText: "Password",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
        ),
      );
    } else {
      return SizedBox(height: MediaQuery.of(context).size.height * 0.01);
    }
  }
}
