import 'package:e_commerce/constants.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:e_commerce/view_model/checkout_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryTime extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutController>(
      init: Get.find(),
      builder:(widgetController)=> Expanded(
        child: Container(
          padding: EdgeInsets.all(5.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                RadioListTile<Delivery>(
                    title: CustomText(
                      text: 'StandardDelivery',
                      size: 22.0,
                    ),
                    subtitle: CustomText(
                      text: '\nOrder will be delivered between 3 - 5 business days',
                      size: 17.0,
                    ),
                    activeColor: kPrimaryColor,
                    controlAffinity: ListTileControlAffinity.trailing,
                    value: Delivery.StandardDelivery,
                    groupValue: widgetController.currentSelectedRadio,
                    onChanged: (selectedValue) {
                      widgetController.onRadioPressed(selectedValue, context);
                    }),
                SizedBox(
                  height: 25.0,
                ),
                RadioListTile<Delivery>(
                    title: CustomText(
                      text: 'Next Day Delivery',
                      size: 22.0,
                    ),
                    subtitle: CustomText(
                      text:
                          '\nPlace your order before 6pm and your items will be delivered the next day',
                      size: 17.0,
                    ),
                    activeColor: kPrimaryColor,
                    controlAffinity: ListTileControlAffinity.trailing,
                    value: Delivery.NextDayDelivery,
                    groupValue: widgetController.currentSelectedRadio,
                    onChanged: (selectedValue) {
                      widgetController.onRadioPressed(selectedValue, context);
                    }),
                SizedBox(
                  height: 25.0,
                ),
                RadioListTile<Delivery>(
                    title: CustomText(
                      text: 'Nominated Delivery',
                      size: 22.0,
                    ),
                    subtitle: CustomText(
                      text:
                          '\nPick a particular date from the calendar and order will be delivered on selected date',
                      size: 17.0,
                    ),
                    activeColor: kPrimaryColor,
                    controlAffinity: ListTileControlAffinity.trailing,
                    value: Delivery.NominatedDelivery,
                    groupValue: widgetController.currentSelectedRadio,
                    onChanged: (selectedValue) {
                      widgetController.onRadioPressed(selectedValue, context);
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
