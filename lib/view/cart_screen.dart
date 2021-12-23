import 'package:e_commerce/constants.dart';
import 'package:e_commerce/view/checkout/checkout_screen.dart';
import 'package:e_commerce/view/widgets/custom_auth_button.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:e_commerce/view_model/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      init: CartController(),
      builder: (cartController) => Scaffold(
        body: cartController.allCartProducts.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/empty_cart.svg',
                    height: 170.0,
                    width: 170.0,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomText(
                    text: 'Cart is Empty \nStart Adding some Products ....  ',
                    alignment: Alignment.center,
                    size: 20.0,
                    linesHeight: 1.2,
                  ),
                ],
              )
            : Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return Slidable(
                            actionPane: SlidableDrawerActionPane(),
                            actions: [
                              IconSlideAction(
                                icon: Icons.star,
                                color: Colors.yellow.shade600,
                                foregroundColor: Colors.white,
                                onTap: () {
                                  cartController.onActionPressed(
                                      index,
                                      SlidableActions.AddToFavorite,
                                      cartController
                                          .allCartProducts[index].productId);
                                },
                              ),
                            ],
                            secondaryActions: [
                              IconSlideAction(
                                icon: Icons.delete_forever_outlined,
                                color: Color.fromRGBO(250, 68, 37, 1.0),
                                onTap: () {
                                  cartController.onActionPressed(
                                      index,
                                      SlidableActions.Delete,
                                      cartController
                                          .allCartProducts[index].productId);
                                },
                              ),
                            ],
                            actionExtentRatio: 0.27,
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.20,
                              child: Row(
                                children: [
                                  Container(
                                      width: 130.0,
                                      child: Image.network(
                                        cartController
                                            .allCartProducts[index].image,
                                        fit: BoxFit.fill,
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 30.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CustomText(
                                          text: cartController
                                              .allCartProducts[index].name,
                                          size: 20.0,
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        CustomText(
                                          text: '\$ ' +
                                              cartController
                                                  .allCartProducts[index].price
                                                  .toString(),
                                          fontColor: kPrimaryColor,
                                          size: 16.0,
                                        ),
                                        SizedBox(
                                          height: 15.0,
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 10.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade200,
                                          ),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  cartController
                                                      .increaseQuantity(index);
                                                },
                                                child: Icon(Icons.add),
                                              ),
                                              SizedBox(width: 15.0),
                                              CustomText(
                                                text: cartController
                                                    .allCartProducts[index]
                                                    .quantity
                                                    .toString(),
                                                size: 16.0,
                                              ),
                                              SizedBox(width: 15.0),
                                              GestureDetector(
                                                onTap: () {
                                                  cartController
                                                      .decreaseQuantity(index);
                                                },
                                                child: Container(
                                                    padding: EdgeInsets.only(
                                                        bottom: 15.0),
                                                    child:
                                                        Icon(Icons.minimize)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 20.0,
                          );
                        },
                        itemCount: cartController.allCartProducts.length,
                      ),
                    ),
                    GetBuilder<CartController>(
                      init: Get.find(),
                      builder: (controller) => Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: 'TOTAL',
                                  fontColor: Colors.grey,
                                  size: 15.0,
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                CustomText(
                                  text: '\$' + controller.totalPrice.toString(),
                                  fontColor: kPrimaryColor,
                                  size: 22.0,
                                  weight: FontWeight.bold,
                                )
                              ],
                            ),
                            Container(
                              width: 150.0,
                              child: CustomButton(
                                btnText: 'CHECKOUT',
                                onPress: () {
                                  Get.to(() => (CheckOutScreen()));
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
