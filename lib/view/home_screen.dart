import 'package:e_commerce/view/category_details.dart';
import 'package:e_commerce/view/widgets/custom_product_viewer.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:e_commerce/view_model/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: Get.find(),
      builder: (mainController) => Scaffold(
        body: mainController.loading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      top: 70, right: 13.0, bottom: 5.0, left: 13.0),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.grey.shade200),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      CustomText(
                        text: 'Categories',
                        alignment: Alignment.bottomLeft,
                        size: 20.0,
                        weight: FontWeight.bold,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      GetBuilder<HomeController>(
                          init: Get.find(),
                          builder: (controller) {
                            return Container(
                              height: 120.0,
                              // padding: EdgeInsets.all(30.0),
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Get.to(CategoryDetails(
                                            categoryName: controller
                                                .categories[index].name,
                                          ));
                                        },
                                        child: Container(
                                          height: 60.0,
                                          width: 60.0,
                                          child: Image.network(
                                            controller.categories[index].image,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.3),
                                                spreadRadius: 2,
                                                blurRadius: 10,
                                                offset: Offset(4, 8),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20.0,
                                      ),
                                      CustomText(
                                        text: controller.categories[index].name,
                                        size: 17.0,
                                      ),
                                    ],
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                    width: 20.0,
                                  );
                                },
                                itemCount: controller.categories.length,
                              ),
                            );
                          }),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: 'Best Selling',
                            size: 20.0,
                            weight: FontWeight.bold,
                          ),
                          CustomText(
                            text: 'See all',
                            size: 18.0,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      GetBuilder<HomeController>(builder: (productController) {
                        return Container(
                          height: 350.0,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return CustomProductViewer(
                                determinedProduct:
                                    productController.ourAllProducts[index],
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                width: 15.0,
                              );
                            },
                            itemCount: productController.ourAllProducts.length,
                          ),
                        );
                      })
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
