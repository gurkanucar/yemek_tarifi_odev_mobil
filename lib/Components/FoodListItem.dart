import 'package:flutter/material.dart';
import 'package:yemek_tarifi_odev_mobil/models/FoodModel.dart';

class FoodListItem extends StatefulWidget {
  FoodModel foodModel;

  FoodListItem({@required this.foodModel});

  @override
  _FoodListItemState createState() => _FoodListItemState();
}

class _FoodListItemState extends State<FoodListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.amber),
          borderRadius: BorderRadius.circular(20),
          color: Colors.white),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(height: 10),
          Material(
            elevation: 1,
            color: Colors.white,
            child: InkWell(
              onTap: () {
                print("kullaniciya tıklandi");
              },
              child:Padding(
                padding: EdgeInsets.only(bottom: 10),
                child:  Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: CircleAvatar(
                        backgroundColor: Colors.amber,
                        child: Text(
                          widget?.foodModel?.user?.username != null
                              ? widget.foodModel.user.username[0].toUpperCase()
                              : "U",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      child: Text(
                        "UserName",
                        style: TextStyle(fontSize: 17),
                      ),
                      flex: 5,
                    )
                  ],
                ),
              )
            ),
          ),
        ],
      ),
    );
  }
}
