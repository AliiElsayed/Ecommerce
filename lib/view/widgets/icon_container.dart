import 'package:flutter/material.dart';

import '../../constants.dart';

class IconContainer extends StatelessWidget {
  final IconData icon;
  final Function onIconPressed;
  IconContainer({
    this.icon,
    this.onIconPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.0,
      width: 45.0,
      margin: EdgeInsets.only(left: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.0),
        shape: BoxShape.rectangle,
        color: Colors.grey.shade200,
        border: Border.all(
          color: Colors.grey.shade400,
        ),
      ),
      child: IconButton(
        icon: Icon(
          icon,
          color: kPrimaryColor,
          size: 28.0,
        ),
        onPressed: onIconPressed,
      ),
    );
  }
}
