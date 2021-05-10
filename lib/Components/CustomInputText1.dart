import 'package:flutter/material.dart';

class CustomInputText1 extends StatefulWidget {

  String hint;
  String errorMessage;
  Function onChanged;
  TextEditingController tcontrol;
  Size size;
  double fontSize;
  int showError;
  int isNumeric;

  CustomInputText1({@required this.tcontrol,@required this.fontSize,@required this.hint,@required this.isNumeric, @required this.onChanged,@required this.size,@required this.showError,@required this.errorMessage});


  @override
  _CustomInputText1State createState() => _CustomInputText1State();
}

class _CustomInputText1State extends State<CustomInputText1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size?.width !=null ? widget.size.width : 340,
      height: widget.size?.height !=null ? widget.size.height : 70,
      child:  TextFormField(
        //onChanged: widget.onChanged,
        controller: widget.tcontrol,
        autofocus: false,
        style: TextStyle(fontSize: widget.fontSize),
        keyboardType: widget.isNumeric==1 ? TextInputType.number:TextInputType.text,
        //initialValue: widget.hint,
        decoration: InputDecoration(
          errorStyle: TextStyle(fontSize: 16),
          hintText: widget.hint,
          errorText: widget.showError==1?widget.errorMessage : null,
          border: new OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(30.0),
            ),
          ),
        ),
      ),
    );
  }
}
