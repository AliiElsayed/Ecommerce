import 'package:e_commerce/view/checkout/address_widget.dart';
import 'package:e_commerce/view/checkout/delivery_time_widget.dart';
import 'package:e_commerce/view/checkout/summary_widget.dart';
import 'package:e_commerce/view/widgets/custom_auth_button.dart';
import 'package:e_commerce/view_model/checkout_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:status_change/status_change.dart';

import '../../constants.dart';

class CheckOutScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutController>(
      init: CheckOutController(),
      builder: (controller) => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Check out',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            Container(
              height: 100,
              child: StatusChange.tileBuilder(
                theme: StatusChangeThemeData(
                  direction: Axis.horizontal,
                  connectorTheme:
                      ConnectorThemeData(space: 1.0, thickness: 1.0),
                ),
                builder: StatusChangeTileBuilder.connected(
                  itemWidth: (_) =>
                      MediaQuery.of(context).size.width /
                          controller.processes.length -
                      5,
                  nameWidgetBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Text(
                        controller.processes[index],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: controller.getColor(index),
                        ),
                      ),
                    );
                  },
                  indicatorWidgetBuilder: (_, index) {
                    if (index <= controller.currentIndex) {
                      return DotIndicator(
                        size: 35.0,
                        border: Border.all(color: Colors.green, width: 1),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      );
                    } else {
                      return OutlinedDotIndicator(
                        size: 30,
                        borderWidth: 1.0,
                        color: todoColor,
                      );
                    }
                  },
                  lineWidgetBuilder: (index) {
                    if (index > 0 ) {
                      if (index == controller.currentIndex) {
                        final prevColor = controller.getColor(index - 1);
                        final color = controller.getColor(index);
                        var gradientColors;
                        gradientColors = [
                          prevColor,
                          Color.lerp(prevColor, color, 0.5)
                        ];
                        return DecoratedLineConnector(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: gradientColors,
                            ),
                          ),
                        );
                      } else {
                        return SolidLineConnector(
                          color: controller.getColor(index),
                        );
                      }
                    } else {
                      return Container();
                    }
                  },
                  itemCount: controller.processes.length,
                ),
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Expanded(
              child: Column(
                children: [
                  controller.currentPage == Pages.DeliveryTime
                      ? DeliveryTime()
                      : controller.currentPage == Pages.AddAddress
                          ? AddAddress()
                          : Summary(),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 10.0, top: 40.0, right: 10.0, bottom: 7.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 55.0,
                          width: 150.0,
                          child: controller.currentPage != Pages.DeliveryTime
                              ? CustomButton(
                                  btnText: 'BACK',
                                  btnBackgroundColor: Colors.white,
                                  btnTextColor: Colors.black,
                                  onPress: () {
                                    controller.onBackPressed();
                                  },
                                )
                              : null,
                        ),
                        Container(
                          height: 55.0,
                          width: 150.0,
                          child: CustomButton(
                            btnText: controller.currentPage == Pages.Summary
                                ? 'Deliver'
                                : 'NEXT',
                            onPress: () {
                              controller.onNextPressed();
                            },
                          ),
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
  }
}
