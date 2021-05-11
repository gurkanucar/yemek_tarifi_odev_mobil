import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IngredientsComponent extends StatefulWidget {
  final Function onTap;
  final String name;
  final String count;
  final Function onChangeName;
  final Function onChangeCount;

  IngredientsComponent({
    @required this.onTap,
    @required this.name,
    @required this.count,
    @required this.onChangeName,
    @required this.onChangeCount,
  });

  @override
  _IngredientsComponentState createState() => _IngredientsComponentState();
}

class _IngredientsComponentState extends State<IngredientsComponent> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          color: Color(0xffffffff),
        ),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.85,
                ),
                InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                          //color: Colors.black
                          ),
                      margin: EdgeInsets.only(top: 3, right: 5),
                      alignment: Alignment.topRight,
                      child: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                    onTap: widget.onTap),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                    margin: EdgeInsets.only(right: 20),
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: TextFormField(
                      initialValue: widget.name,
                        onChanged: widget.onChangeName,
                        maxLines: 2,
                        decoration: InputDecoration(
                          hintText: "Malzeme",
                        ))),
                Icon(Icons.close),
                Container(
                    margin: EdgeInsets.only(left: 20),
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: TextFormField(
                      initialValue: widget.count,
                        onChanged: widget.onChangeCount,
                        maxLines: 2,
                        decoration: InputDecoration(
                          hintText: "Miktar",
                        ))),
              ],
            ),
          ],
        ));
  }
}
