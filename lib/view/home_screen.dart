import 'package:e_commerce/constants.dart';
import 'package:e_commerce/view/details_screen.dart';
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
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      GetBuilder<HomeController>(
                          init: HomeController(),
                          builder: (controller) {
                            return Container(
                              height: 150.0,
                              // padding: EdgeInsets.all(30.0),
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      Container(
                                        height: 80.0,
                                        width: 80,
                                        child: Image.network(
                                          controller.categories[index].image,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(40.0),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.3),
                                              spreadRadius: 2,
                                              blurRadius: 10,
                                              offset: Offset(4, 8),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20.0,
                                      ),
                                      CustomText(
                                        text: controller.categories[index].name,
                                        size: 20.0,
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
                              return GestureDetector(
                                onTap: (){
                                  Get.to(DetailsScreen(model: productController.products[index],));
                                },
                                child: Container(
                                  height: 300.0,
                                  width: 175.0,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Image.network(
                                          productController.products[index].image,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      CustomText(
                                        text: productController
                                            .products[index].name,
                                        size: 18.0,
                                      ),
                                      SizedBox(
                                        height: 7.0,
                                      ),
                                      CustomText(
                                        text: productController
                                            .products[index].brand,
                                        //.substring(0,30)+' ....',
                                        fontColor: Colors.grey,
                                        size: 16.0,
                                      ),
                                      SizedBox(
                                        height: 7.0,
                                      ),
                                      CustomText(
                                        text:
                                            '\$ ${productController.products[index].price.toString()} ',
                                        fontColor: kPrimaryColor,
                                        size: 18.0,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                width: 15.0,
                              );
                            },
                            itemCount: productController.products.length,
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
