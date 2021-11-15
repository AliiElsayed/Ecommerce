import 'package:e_commerce/constants.dart';
import 'package:e_commerce/model/product_model.dart';
import 'package:e_commerce/view/widgets/custom_auth_button.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final ProductModel model;

  DetailsScreen({@required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            leading: IconButton(icon: Icon(Icons.arrow_back_outlined),
                onPressed: (){}),
            actions: [
              IconButton(icon: Icon(Icons.star_border_outlined),
                  onPressed: (){}),
            ],
            title: Text(model.name) ,


          ),
        ],
      )
    );
  }
}
/*
  AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: Icon(Icons.arrow_back_outlined),
        actions: [
          IconButton(icon:Icon(Icons.star_border),onPressed: (){},),
        ],
      ),
  */
