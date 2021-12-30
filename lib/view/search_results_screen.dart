import 'package:e_commerce/constants.dart';
import 'package:e_commerce/view/control_view.dart';
import 'package:e_commerce/view/details_screen.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:e_commerce/view_model/search_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchResultViewer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchController>(
      init: SearchController() ,
      builder: (controller) => Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: CustomText(
            text: 'Available Products :',
            size: 22.0,
            fontColor: Colors.black,
          ),
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () {
                Get.back();
               // Get.back();
              }),
        ),
        body: controller.loading.value
            ? Center(child: CircularProgressIndicator())
            : controller.searchResultList.isEmpty
                ? Center(
                    child: CustomText(
                    text: 'No Products Found',
                    size: 19.0,
                    alignment: Alignment.center,
                  ))
                : Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: ListView.separated(
                      itemCount: controller.searchResultList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(
                              DetailsScreen(
                                model: controller.searchResultList[index],
                              ),
                            );
                          },
                          child: Container(
                            height: 100.0,
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.07),
                                borderRadius: BorderRadius.circular(15.0)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 70.0,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15.0),
                                    child: Image.network(controller
                                        .searchResultList[index].image),
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomText(
                                      text:
                                          '${controller.searchResultList[index].name}',
                                      size: 19.0,
                                      alignment: Alignment.topLeft,
                                    ),
                                    SizedBox(height: 10.0),
                                    CustomText(
                                      text:
                                          '  \$ ${controller.searchResultList[index].price}',
                                      fontColor: kPrimaryColor,
                                      size: 17.0,
                                      alignment: Alignment.centerLeft,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 5.0,
                        );
                      },
                    ),
                  ),
      ),
    );
  }
}
