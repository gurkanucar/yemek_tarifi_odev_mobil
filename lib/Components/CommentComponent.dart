import 'package:flutter/material.dart';
import 'package:yemek_tarifi_odev_mobil/Constans.dart';
import 'package:yemek_tarifi_odev_mobil/models/CommentModel.dart';
import 'package:yemek_tarifi_odev_mobil/models/FoodModel.dart';
import 'package:yemek_tarifi_odev_mobil/services/CommentService.dart';

import 'CustomButton.dart';
import 'CustomInputField1.dart';

class CommentComponent extends StatefulWidget {
  int foodID;
  Function onClick;

  CommentComponent({@required this.foodID,@required this.onClick});

  @override
  _CommentComponentState createState() => _CommentComponentState();
}

class _CommentComponentState extends State<CommentComponent> {
  String _comment = "";
  TextEditingController tcontrol = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: <Widget>[
          CustomInputField1(
              maxLines: 5,
              fontSize: 21,
              hint: "Yorumunuz",
              isNumeric: 0,
              tcontrol: tcontrol,
              size: Size(50, 60)),
          Positioned.fill(
              child: Align(
                alignment: Alignment.bottomRight,
                child: CustomButton(
                  child: Icon(
                    Icons.send,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    CommentModel comment = new CommentModel();
                    comment.userId = Constants.USER_ID;
                    comment.comment = tcontrol.text;
                    FoodModel food=new FoodModel();
                    food.id=widget.foodID;
                    CommentService.createComment(food, comment);
                    tcontrol.clear();
                    widget.onClick();
                  },
                  color: Colors.amber,
                  size: Size(50, 50),
                ),
              ))
        ],
    );
  }
}
