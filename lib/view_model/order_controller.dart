import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/model/cart_product_model.dart';
import 'package:e_commerce/model/order_model.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:e_commerce/view/widgets/one_order_image_viewer.dart';
import 'package:e_commerce/view_model/profile_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  final CollectionReference allOrdersRef =
      FirebaseFirestore.instance.collection('orders');
  ValueNotifier<bool> loading = ValueNotifier(false);
  List<OrderModel> userOrders = [];

  @override
  void onInit() {
    super.onInit();
    getUserOrders();
  }

  getUserOrders() async {
    loading.value = true;
    await allOrdersRef
        .orderBy('pickedDate', descending: true)
        .get()
        .then((orders) {
      for (int i = 0; i < orders.docs.length; i++) {
        if (OrderModel.fromJson(orders.docs[i].data()).userId ==
            Get.find<ProfileController>().userData.userId) {
          userOrders.add(OrderModel.fromJson(orders.docs[i].data()));
        }
      }
    });

    loading.value = false;
    update();
  }

  orderImagesViewer(int orderIndex) {
    List<CartProductModel> ordersProductsList =
        userOrders[orderIndex].orderProducts;
    List<String> imagesList = [];
    for (int i = 0; i < ordersProductsList.length; i++) {
      imagesList.add(ordersProductsList[i].image);
    }
    if (imagesList.length == 1) {
      return Image.network(
        imagesList[0],
        fit: BoxFit.fill,
      );
    } else if (imagesList.length == 2) {
      return Container(
        child: Row(
          children: [
            OneImageViewer(
              imageWidth: 62,
              imageHeight: 140,
              imagesUrl: imagesList[0],
            ),
            SizedBox(
              width: 5,
            ),
            OneImageViewer(
              imageWidth: 62,
              imageHeight: 140,
              imagesUrl: imagesList[1],
            ),
          ],
        ),
      );
    } else if (imagesList.length == 3) {
      return Container(
        child: Row(
          children: [
            Column(
              children: [
                OneImageViewer(
                  imagesUrl: imagesList[0],
                  imageHeight: 75,
                  imageWidth: 63,
                ),
                SizedBox(
                  height: 3.0,
                ),
                OneImageViewer(
                  imagesUrl: imagesList[1],
                  imageHeight: 75,
                  imageWidth: 63,
                ),
              ],
            ),
            SizedBox(
              width: 3.0,
            ),
            OneImageViewer(
              imagesUrl: imagesList[2],
              imageHeight: 150,
              imageWidth: 60,
            ),
          ],
        ),
      );
    } else if (imagesList.length == 4) {
      return Container(
        child: Column(
          children: [
            Row(
              children: [
                OneImageViewer(
                  imagesUrl: imagesList[0],
                  imageHeight: 75,
                  imageWidth: 63,
                ),
                SizedBox(
                  width: 3.0,
                ),
                OneImageViewer(
                  imagesUrl: imagesList[1],
                  imageHeight: 75,
                  imageWidth: 63,
                ),
              ],
            ),
            SizedBox(
              height: 3.0,
            ),
            Row(
              children: [
                OneImageViewer(
                  imagesUrl: imagesList[2],
                  imageHeight: 75,
                  imageWidth: 63,
                ),
                SizedBox(
                  width: 3.0,
                ),
                OneImageViewer(
                  imagesUrl: imagesList[3],
                  imageHeight: 75,
                  imageWidth: 63,
                ),
              ],
            ),
          ],
        ),
      );
    } else {
      return Container(
        child: Column(
          children: [
            Row(
              children: [
                OneImageViewer(
                  imagesUrl: imagesList[0],
                  imageHeight: 75,
                  imageWidth: 63,
                ),
                SizedBox(
                  width: 3.0,
                ),
                OneImageViewer(
                  imagesUrl: imagesList[1],
                  imageHeight: 75,
                  imageWidth: 63,
                ),
              ],
            ),
            SizedBox(
              height: 3.0,
            ),
            Row(
              children: [
                OneImageViewer(
                  imagesUrl: imagesList[2],
                  imageHeight: 75,
                  imageWidth: 63,
                ),
                SizedBox(
                  width: 3.0,
                ),
                Container(
                  height: 75,
                  width: 63,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                        color: Colors.grey,
                        width: 2.0,
                      )),
                  child: CustomText(
                    text: '+ ${imagesList.length - 3} ',
                    alignment: Alignment.center,
                    size: 19.0,
                    weight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }
  }
}
