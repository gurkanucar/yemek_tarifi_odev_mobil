import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

   Widget child;
   Function onPressed;
   Size size;
   Color color;

   CustomButton({@required this.child, @required this.onPressed,@required this.color,this.size,});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.size?.width !=null ? this.size.width : 250,
      height: this.size?.height !=null ? this.size.height : 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        color: this.color,
      ),
      child: new Material(
        child: new InkWell(
          onTap: onPressed,
          child: new Container(
          child: Align(
            alignment: Alignment.center,
            child: this.child,
          )
          ),
        ),
        color: Colors.transparent,
      ),

    );
  }
}
