import 'package:flutter/material.dart';

class CustomInputText1 extends StatefulWidget {

  String hint;
  Function onChanged;
  TextEditingController tcontrol;
  Size size;
  String defaultValue;
  double fontSize;
  String initialVal;

  CustomInputText1({this.initialVal,this.defaultValue,@required this.fontSize,@required this.hint, @required this.onChanged,@required this.size});


  @override
  _CustomInputText1State createState() => _CustomInputText1State();
}

class _CustomInputText1State extends State<CustomInputText1> {
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 20,bottom: 10),
        width: widget.size?.width !=null ? widget.size.width : 340,
        height: widget.size?.height !=null ? widget.size.height : 70,
        child:  TextFormField(
          initialValue: widget.initialVal,
          key: UniqueKey(),
        // controller: widget.tcontrol,
         onChanged: widget.onChanged,
          style: TextStyle(fontSize: widget.fontSize),
          decoration: InputDecoration(
            hintText: widget.hint,
            border: new OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(30.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
