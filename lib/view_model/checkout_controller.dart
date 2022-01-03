import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/model/order_model.dart';
import 'package:e_commerce/model/user_model.dart';
import 'package:e_commerce/service/local_storage_controller.dart';
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
  DateTime pickedDate = DateTime.now().add(Duration(days: 3));
  GlobalKey<FormState> formKey = GlobalKey();
  CollectionReference ordersRef =
      FirebaseFirestore.instance.collection('orders');
  String currentUserId;

  @override
  void onInit() {
    super.onInit();
    getUserId();
  }

  onRadioPressed(Delivery value, context) async {
    switch (value) {
      case Delivery.StandardDelivery:
        pickedDate = DateTime.now().add(Duration(days: 3));
        currentSelectedRadio = value;
        print(pickedDate);
        break;
      case Delivery.NextDayDelivery:
        print(DateTime.now());
        if (DateTime.now().hour < 18) {
          pickedDate = DateTime.now().add(Duration(days: 1));
          currentSelectedRadio = value;
          print(pickedDate);
        }
        break;
      case Delivery.NominatedDelivery:
        pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2100, 12, 30),
        );
        if (pickedDate != null) {
          currentSelectedRadio = value;
          print(pickedDate);
        }
        break;
    }
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

  getUserId() async {
    UserModel userData = await LocalStorageController().retrieveDate();
    currentUserId = userData.userId;
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
      OrderModel orderDetails = OrderModel(
        userId: currentUserId,
        orderDate: pickedDate.toString(),
        orderProducts: Get.find<CartController>().allCartProducts,
        address: UserGivenAddress(
          street1: street1,
          street2: street2,
          city: city,
          state: state,
          country: country,
        ),
      );
      print(orderDetails.toJson());
      print('------------------------------------------');
      ordersRef.add(orderDetails.toJson());
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
