import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/model/category_model.dart';
import 'package:e_commerce/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<CategoryModel> categories = [];
  List<ProductModel> ourAllProducts = [];
  List<ProductModel> menCategoryProducts = [];
  List<ProductModel> womenCategoryProducts = [];
  List<ProductModel> gamingCategoryProducts = [];
  List<ProductModel> gadgetsCategoryProducts = [];
  List<ProductModel> devicesCategoryProducts = [];

  ValueNotifier<bool> loading = ValueNotifier(false);
  final CollectionReference categoriesRef =
      FirebaseFirestore.instance.collection('categories');
  final CollectionReference productsCollectionRef =
      FirebaseFirestore.instance.collection('products');

  @override
  void onInit() {
    super.onInit();
    getCategories();
    getProducts();
  }

  getCategories() async {
    loading.value = true;
    await categoriesRef.get().then((allCategories) {
      for (int i = 0; i < allCategories.docs.length; i++) {
        categories.add(CategoryModel.fromJson(allCategories.docs[i].data()));
      }
      loading.value = false;
      print(categories[0].name);
    });

    update();
  }

  getProducts() async {
    loading.value = true;
    await productsCollectionRef.get().then((allProducts) {
      for (int i = 0; i < allProducts.docs.length; i++) {
        ourAllProducts.add(ProductModel.fromJson(allProducts.docs[i].data()));
      }
      print(ourAllProducts[0]);
      loading.value = false;
      setEachCategoryProducts();
    });
    update();
  }

  setEachCategoryProducts() {
    for (int i = 0; i < ourAllProducts.length; i++) {
      switch (ourAllProducts[i].category) {
        case 'Men':
          menCategoryProducts.add(ourAllProducts[i]);
          break;
        case 'Women':
          womenCategoryProducts.add(ourAllProducts[i]);
          break;
        case 'Gadgets':
          gadgetsCategoryProducts.add(ourAllProducts[i]);
          break;
        case 'Devices':
          devicesCategoryProducts.add(ourAllProducts[i]);
          break;
        case 'Gaming':
          gamingCategoryProducts.add(ourAllProducts[i]);
          break;
      }
    }
    update();
  }

  getCategoryProducts(String catName) {
    switch (catName) {
      case 'Men':
        return menCategoryProducts;
        break;
      case 'Women':
        return womenCategoryProducts;
        break;
      case 'Gadgets':
        return gadgetsCategoryProducts;
        break;
      case 'Devices':
        return devicesCategoryProducts;
        break;
      case 'Gaming':
        return gamingCategoryProducts;
        break;
    }
    update();
  }
}
