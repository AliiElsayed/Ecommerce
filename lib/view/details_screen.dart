import 'package:e_commerce/constants.dart';
import 'package:e_commerce/model/cart_product_model.dart';
import 'package:e_commerce/model/favorite_products_model.dart';
import 'package:e_commerce/model/product_model.dart';
import 'package:e_commerce/view/widgets/custom_auth_button.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:e_commerce/view_model/cart_controller.dart';
import 'package:e_commerce/view_model/favorites_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsScreen extends StatelessWidget {
  final ProductModel model;

  DetailsScreen({@required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 300,
                        child: Image.network(
                          model.image,
                          fit: BoxFit.fill,
                        ),
                      ),
                      GetBuilder<FavoritesController>(
                        init: FavoritesController(),
                        builder: (favoritesController) => Positioned(
                          top: 90.0,
                          right: 12.0,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              color: Colors.white70,
                            ),
                            child: IconButton(
                              icon: favoritesController
                                      .isFavorite(model.productId)
                                  ? Icon(
                                      Icons.star,
                                      color: Color(0xffffb900),
                                      size: 32,
                                    )
                                  : Icon(
                                      Icons.star_border_outlined,
                                      color: Colors.black, //Color(0xffffb900)
                                      size: 32,
                                    ),
                              onPressed: () {
                                favoritesController.onStarPressed(
                                  model.productId,
                                  context,
                                  FavoritesProductModel(
                                    productId: model.productId,
                                    name: model.name,
                                    image: model.image,
                                    description: model.description,
                                    price: model.price,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 90.0,
                        left: 10.0,
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black, //Color(0xffffb900)
                            size: 30,
                          ),
                          onPressed: () {
                            Get.back();
                          },
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
                    child: Column(
                      children: [
                        CustomText(
                          text: model.name,
                          size: 26.0,
                          weight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 15.0,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
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
                ],
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
/* body:  CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            expandedHeight: 350.0,
            floating: true,
            pinned: true,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () {
                Get.back();
              },
            ),
            actions: [
              Container(
                margin: EdgeInsets.only(
                  right: 10.0,
                ),
                width: 55.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Colors.white70,
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.star_border_outlined,
                    color: Colors.black, //Color(0xffffb900)
                    size: 32,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              title: CustomText(
                text: model.name,
                size: 20.0,
                fontColor: Colors.black,
                weight: FontWeight.bold,
                alignment: Alignment.bottomCenter,
              ),
              centerTitle: true,
              background: Image.network(
                model.image,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 5.0,
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
                                        color: Colors.grey.shade300,
                                        width: 1.5)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                        color: Colors.grey.shade300,
                                        width: 1.5)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(5.0)),
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
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
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
            ),
          ),
        ],
      ),*/
