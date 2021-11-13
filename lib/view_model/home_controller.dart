import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/model/category_model.dart';
import 'package:e_commerce/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<CategoryModel> categories = [];
  List<ProductModel> products = [];

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
        products.add(ProductModel.fromJson(allProducts.docs[i].data()));
      }
      print(products[0]);
      loading.value = false;
    });
    update();
  }
}
