import 'package:e_commerce/model/cart_product_model.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:e_commerce/view_model/cart_controller.dart';
import 'package:e_commerce/view_model/favorites_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../constants.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavoritesController>(
      init: FavoritesController(),
      builder: (favoritesController) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: CustomText(
            text: 'Favorites',
            fontColor: Colors.black87,
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black87,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: favoritesController.loading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : favoritesController.allFavoriteProducts.isEmpty
                ? CustomText(
                    text: 'No Products Added Yet .....!!',
                    size: 25.0,
                    alignment: Alignment.center,
                  )
                : Container(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Slidable(
                          actionPane: SlidableDrawerActionPane(),
                          actions: [
                            GetBuilder<CartController>(
                              init: CartController(),
                              builder: (cartController) => Container(
                                margin: EdgeInsets.symmetric(vertical: 10.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(8.0),
                                    bottomRight: Radius.circular(8.0),
                                  ),
                                  child: IconSlideAction(
                                    iconWidget: Icon(
                                      Icons.add_shopping_cart,
                                      size: 40.0,
                                      color: Colors.white,
                                    ),
                                    color: kPrimaryColor,
                                    onTap: () {
                                      cartController.addToCart(
                                        CartProductModel(
                                          image: favoritesController
                                              .allFavoriteProducts[index].image,
                                          name: favoritesController
                                              .allFavoriteProducts[index].name,
                                          price: favoritesController
                                              .allFavoriteProducts[index].price,
                                          productId: favoritesController
                                              .allFavoriteProducts[index]
                                              .productId,
                                          quantity: 1,
                                        ),
                                        context,
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                          secondaryActions: [
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 10.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8.0),
                                  bottomLeft: Radius.circular(8.0),
                                ),
                                child: IconSlideAction(
                                  iconWidget: Icon(
                                    Icons.delete_forever_outlined,
                                    size: 40.0,
                                    color: Colors.white,
                                  ),
                                  color: Color.fromRGBO(250, 68, 37, 1.0),
                                  onTap: () {
                                    favoritesController.removeFromFavorites(
                                        favoritesController
                                            .allFavoriteProducts[index]
                                            .productId);
                                  },
                                ),
                              ),
                            ),
                          ],
                          actionExtentRatio: 0.27,
                          child: Container(
                            padding: EdgeInsets.all(15.0),
                            margin: EdgeInsets.symmetric(
                                horizontal: 13.0, vertical: 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 1,
                                  blurRadius: 8,
                                  offset: Offset(3, 8),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 135.0,
                                  width: 120,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.network(
                                      favoritesController
                                          .allFavoriteProducts[index].image,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        left: 12.0, top: 10.0, bottom: 10.0),
                                    height: 132,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          text: favoritesController
                                              .allFavoriteProducts[index].name,
                                          size: 18.0,
                                          weight: FontWeight.bold,
                                        ),
                                        SizedBox(
                                          height: 8.0,
                                        ),
                                        Expanded(
                                          child: CustomText(
                                            text: favoritesController
                                                .allFavoriteProducts[index]
                                                .description,
                                            fontColor: Colors.grey.shade600,
                                            size: 17.0,
                                            linesNum: 3,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 7.0,
                                        ),
                                        CustomText(
                                          text:
                                              '\$${favoritesController.allFavoriteProducts[index].price}',
                                          fontColor: kPrimaryColor,
                                          size: 20.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: favoritesController.allFavoriteProducts.length,
                    ),
                  ),
      ),
    );
  }
}
