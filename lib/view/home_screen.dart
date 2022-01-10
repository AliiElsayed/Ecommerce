import 'package:e_commerce/view/category_details.dart';
import 'package:e_commerce/view/widgets/custom_product_viewer.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:e_commerce/view_model/home_controller.dart';
import 'package:e_commerce/view_model/search_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:substring_highlight/substring_highlight.dart';

class HomeScreen extends StatelessWidget {
  final _searchFormKey = GlobalKey<FormState>();
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
                      Container(
                        child: GetBuilder<SearchController>(
                          init: Get.put(SearchController()),
                          builder: (searchController) => Row(
                            children: [
                              Container(
                                height: 45.0,
                                width: 45.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.0),
                                  shape: BoxShape.rectangle,
                                  color: Colors.grey.shade200,
                                  border: Border.all(
                                    color: Colors.grey.shade400,
                                  ),
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.search,
                                    color: Colors.black45,
                                    size: 28.0,
                                  ),
                                  onPressed: () {
                                    _searchFormKey.currentState.save();
                                    searchController.onSearchPressed();
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                              Expanded(
                                child: Form(
                                  key: _searchFormKey,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30.0),
                                      color: Colors.grey.shade200,
                                      border: Border.all(
                                        color: Colors.grey.shade400,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: TypeAheadFormField(
                                        textFieldConfiguration:
                                            TextFieldConfiguration(
                                          controller: searchController
                                              .typedValueController,
                                          onChanged: (value) {
                                            //_searchFormKey.currentState.save();
                                          },
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            suffixIcon: IconButton(
                                              icon: Icon(
                                                Icons.close,
                                                color: Colors.grey,
                                              ),
                                              onPressed: () {
                                                searchController
                                                    .typedValueController
                                                    .clear();
                                              },
                                            ),
                                            hintText: 'Search',
                                          ),
                                        ),
                                        suggestionsCallback: (pattern) {
                                          return searchController
                                              .getSearchSuggestions(pattern);
                                        },
                                        getImmediateSuggestions: true,
                                        hideOnEmpty: true,
                                        hideOnLoading: true,
                                        hideSuggestionsOnKeyboardHide: true,
                                        // noItemsFoundBuilder: (context) {
                                        //   return Padding(
                                        //     padding: const EdgeInsets.all(8.0),
                                        //     child: Text('No Recommendations'),
                                        //   );
                                        // },
                                        itemBuilder: (context, suggestion) {
                                          return ListTile(
                                            title: SubstringHighlight(
                                              text: suggestion,
                                              term: searchController
                                                  .typedValueController.text,
                                              textStyleHighlight: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w800),
                                            ),
                                          );
                                        },
                                        transitionBuilder: (context,
                                            suggestionsBox, controller) {
                                          return suggestionsBox;
                                        },
                                        onSuggestionSelected: (suggestion) {
                                          searchController.typedValueController
                                              .text = suggestion;
                                        },
                                        onSaved: (value) {
                                          searchController.searchText = value;
                                        },
                                      ),
                                    ),
                                  ),
                                  // child: TextFormField(
                                  //    decoration: InputDecoration(
                                  //      border: InputBorder.none,
                                  //      prefixIcon: IconButton(
                                  //        icon: Icon(Icons.search,),
                                  //        onPressed: (){
                                  //         searchController.onSearchPressed();
                                  //        },
                                  //        color: Colors.black,
                                  //      ),
                                  //    ),
                                  //   onSaved: (value){
                                  //      searchController.searchText = value;
                                  //   },
                                  //   // validator: (value){
                                  //   //   if(value == ''){
                                  //   //     return '';
                                  //   //   }
                                  //   //   return null;
                                  //   // },
                                  //  ),
                                ),
                              ),
                            ],
                          ),
                        ),
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
                      //         // noItemsFoundBuilder: (context) {
                      //         //   return Padding(
                      //         //     padding: const EdgeInsets.all(8.0),
                      //         //     child: Text('No Recommendations'),
                      //         //   );
                      //         // },
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
