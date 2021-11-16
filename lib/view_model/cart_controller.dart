
import 'package:e_commerce/model/cart_product_model.dart';
import 'package:e_commerce/service/local_database/cart_database_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController{
  List<CartProductModel> allCartProducts = [];
  @override
  void onInit() {
    // TODO: implement onInit
    getCartList();
    super.onInit();
  }
  ValueNotifier<bool>  loading = ValueNotifier(false);

  addToCart( CartProductModel model){
    CartDatabaseHelper().insert(model);
   update();
  }

  getCartList() async{
     loading.value = true;
    allCartProducts = await CartDatabaseHelper().getAllCartProducts() ;
    print(allCartProducts.length);
     loading.value = false;
    update();
  }


}