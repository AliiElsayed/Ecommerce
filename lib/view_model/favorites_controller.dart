import 'package:e_commerce/model/favorite_products_model.dart';
import 'package:e_commerce/service/sqflite_database/database_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FavoritesController extends GetxController {
  DatabaseHelper dbHelper = DatabaseHelper();
  ValueNotifier<bool> loading = ValueNotifier(false);
  List<FavoritesProductModel> allFavoriteProducts = [];

  @override
  void onInit() {
    super.onInit();
    getFavoriteProducts();
  }

  getFavoriteProducts() async {
    loading.value = true;
    allFavoriteProducts = await dbHelper.getAllFavoriteProducts();
    loading.value = false;
    update();
  }

  addToFavorites(FavoritesProductModel model) async {
    for (int i = 0; i < allFavoriteProducts.length; i++) {
      if (allFavoriteProducts[i].productId == model.productId) {
        Get.snackbar(
          'Attention !!',
          'Item Exists in Favorites ',
        );
        return;
      }
    }
    await dbHelper.insertToFavorites(model);
    Get.snackbar(
      'Done !',
      'Item Added To Favorites ',
    );
    getFavoriteProducts();
    update();
  }

  removeFromFavorites(String productId) {
    dbHelper.deleteProductFromFavorites(productId);
    allFavoriteProducts
        .removeWhere((product) => product.productId == productId);
    Get.snackbar(
      'Done',
      'Item Removed From Favorites',
    );
    update();
  }

  bool isFavorite(String proId) {
    for (int i = 0; i < allFavoriteProducts.length; i++) {
      if (allFavoriteProducts[i].productId == proId) {
        return true;
      }
    }
    return false;
  }

  onStarPressed(String prodId, context, FavoritesProductModel model) {
    if (isFavorite(prodId)) {
      removeFromFavorites(prodId);
      getFavoriteProducts();
    } else {
      addToFavorites(model);
      getFavoriteProducts();
    }
    update();
  }
}
