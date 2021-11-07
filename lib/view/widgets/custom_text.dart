import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text ;
  final double size;
  final Color fontColor;
   Alignment alignment = Alignment.topLeft;

   CustomText({ this.text,this.size,this.fontColor ,this.alignment});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment ,
      child: Text(
        text,
        style: TextStyle(
          fontSize: size,
          color: fontColor,
        ),
      ),
    );
  }
}