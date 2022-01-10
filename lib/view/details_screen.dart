import 'package:e_commerce/constants.dart';
import 'package:e_commerce/model/cart_product_model.dart';
import 'package:e_commerce/model/product_model.dart';
import 'package:e_commerce/view/widgets/custom_auth_button.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:e_commerce/view_model/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toast/toast.dart';

class DetailsScreen extends StatelessWidget {
  final ProductModel model;

  DetailsScreen({@required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 250,
            child: Image.network(
              model.image,
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    CustomText(
                      text: model.name,
                      size: 26.0,
                      weight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.40,
                          padding: EdgeInsets.symmetric(
                              horizontal: 25.0, vertical: 10.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(
                                  color: Colors.grey.shade300, width: 1.5)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: 'Size',
                                size: 16,
                              ),
                              CustomText(
                                text: model.size.toUpperCase(),
                                size: 16,
                                weight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.40,
                          padding: EdgeInsets.symmetric(
                              horizontal: 25.0, vertical: 10.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(
                                  color: Colors.grey.shade300, width: 1.5)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: 'Colour',
                                size: 16,
                              ),
                              Container(
                                height: 23.0,
                                width: 23.0,
                                decoration: BoxDecoration(
                                    color: model.color,
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(5.0)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    CustomText(
                      text: 'Details',
                      size: 26.0,
                      weight: FontWeight.bold,
                    ),
                    CustomText(
                      text: model.description,
                      size: 16.0,
                      linesHeight: 2.0,
                      linesNum: 80,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'PRICE',
                      fontColor: Colors.grey,
                      size: 15.0,
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    CustomText(
                      text: '\$ ' + model.price,
                      size: 22.0,
                      fontColor: kPrimaryColor,
                      weight: FontWeight.bold,
                    ),
                  ],
                ),
                GetBuilder<CartController>(
                  init: CartController(),
                  builder: (controller) => Container(
                    width: 160.0,
                    height: 60,
                    child: CustomButton(
                        btnText: 'ADD',
                        onPress: () {
                          controller.addToCart(
                            CartProductModel(
                                name: model.name,
                                image: model.image,
                                price: model.price,
                                productId: model.productId,
                                quantity: 1),
                          );
                          Toast.show(
                            '${model.name} Added To Your Cart',
                            context,
                          );
                        }),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
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
