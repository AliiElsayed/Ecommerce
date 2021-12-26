import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'custom_text.dart';

class CustomTextFormField extends StatefulWidget {
  final String titleText;
  final String hint;
  final Function validate;
  final Function onSave;
  final Color hintColor;
  //final bool hidePassword;
  bool hidePassword;

  CustomTextFormField({
    this.titleText,
    this.validate,
    this.onSave,
    this.hint,
    this.hintColor = Colors.grey,
    this.hidePassword = false,
  });

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          text: widget.titleText,
          fontColor: Colors.grey,
          size: 16.0,
          alignment: Alignment.topLeft,
        ),
        TextFormField(
          validator: widget.validate,
          onSaved: widget.onSave,
          obscureText: widget.hidePassword,
          decoration: InputDecoration(
            helperText: '',
            contentPadding: EdgeInsets.all(5.0),
            hintText: widget.hint,
            hintStyle: TextStyle(color: widget.hintColor, fontSize: 18.0),
            suffixIcon: widget.titleText == 'Password'? IconButton(
              icon: widget.hidePassword
                  ? Icon(Icons.visibility_outlined)
                  : Icon(Icons.visibility_off_outlined),
              onPressed: () {
                setState(() {
                  widget.hidePassword = !widget.hidePassword ;
                });
              },
            ):null,
            // labelText: 'Email',
            // labelStyle: TextStyle(color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
