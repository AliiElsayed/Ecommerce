import 'package:e_commerce/service/local_storage_controller.dart';
import 'package:e_commerce/view_model/auth_controller.dart';
import 'package:e_commerce/view_model/bottom_nav_controller.dart';
import 'package:e_commerce/view_model/cart_controller.dart';
import 'package:e_commerce/view_model/checkout_controller.dart';
import 'package:e_commerce/view_model/home_controller.dart';
import 'package:e_commerce/view_model/profile_controller.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => BottomNavController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => CartController());
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => LocalStorageController());
    Get.lazyPut(() => CheckOutController());
  }
}
