import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double size;
  final Color fontColor;
  final Alignment alignment;
  final double linesHeight;
  final FontWeight weight;
  final int linesNum;
  final String fontFamily;

  CustomText({
    this.text,
    this.size,
    this.fontColor,
    this.alignment = Alignment.topLeft,
    this.linesHeight = 1.0,
    this.weight = FontWeight.w500,
    this.linesNum = 1,
    this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text,
        maxLines: linesNum,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          height: linesHeight,
          fontSize: size,
          color: fontColor,
          fontWeight: weight,
          fontFamily: fontFamily,
        ),
      ),
    );
  }
}
