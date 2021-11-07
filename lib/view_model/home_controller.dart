import 'package:get/get.dart';

class HomeController extends GetxController {
  int bottomNavBarCurrentIndex = 0;

  void onBottomNavBarTabbed(int index) {
    bottomNavBarCurrentIndex = index;
    update();
  }
}
