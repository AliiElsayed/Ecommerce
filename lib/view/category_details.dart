import 'package:e_commerce/view/widgets/custom_product_viewer.dart';
import 'package:e_commerce/view_model/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryDetails extends StatelessWidget {
  final String categoryName;
  CategoryDetails({@required this.categoryName});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: Get.find(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text(
            '$categoryName',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: Container(
          color: Colors.white,
          child: GridView.builder(
            padding: EdgeInsets.only(top: 12.0,bottom: 10.0, right: 10.0, left: 17.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 7,
              childAspectRatio: 0.50,
            ),
            itemBuilder: (context, index) {
              return CustomProductViewer(
                determinedProduct:
                    controller.getCategoryProducts(categoryName)[index],
              );
            },
            scrollDirection: Axis.vertical,
            itemCount: controller.getCategoryProducts(categoryName).length,
          ),
        ),
      ),
    );
  }
}
