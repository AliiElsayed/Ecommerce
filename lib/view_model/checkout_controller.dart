import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';

class CheckOutController extends GetxController{

  int currentIndex = 0;
  Pages currentPage = Pages.DeliveryTime;
  Delivery currentSelectedRadio = Delivery.StandardDelivery;

  onRadioPressed(Delivery value){
    currentSelectedRadio = value ;
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

  void onNextPressed(){
    currentIndex++;
    if (currentIndex == 1) {
      currentPage = Pages.AddAddress;
    } else if (currentIndex == 2) {
      currentPage = Pages.Summary;
    } else if (currentIndex == 3) {
      // Navigator.push(context,
      //     MaterialPageRoute(builder: (context) => FinishView()));
    }
    update();
  }

  final processes = [
    'Delivery',
    'Address',
    'Summary',
  ];

}