import 'package:e_commerce/view/auth/login_screen.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:e_commerce/view_model/auth_controller.dart';
import 'package:e_commerce/view_model/bottom_nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlView extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthController>().user == null)
          ? LoginScreen()
          : GetBuilder<BottomNavController>(
              init: BottomNavController(),
              builder: (navController) {
                return Scaffold(
                  body: navController.currentBodyScreen,
                  bottomNavigationBar: getBottomNavBar(),
                );
              },
            );
    });
  }

  GetBuilder<BottomNavController> getBottomNavBar() {
    return GetBuilder<BottomNavController>(
      init: BottomNavController(),
      builder: (homController) {
        return BottomNavigationBar(
          elevation: 0.0,
          selectedItemColor: Colors.black,
          backgroundColor: Colors.grey.shade50,
          currentIndex: homController.bottomNavBarCurrentIndex,
          onTap: (index) {
            print(index);
            homController.onBottomNavBarTabbed(index);
          },
          items: [
            BottomNavigationBarItem(
              label: '',
              icon: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Image.asset('assets/images/Icon_Explore.png'),
              ),
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: CustomText(
                  text: 'Explore',
                  size: 15.0,
                  alignment: Alignment.topCenter,
                  weight: FontWeight.bold,
                ),
              ),
              tooltip: 'Explore',
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Image.asset('assets/images/Icon_Cart.png'),
              ),
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: CustomText(
                  text: 'Cart',
                  size: 15.0,
                  weight: FontWeight.bold,
                  alignment: Alignment.topCenter,
                ),
              ),
              tooltip: 'Cart',
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Image.asset('assets/images/Icon_User.png'),
              ),
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: CustomText(
                  text: 'Profile',
                  size: 15.0,
                  weight: FontWeight.bold,
                  alignment: Alignment.topCenter,
                ),
              ),
              tooltip: 'Profile',
            ),
          ],
        );
      },
    );
  }
}
