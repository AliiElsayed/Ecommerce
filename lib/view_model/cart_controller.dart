import 'package:e_commerce/model/cart_product_model.dart';
import 'package:e_commerce/service/sqflite_database/cart_database_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  CartDatabaseHelper dbHelper = CartDatabaseHelper();
  List<CartProductModel> allCartProducts = [];
  double totalPrice = 0.0;
  @override
  void onInit() {
    // TODO: implement onInit
    getCartList();
    super.onInit();
  }

  ValueNotifier<bool> loading = ValueNotifier(false);

  addToCart(CartProductModel model) async {
    for (int i = 0; i < allCartProducts.length; i++) {
      if (allCartProducts[i].productId == model.productId) {
        return;
      }
    }
   await  dbHelper.insert(model);
    getCartList();
    update();
  }

  getCartList() async {
    loading.value = true;
    allCartProducts = await dbHelper.getAllCartProducts();
    print(allCartProducts.length);
    loading.value = false;
    getTotalPrice();
    update();
  }

  getTotalPrice() {
    for (int i = 0; i < allCartProducts.length; i++) {
      totalPrice += (double.parse(allCartProducts[i].price) *
          allCartProducts[i].quantity);
    }
    update();
  }

  increaseQuantity(int productIndex) async{
    allCartProducts[productIndex].quantity ++;
    totalPrice += (double.parse(allCartProducts[productIndex].price)) ;
    await dbHelper.update(allCartProducts[productIndex]);
    update();
  }

  decreaseQuantity(int productIndex) async {
    allCartProducts[productIndex].quantity--;
    totalPrice -= (double.parse(allCartProducts[productIndex].price)) ;
    await dbHelper.update(allCartProducts[productIndex]);
    update();
  }

}
