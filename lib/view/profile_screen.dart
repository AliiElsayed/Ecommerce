import 'package:e_commerce/constants.dart';
import 'package:e_commerce/view/user_orders_screen.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:e_commerce/view/widgets/reusable_list_tile.dart';
import 'package:e_commerce/view_model/profile_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'favorites_screen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (controller) => Scaffold(
        body: controller.loading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SafeArea(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              child: Padding(
                                padding: EdgeInsets.all(3.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50.0),
                                  child: controller.userData.pic == null
                                      ? Image.asset(
                                          'assets/images/default.png',
                                        )
                                      : Image.network(controller.userData.pic),
                                ),
                              ),
                              radius: 50.0,
                              backgroundColor: kPrimaryColor.withOpacity(0.6),
                            ),
                            // Container(
                            //  padding: EdgeInsets.all(10.0),
                            //   height: 100.0,
                            //   width: 100.0,
                            //   decoration: BoxDecoration(
                            //     color: Colors.red,
                            //     borderRadius: BorderRadius.circular(50.0),
                            //     image: DecorationImage(
                            //       fit: BoxFit.fill,
                            //       image: controller.userData.pic == null
                            //           ? AssetImage(
                            //                'assets/images/default.png',
                            //             )
                            //           : NetworkImage(controller.userData.pic),
                            //     ),
                            //   ),
                            // ),
                            SizedBox(width: 20.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: controller.userData.name,
                                  size: 30.0,
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                CustomText(
                                  text: controller.userData.email,
                                  size: 20.0,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        ReusableTile(
                          tileTitle: 'Edit Profile',
                          iconImage: 'assets/icon_images/Icon_Edit-Profile.png',
                          onTilePressed: () {},
                        ),
                        ReusableTile(
                          tileTitle: 'Shipping Address',
                          iconImage: 'assets/icon_images/Icon_Location.png',
                          onTilePressed: () {},
                        ),
                        ReusableTile(
                          tileTitle: 'Favorites',
                          iconImage: 'assets/icon_images/icon_favorites.png',
                          onTilePressed: () {
                            Get.to(FavoritesScreen());
                          },
                        ),
                        ReusableTile(
                          tileTitle: 'Order History',
                          iconImage: 'assets/icon_images/Icon_History.png',
                          onTilePressed: () {
                            Get.to(UserOrdersScreen());
                          },
                        ),
                        ReusableTile(
                          tileTitle: 'Cards',
                          iconImage: 'assets/icon_images/Icon_Payment.png',
                          onTilePressed: () {},
                        ),
                        ReusableTile(
                          tileTitle: 'Notifications',
                          iconImage: 'assets/icon_images/Icon_Alert.png',
                          onTilePressed: () {},
                        ),
                        ReusableTile(
                          tileTitle: 'Log Out',
                          iconImage: 'assets/icon_images/Icon_Exit.png',
                          onTilePressed: () {
                            controller.logOut();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
