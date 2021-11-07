import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  final String titleText;
  final String hint;
  final Function validate;
  final Function onSave;

  CustomTextFormField({this.titleText, this.validate,this.onSave, this.hint});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          text: titleText,
          fontColor:Colors.grey,
          size: 14.0,
          alignment: Alignment.topLeft,
        ),
        TextFormField(
          validator: validate,
          onSaved: onSave,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(5.0),
              hintText: hint,
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
              // labelText: 'Email',
              // labelStyle: TextStyle(color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
