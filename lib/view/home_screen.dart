import 'package:e_commerce/constants.dart';
import 'package:e_commerce/view/category_details.dart';
import 'package:e_commerce/view/search_screen.dart';
import 'package:e_commerce/view/widgets/custom_product_viewer.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:e_commerce/view/widgets/icon_container.dart';
import 'package:e_commerce/view_model/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: Get.find<HomeController>(),
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
                      Row(
                        children: [
                          Expanded(
                            child: CustomText(
                              text: 'Brand City',
                              size: 35.0,
                              fontColor: Colors.black,
                              fontFamily: 'Pacifico',
                            ),
                          ),
                          IconContainer(
                            icon: Icons.notifications_none_outlined,
                            onIconPressed: () {},
                          ),
                          IconContainer(
                            icon: Icons.search,
                            onIconPressed: () {
                              Get.to(SearchScreen());
                            },
                          ),

                          // Expanded(
                          //   child: Form(
                          //     key: searchController.searchFormKey,
                          //     child: Container(
                          //       decoration: BoxDecoration(
                          //         borderRadius: BorderRadius.circular(30.0),
                          //         color: Colors.grey.shade200,
                          //         border: Border.all(
                          //           color: Colors.grey.shade400,
                          //         ),
                          //       ),
                          //       child: Padding(
                          //         padding: EdgeInsets.symmetric(
                          //             horizontal: 10.0),
                          //         child: TypeAheadFormField(
                          //           textFieldConfiguration:
                          //               TextFieldConfiguration(
                          //             controller: searchController
                          //                 .typedValueController,
                          //             onChanged: (value) {
                          //               //_searchFormKey.currentState.save();
                          //             },
                          //             decoration: InputDecoration(
                          //               contentPadding: EdgeInsets.only(
                          //                   left: 8.0, top: 13),
                          //               border: InputBorder.none,
                          //               suffixIcon: IconButton(
                          //                 icon: Icon(
                          //                   Icons.close,
                          //                   color: Colors.grey,
                          //                 ),
                          //                 onPressed: () {
                          //                   searchController
                          //                       .typedValueController
                          //                       .clear();
                          //                 },
                          //               ),
                          //               hintText: 'Search',
                          //             ),
                          //           ),
                          //           suggestionsCallback: (pattern) {
                          //             return searchController
                          //                 .getSearchSuggestions(pattern);
                          //           },
                          //           getImmediateSuggestions: true,
                          //           hideOnEmpty: true,
                          //           hideOnLoading: true,
                          //           hideSuggestionsOnKeyboardHide: true,
                          //           // noItemsFoundBuilder: (context) {
                          //           //   return Padding(
                          //           //     padding: const EdgeInsets.all(8.0),
                          //           //     child: Text('No Recommendations'),
                          //           //   );
                          //           // },
                          //           itemBuilder: (context, suggestion) {
                          //             return ListTile(
                          //               title: SubstringHighlight(
                          //                 text: suggestion,
                          //                 term: searchController
                          //                     .typedValueController.text,
                          //                 textStyleHighlight: TextStyle(
                          //                   color: Colors.black,
                          //                   fontWeight: FontWeight.w800,
                          //                 ),
                          //               ),
                          //             );
                          //           },
                          //           transitionBuilder: (context,
                          //               suggestionsBox, controller) {
                          //             return suggestionsBox;
                          //           },
                          //           onSuggestionSelected: (suggestion) {
                          //             searchController.typedValueController
                          //                 .text = suggestion;
                          //           },
                          //           onSaved: (value) {
                          //             searchController.searchText = value;
                          //           },
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),

                      // Container(
                      //   decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(30.0),
                      //       color: Colors.grey.shade200),
                      //   child: GetBuilder<SearchController>(
                      //     init: SearchController(),
                      //     builder: (searchController) => Form(
                      //       key: _searchFormKey,
                      //       child: TypeAheadFormField(
                      //         textFieldConfiguration: TextFieldConfiguration(
                      //           controller:
                      //               searchController.typedValueController,
                      //           decoration: InputDecoration(
                      //             border: InputBorder.none,
                      //             prefixIcon: GestureDetector(
                      //               onTap: () {
                      //                 _searchFormKey.currentState.save();
                      //                 searchController.onSearchPressed();
                      //               },
                      //               child: Icon(
                      //                 Icons.search,
                      //                 color: Colors.black,
                      //               ),
                      //             ),
                      //             hintText: 'Search',
                      //           ),
                      //         ),
                      //         suggestionsCallback: (pattern) {
                      //           return searchController
                      //               .getSearchSuggestions(pattern);
                      //         },
                      //         getImmediateSuggestions: true,
                      //         hideOnEmpty: true,
                      //         hideOnLoading: true,
                      //         hideSuggestionsOnKeyboardHide: true,
                      //         noItemsFoundBuilder: (context) {
                      //          return Padding(
                      //          padding: const EdgeInsets.all(8.0),
                      //          child: Text('No Recommendations'),
                      //          );
                      //           },
                      //         itemBuilder: (context, suggestion) {
                      //           return ListTile(
                      //             title: SubstringHighlight(
                      //               text: suggestion,
                      //               term: searchController
                      //                   .typedValueController.text,
                      //               textStyleHighlight: TextStyle(
                      //                   color: Colors.black,
                      //                   fontWeight: FontWeight.w800),
                      //             ),
                      //           );
                      //         },
                      //         transitionBuilder:
                      //             (context, suggestionsBox, controller) {
                      //           return suggestionsBox;
                      //         },
                      //         onSuggestionSelected: (suggestion) {
                      //           searchController.typedValueController.text =
                      //               suggestion;
                      //         },
                      //         onSaved: (value) {
                      //           searchController.searchText = value;
                      //         },
                      //       ),
                      //       // child: TextFormField(
                      //       //    decoration: InputDecoration(
                      //       //      border: InputBorder.none,
                      //       //      prefixIcon: IconButton(
                      //       //        icon: Icon(Icons.search,),
                      //       //        onPressed: (){
                      //       //         searchController.onSearchPressed();
                      //       //        },
                      //       //        color: Colors.black,
                      //       //      ),
                      //       //    ),
                      //       //   onSaved: (value){
                      //       //      searchController.searchText = value;
                      //       //   },
                      //       //   // validator: (value){
                      //       //   //   if(value == ''){
                      //       //   //     return '';
                      //       //   //   }
                      //       //   //   return null;
                      //       //   // },
                      //       //  ),
                      //     ),
                      //   ),
                      // ),

                      SizedBox(
                        height: 25.0,
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
                            fontColor: kPrimaryColor,
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
