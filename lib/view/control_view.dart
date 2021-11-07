import 'package:e_commerce/view/auth/login_screen.dart';
import 'package:e_commerce/view/home_screen.dart';
import 'package:e_commerce/view_model/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlView extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthController>().user != null)
          ? HomeScreen()
          : LoginScreen();
    });
  }
}
