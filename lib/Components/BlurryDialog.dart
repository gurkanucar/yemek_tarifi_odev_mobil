import 'dart:ui';
import 'package:flutter/material.dart';


class BlurryDialog extends StatelessWidget {

  String title;
  String content;
  VoidCallback continueCallBack;

  BlurryDialog(this.title, this.content, this.continueCallBack);
  TextStyle textStyle = TextStyle (color: Colors.black,fontSize: 20);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child:  AlertDialog(
          title: new Text(title,style: textStyle,),
          content: new Text(content, style: textStyle,),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Onayla",style: TextStyle(color: Colors.red,fontSize: 18),),
              onPressed: () {
                continueCallBack();
              },
            ),
            SizedBox(width: 15,),
            new FlatButton(
              child: Text("İptal",style: TextStyle(fontSize: 18),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ));
  }
}