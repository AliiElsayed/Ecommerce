import 'package:flutter/material.dart';

class CustomSocialButton extends StatelessWidget {
  final String btnTitle;
  final String imgPath;
  final Function onPress;
  CustomSocialButton({this.btnTitle, this.imgPath, this.onPress});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextButton(
        onPressed: onPress,
        child: Padding(
          padding: EdgeInsets.only(left: 20.0, top: 8, bottom: 8, right: 20.0),
          child: Row(
            children: [
              Image.asset(imgPath),
              SizedBox(
                width: 30.0,
              ),
              Text(
                btnTitle,
                style: TextStyle(fontSize: 17.0, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
