import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yemek_tarifi_odev_mobil/Components/CustomButton.dart';
import 'package:yemek_tarifi_odev_mobil/GlobalVariables.dart';
import 'package:yemek_tarifi_odev_mobil/pages/RouterPage.dart';
import 'package:yemek_tarifi_odev_mobil/services/ToastService.dart';
import 'package:yemek_tarifi_odev_mobil/services/UserService.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String loginPassword = "";
  String loginPassword2 = "";
  String loginUsername = "";

  bool showErrorUsername = false;
  bool showErrorPass1 = false;
  bool showErrorPass2 = false;

  bool isRegister = false;

  String validateUsername(String value) {
    if ((value.length < 5 || value.length > 25) && value.isNotEmpty) {
      return "Lütfen geçerli bir kullanıcı adı girin";
    }
    return null;
  }

  String validatePassword(String value) {
    if (!(value.length > 5) && value.isNotEmpty) {
      return "Password 5 karakterden büyük olmalı!";
    }
    return null;
  }

  String validatePassword2(String value) {
    if (!(value.length > 5) && value.isNotEmpty) {
      return "Password 5 karakterden büyük olmalı!";
    } else if (loginPassword != loginPassword2) {
      return "Passwordler eşleşmiyor!";
    }

    return null;
  }

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
                        isRegister == false ? "Giriş Yap" : "Kayıt Ol",
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
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.amber),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.amber,
                    ),
                    labelText: "Username",
                    labelStyle: TextStyle(color: Colors.amber),
                    errorText: validateUsername(loginUsername),
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
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.amber,
                    ),
                    errorText: validatePassword(loginPassword),
                    labelText: "Password",
                    labelStyle: TextStyle(color: Colors.amber),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.amber),
                      borderRadius: BorderRadius.circular(30),
                    ),
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
                      isRegister == false ? Icons.send : Icons.person,
                      color: Colors.white,
                    ),
                  ],
                ),
                onPressed: () async {
                  loginPassword = "admin123";
                  if (isRegister == false) {
                    if (loginUsername.isEmpty || loginPassword.isEmpty) {
                      showErrorDialog("Lütfen boş alan bırakmayın!");
                    } else {
                      print(loginUsername + "  " + loginPassword);
                      loginPassword = "admin123";
                      await UserService.login(loginUsername, loginPassword)
                          .then((value) {
                        if (value != null) {
                          if (GlobalVariables.ROLE != "USER") {
                            ToastService.showToast(
                                context, "Hoşgeldiniz," + GlobalVariables.ROLE);
                          }

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RouterPage()));
                        } else {
                          showErrorDialog("Kullanıcı bilgisi bulunamadı!");
                        }
                      });
                    }
                  } else {
                    if (loginPassword == loginPassword2) {
                      UserService.register(loginUsername, loginPassword)
                          .then((value) {
                        if (value != null) {
                          setState(() {
                            isRegister = false;
                            _showToast(context, "Kayıt olundu");
                          });
                        } else {
                          showErrorDialog(
                              "Lütfen farklı bir kullanıcı adı deneyin!");
                        }
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
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.amber),
                borderRadius: BorderRadius.circular(30),
              ),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.amber,
              ),
              labelText: "Password",
              labelStyle: TextStyle(color: Colors.amber),
              errorText: validatePassword2(loginPassword2),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
        ),
      );
    } else {
      return SizedBox(height: MediaQuery.of(context).size.height * 0.01);
    }
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
