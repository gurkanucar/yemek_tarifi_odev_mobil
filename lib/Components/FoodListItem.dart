import 'package:flutter/material.dart';
import 'package:yemek_tarifi_odev_mobil/models/FoodModel.dart';

import '../Constans.dart';

class FoodListItem extends StatefulWidget {
  FoodModel foodModel;
  Function onPressed;

  FoodListItem({@required this.foodModel, @required this.onPressed});

  @override
  _FoodListItemState createState() => _FoodListItemState();
}

class _FoodListItemState extends State<FoodListItem> {
  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 20,
        child: InkWell(
          onTap: widget.onPressed,
          child: Container(
            margin: EdgeInsets.all(10),
            // height: MediaQuery.of(context).size.height * 0.62,
            width: MediaQuery.of(context).size.width * 0.96,
            decoration: BoxDecoration(
                //border: Border.all(color: Colors.amber),
                borderRadius: BorderRadius.circular(20),
                color: Colors.white),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: CircleAvatar(
                                backgroundColor: Colors.amber,
                                child: Text(
                                  widget?.foodModel?.user?.username != null
                                      ? widget.foodModel.user.username[0]
                                          .toUpperCase()
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
                                widget?.foodModel?.user != null
                                    ? widget?.foodModel?.user.username
                                    : "UserName",
                                style: TextStyle(fontSize: 17),
                              ),
                              flex: 5,
                            )
                          ],
                        ),
                      )),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: FadeInImage.assetNetwork(
                    fit: BoxFit.cover,
                    placeholder: 'assets/loading.gif',
                    image: widget?.foodModel?.image?.url != null
                        ? Constants.BASE_URL +
                        Constants.IMAGE_BASE_URL +
                        widget.foodModel?.image?.name
                        : 'assets/loading.gif',
                  ),
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.only(left: 10, top: 10),
                      child: Text(
                        widget?.foodModel?.foodName != null
                            ? widget?.foodModel?.foodName
                            : "Yemek Adı",
                        style:
                            TextStyle(fontSize: 28, color: Color(0xff4C4C4C),),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.all(15),
                    child: Text(
                      widget?.foodModel?.recipe,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 19, color: Color(0xff4C4C4C)),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Row(
                      children: [
                        Icon(Icons.timer),
                        SizedBox(
                          width: 5,
                        ),
                        Text(widget?.foodModel?.prepTime?.toString() + " dk",
                            style: TextStyle(fontSize: 18))
                        /* Text(
                    "20 dk",
                    style: TextStyle(fontSize: 18),
                  )*/
                      ],
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.people),
                        SizedBox(
                          width: 5,
                        ),
                        widget?.foodModel?.prepTime > 1
                            ? Text(
                                (widget?.foodModel?.personCount - 1)
                                        .toString() +
                                    " - " +
                                    (widget?.foodModel?.personCount + 1)
                                        .toString() +
                                    " kişilik",
                                style: TextStyle(fontSize: 18))
                            : Text(
                                (widget?.foodModel?.personCount).toString() +
                                    " kişilik",
                                style: TextStyle(fontSize: 18)),
                        /*  Text(
                    "2-4 kişilik",
                    style: TextStyle(fontSize: 18),
                  ),*/
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
