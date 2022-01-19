import 'package:e_commerce/model/product_model.dart';
import 'package:e_commerce/view/search_screen.dart';
import 'package:e_commerce/view_model/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  String searchText;
  List<ProductModel> searchResultList = [];
  ValueNotifier<bool> loading = ValueNotifier(false);
  TextEditingController typedValueController = TextEditingController();
  List<String> allProductsNames = [];
  GlobalKey<FormState> searchFormKey = GlobalKey<FormState>();
  bool searchIconPressed = false;

  @override
  void onInit() {
    super.onInit();
    getAllProductsNames();
  }

  getAllProductsNames() {
    List<ProductModel> retrievedList =
        Get.find<HomeController>().ourAllProducts;
    for (int i = 0; i < retrievedList.length; i++) {
      allProductsNames.add(retrievedList[i].name);
    }
    print('Names retrived...................');
  }

  String removeTrailingWhiteSpace(String str) {
    return str.replaceFirst(new RegExp(r"\s+$"), "");
  }

  getSearchSuggestions(String typedText) {
    return allProductsNames
        .where((item) => item
            .toLowerCase()
            .contains(removeTrailingWhiteSpace(typedText).toLowerCase()))
        .toList();
  }

  onSearchPressed() {
    searchFormKey.currentState.save();
    if (searchText != '') {
      searchIconPressed = true;
      loading.value = true;
      searchResultList = Get.find<HomeController>()
          .ourAllProducts
          .where((product) => product.name
              .toLowerCase()
              .contains(removeTrailingWhiteSpace(searchText).toLowerCase()))
          .toList();
      Get.to(SearchScreen());
      loading.value = false;
    }
    update();
  }
}
