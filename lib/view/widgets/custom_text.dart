import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double size;
  final Color fontColor;
  final Alignment alignment;
  final double linesHeight;

  CustomText({
    this.text,
    this.size,
    this.fontColor,
    this.alignment = Alignment.topLeft,
    this.linesHeight = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text,
        style: TextStyle(
          height: linesHeight,
          fontSize: size,
          color: fontColor,
        ),
      ),
    );
  }
}
