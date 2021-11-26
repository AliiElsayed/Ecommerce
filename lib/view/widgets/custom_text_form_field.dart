import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  final String titleText;
  final String hint;
  final Function validate;
  final Function onSave;
  final Color hintColor;

  CustomTextFormField(
      {this.titleText, this.validate, this.onSave, this.hint, this.hintColor=Colors.grey,});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          text: titleText,
          fontColor: Colors.grey,
          size: 16.0,
          alignment: Alignment.topLeft,
        ),
        TextFormField(
          validator: validate,
          onSaved: onSave,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(5.0),
            hintText: hint,
            hintStyle: TextStyle(
              color: hintColor,
              fontSize: 18.0
            ),
            // labelText: 'Email',
            // labelStyle: TextStyle(color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
