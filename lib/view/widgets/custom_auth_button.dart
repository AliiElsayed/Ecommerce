import 'package:e_commerce/constants.dart';
import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomAuthButton extends StatelessWidget {
  final String btnText;
  final Function onPress;

  CustomAuthButton({this.btnText, this.onPress});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onPressed: onPress,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: CustomText(
            text: btnText,
            fontColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
