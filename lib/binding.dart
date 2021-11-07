
import 'package:e_commerce/view_model/auth_controller.dart';
import 'package:e_commerce/view_model/home_controller.dart';
import 'package:get/get.dart';

class Binding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => HomeController());
  }

}