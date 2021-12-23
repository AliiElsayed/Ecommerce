import 'package:e_commerce/view/cart_screen.dart';
import 'package:e_commerce/view/control_view.dart';
import 'package:e_commerce/view_model/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';

class CheckOutController extends GetxController {
  int currentIndex = 0;
  Pages currentPage = Pages.DeliveryTime;
  Delivery currentSelectedRadio = Delivery.StandardDelivery;
  String street1, street2, city, state, country;
  GlobalKey<FormState> formKey = GlobalKey();

  onRadioPressed(Delivery value) {
    currentSelectedRadio = value;
    update();
  }

  Color getColor(int index) {
    if (index == currentIndex) {
      return inProgressColor;
    } else if (index < currentIndex) {
      return Colors.green;
    } else {
      return todoColor;
    }
  }

  void onNextPressed() {
    if (currentIndex == 0 || currentIndex < 0) {
      currentPage = Pages.AddAddress;
      currentIndex++;
    } else if (currentIndex == 1) {
      formKey.currentState.save();
      if (formKey.currentState.validate()) {
        currentPage = Pages.Summary;
        currentIndex++;
      }
    } else if (currentIndex == 2) {
      Get.find<CartController>().clearCart();
      Get.offAll(
        ControlView(),
      );
    }
    update();
  }

  void onBackPressed() {
    if (currentIndex == 2) {
      currentPage = Pages.AddAddress;
      currentIndex--;
    } else if (currentIndex == 1) {
      currentPage = Pages.DeliveryTime;
      currentIndex--;
    }
    update();
  }

  final processes = [
    'Delivery',
    'Address',
    'Summary',
  ];
}
