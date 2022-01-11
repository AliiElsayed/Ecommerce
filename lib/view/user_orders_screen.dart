import 'package:e_commerce/constants.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:e_commerce/view_model/order_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class UserOrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
      init: OrderController(),
      builder: (orderController) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: CustomText(
            text: 'Track Order',
            fontColor: Colors.black87,
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black87,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: orderController.loading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : orderController.userOrders.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: 250.0,
                          width: 200.0,
                          child:
                              SvgPicture.asset('assets/images/no_orders.svg')),
                      CustomText(
                        text: 'No Orders Added yet ...',
                        size: 20.0,
                        alignment: Alignment.center,
                      ),
                    ],
                  )
                // to show every order 's abbreviated details
                : Container(
                    child: ListView.builder(
                      itemCount: orderController.userOrders.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(right: 12.0),
                                child: CustomText(
                                  text: DateFormat('MMM dd, yyyy').format(
                                    DateTime.parse(orderController
                                        .userOrders[index].orderDate),
                                  ),
                                  fontColor: Colors.black45,
                                  size: 17.0,
                                ),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              Container(
                                padding: EdgeInsets.all(20.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6.0),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 12,
                                      offset: Offset(4, 8),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.only(
                                          right: 10.0,
                                        ),
                                        height: 135,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CustomText(
                                              text:
                                                  'OD - ${orderController.userOrders[index].orderId.substring(0, 8)} - N',
                                              fontColor: Colors.black,
                                              size: 17.0,
                                              weight: FontWeight.bold,
                                              linesNum: 2,
                                            ),
                                            SizedBox(
                                              height: 7.0,
                                            ),
                                            Expanded(
                                              child: CustomText(
                                                text:
                                                    '\$${orderController.userOrders[index].totalPrice}',
                                                fontColor: kPrimaryColor,
                                                size: 20.0,
                                              ),
                                            ),
                                            Container(
                                              height: 40,
                                              width: 90.0,
                                              decoration: BoxDecoration(
                                                color: orderController
                                                            .userOrders[index]
                                                            .status
                                                            .toUpperCase() ==
                                                        'Delivered'
                                                            .toUpperCase()
                                                    ? kPrimaryColor
                                                    : Color(0xffffb900),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  3.0,
                                                ),
                                              ),
                                              child: CustomText(
                                                text: orderController
                                                    .userOrders[index].status,
                                                alignment: Alignment.center,
                                                fontColor: Colors.white,
                                                size: 17.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 155.0,
                                      width: 130,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        child: orderController
                                            .orderImagesViewer(index),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
      ),
    );
  }
}

// to show every order 's all details and detailed list of products
/*
Container(
                    child: ListView.builder(
                      itemCount: orderController.userOrders.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text:
                                    'OD -${orderController.userOrders[index].userId} -N',
                                fontColor: Colors.black,
                                size: 17.0,
                                weight: FontWeight.bold,
                              ),
                              SizedBox(
                                height: 12.0,
                              ),
                              Container(
                                padding: EdgeInsets.only(right: 12.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      text: DateFormat('MMM dd, yyyy').format(
                                        DateTime.parse(orderController
                                            .userOrders[index].orderDate),
                                      ),
                                      fontColor: Colors.black45,
                                      size: 17.0,
                                    ),
                                    CustomText(
                                      text:
                                          '\$${orderController.userOrders[index].totalPrice}',
                                      fontColor: kPrimaryColor,
                                      size: 17.0,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              Container(
                                child: ListView.separated(
                                    shrinkWrap: true,
                                    itemBuilder: (context, innerIndex) {
                                      return Container(
                                        padding: EdgeInsets.all(15.0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6.0),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 2,
                                              blurRadius: 12,
                                              offset: Offset(4, 8),
                                            ),
                                          ],
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                padding: EdgeInsets.only(
                                                  right: 10.0,
                                                ),
                                                height: 135,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    CustomText(
                                                      text: orderController
                                                          .userOrders[index]
                                                          .orderProducts[
                                                              innerIndex]
                                                          .name,
                                                      size: 18.0,
                                                      //weight: FontWeight.bold,
                                                    ),
                                                    SizedBox(
                                                      height: 5.0,
                                                    ),
                                                    Row(
                                                      children: [
                                                        CustomText(
                                                          text:
                                                              '${orderController.userOrders[index].orderProducts[innerIndex].quantity}',
                                                          fontColor:
                                                              Colors.black,
                                                          size: 16.0,
                                                        ),
                                                        CustomText(
                                                          text: orderController
                                                                      .userOrders[
                                                                          index]
                                                                      .orderProducts[
                                                                          innerIndex]
                                                                      .quantity >
                                                                  1
                                                              ? '  Pieces'
                                                              : '  Piece',
                                                          fontColor:
                                                              Colors.black,
                                                          size: 16.0,
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 7.0,
                                                    ),
                                                    Expanded(
                                                      child: CustomText(
                                                        text:
                                                            '\$${orderController.userOrders[index].orderProducts[innerIndex].price}',
                                                        fontColor:
                                                            kPrimaryColor,
                                                        size: 18.0,
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 40,
                                                      width: 90.0,
                                                      decoration: BoxDecoration(
                                                        color: orderController
                                                                    .userOrders[
                                                                        index]
                                                                    .status
                                                                    .toUpperCase() ==
                                                                'Delivered'
                                                                    .toUpperCase()
                                                            ? kPrimaryColor
                                                            : Color(0xffffb900),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                          3.0,
                                                        ),
                                                      ),
                                                      child: CustomText(
                                                        text: orderController
                                                            .userOrders[index]
                                                            .status,
                                                        alignment:
                                                            Alignment.center,
                                                        fontColor: Colors.white,
                                                        size: 17.0,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 135.0,
                                              width: 120,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                                child: Image.network(
                                                  orderController
                                                      .userOrders[index]
                                                      .orderProducts[innerIndex]
                                                      .image,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return SizedBox(
                                        height: 20.0,
                                      );
                                    },
                                    itemCount: orderController.userOrders[index]
                                        .orderProducts.length),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),

       */
