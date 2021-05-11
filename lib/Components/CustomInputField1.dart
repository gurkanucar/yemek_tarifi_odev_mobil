import 'package:flutter/material.dart';

class CustomInputField1 extends StatefulWidget {

  String hint;
  String label;
  String errorMessage;
  TextEditingController tcontrol;
  Size size;
  double fontSize;
  int showError;
  int isNumeric;
  int maxLines;
  bool filled;

  CustomInputField1({this.filled,@required this.maxLines,@required this.label,@required this.fontSize,@required this.hint,@required this.isNumeric, @required this.tcontrol,@required this.size,@required this.showError,@required this.errorMessage});


  @override
  _CustomInputField1State createState() => _CustomInputField1State();
}

class _CustomInputField1State extends State<CustomInputField1> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      height: widget.maxLines * 24.0,
      child: TextField(
        controller: widget.tcontrol,
        style: TextStyle(fontSize: widget.fontSize),
        maxLines: widget.maxLines,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.amber),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.amber),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.amber),
          ),
          errorStyle: TextStyle(fontSize: 16),
          errorText: widget.showError==1?widget.errorMessage : null,
          labelStyle: TextStyle(fontSize: widget.fontSize),
          labelText: widget.label,
          hintText: widget.hint,
          filled: widget.filled==null ? true : widget.filled,
        ),
      ),
    );
  }
}
