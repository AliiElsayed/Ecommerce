import 'package:e_commerce/constants.dart';
import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String btnText;
  final Function onPress;
  final Color btnBackgroundColor;
  final Color btnTextColor;

  CustomButton(
      {this.btnText,
      this.onPress,
      this.btnBackgroundColor = kPrimaryColor,
      this.btnTextColor= Colors.white});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: btnBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
            side: BorderSide(width: 1.0, color: kPrimaryColor),
          ),
        ),
        onPressed: onPress,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: CustomText(
            text: btnText,
            fontColor: btnTextColor,
            alignment: Alignment.center,
            size: 18.0,
          ),
        ),
      ),
    );
  }
}
