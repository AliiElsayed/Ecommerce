import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/model/order_model.dart';
import 'package:e_commerce/view_model/profile_controller.dart';
import 'package:flutter/cupertino.dart';
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
    await allOrdersRef.get().then((orders) {
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
}
