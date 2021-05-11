import 'package:flutter/material.dart';
import 'package:yemek_tarifi_odev_mobil/models/DropDownItemModel.dart';


class DropDownComponent extends StatefulWidget {
  Set<DropDownItemModel> options;
  String detail;
  Function onChange;
  String dropDownValue;

  DropDownComponent({
    @required this.options,
    @required this.detail,
    @required this.onChange,
    @required this.dropDownValue,
  });

  @override
  _DropDownComponentState createState() => _DropDownComponentState();
}

class _DropDownComponentState extends State<DropDownComponent> {


  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      margin: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(right: 20),
            child: Text(
              widget.detail,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            child: DropdownButton(
              hint: widget.dropDownValue == null
                  ? Text("Seçim")
                  : Text(
                      widget.dropDownValue,
                      style: TextStyle(color: Colors.orange, fontSize: 20),
                    ),
              isExpanded: true,
              iconSize: 30.0,
              style: TextStyle(color: Colors.orange),
              items: widget.options.map((DropDownItemModel item) {
                return new DropdownMenuItem<DropDownItemModel>(
                  value: item,
                  child: Text(
                    item.value,
                    style: TextStyle(fontSize: 20),
                  ),
                );
              }).toList(),
              onChanged:widget.onChange,
            ),
          )
        ],
      ),
    );
  }
}
