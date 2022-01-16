import 'package:e_commerce/model/cart_product_model.dart';
import 'package:e_commerce/model/favorite_products_model.dart';
import 'package:e_commerce/model/product_model.dart';
import 'package:e_commerce/service/sqflite_database/database_helper.dart';
import 'package:e_commerce/view_model/favorites_controller.dart';
import 'package:e_commerce/view_model/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toast/toast.dart';
import '../constants.dart';

class CartController extends GetxController {
  DatabaseHelper dbHelper = DatabaseHelper();
  List<CartProductModel> allCartProducts = [];
  double totalPrice = 0.0;
  @override
  void onInit() {
    // TODO: implement onInit
    getCartList();
    super.onInit();
  }

  ValueNotifier<bool> loading = ValueNotifier(false);

  addToCart(CartProductModel model, context) async {
    for (int i = 0; i < allCartProducts.length; i++) {
      if (allCartProducts[i].productId == model.productId) {
        Toast.show('Item already exists in cart', context);
        return;
      }
    }
    await dbHelper.insertToCart(model);
    Toast.show(
      'Item Added To Your Cart',
      context,
    );
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
    totalPrice = 0;
    for (int i = 0; i < allCartProducts.length; i++) {
      totalPrice += (double.parse(allCartProducts[i].price) *
          allCartProducts[i].quantity);
    }
    update();
  }

  increaseQuantity(int productIndex) async {
    allCartProducts[productIndex].quantity++;
    totalPrice += (double.parse(allCartProducts[productIndex].price));
    await dbHelper.update(allCartProducts[productIndex]);
    update();
  }

  decreaseQuantity(int productIndex) async {
    allCartProducts[productIndex].quantity--;
    totalPrice -= (double.parse(allCartProducts[productIndex].price));
    await dbHelper.update(allCartProducts[productIndex]);
    update();
  }

  clearCart() async {
    await dbHelper.deleteAllCartProducts();
    allCartProducts.clear();
    update();
  }

  removeProductFromCart(String id) async {
    await dbHelper.deleteProductFromCart(id);
    update();
  }

  onActionPressed(int index, SlidableActions action, String id) {
    switch (action) {
      case SlidableActions.AddToFavorite:
        List<ProductModel> allProductsLIst =
            Get.find<HomeController>().ourAllProducts;
        FavoritesProductModel favModel = FavoritesProductModel();
        var controller = Get.find<FavoritesController>();
        for (int i = 0; i < allProductsLIst.length; i++) {
          if (allProductsLIst[i].productId == id) {
            favModel = FavoritesProductModel(
              productId: allProductsLIst[i].productId,
              name: allProductsLIst[i].name,
              image: allProductsLIst[i].image,
              price: allProductsLIst[i].price,
              description: allProductsLIst[i].description,
            );
            break;
          }
        }
        controller.addToFavorites(favModel);

        break;
      case SlidableActions.Delete:
        removeProductFromCart(id);
        allCartProducts.removeAt(index);
        getTotalPrice();
        Get.snackbar(
          'Done',
          'Item Removed From Cart',
        );
        break;
    }
    update();
  }
}

/*var controller = Get.put(FavoritesController());
            print(
                'lemgthhhhhhhhhhhh  ${Get.put(FavoritesController()).allFavoriteProducts.length}');

            print(
                'lemgthhhhhhhhhhhh  ${FavoritesController().allFavoriteProducts.length}');
            for (int x = 0;
                x < FavoritesController().allFavoriteProducts.length;
                x++) {
              if (FavoritesController().allFavoriteProducts[x].productId ==
                  id) {
                Get.snackbar(
                    'Attention !!', 'Item already Exists in favorites');
                return;
              }
            }*/
