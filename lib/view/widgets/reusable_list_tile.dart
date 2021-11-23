import 'package:flutter/material.dart';

import 'custom_text.dart';

class ReusableTile extends StatelessWidget {
  final String tileTitle;
  final String iconImage;
  final Function onTilePressed;
  ReusableTile({this.tileTitle, this.iconImage, this.onTilePressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
      child: ListTile(
        onTap: onTilePressed,
        contentPadding: EdgeInsets.only(right: 20.0),
        title: CustomText(
          text: tileTitle,
          size: 20.0,
        ),
        leading: Image.asset(iconImage),
        trailing: tileTitle != 'Log Out'
            ? Icon(Icons.arrow_forward_ios_outlined)
            : null,
      ),
    );
  }
}
