import 'package:flutter/material.dart';

final String cartTableName = 'cartProductsTable';
final String cartProductName = 'name';
final String cartProductImage = 'image';
final String cartProductQuantity = 'quantity';
final String cartProductPrice = 'price';
final String cartProductId = 'productId';

final String favTableName = 'favoriteProductsTable';
final String favProductName = 'name';
final String favProductImage = 'image';
final String favProductPrice = 'price';
final String favProductId = 'productId';
final String favProductDescription = 'description';

const kPrimaryColor = Color.fromRGBO(0, 197, 105, 1.0);

const kTileHeight = 50.0;
const inProgressColor = Colors.black87;
const todoColor = Color(0xffd1d2d7);

enum Pages {
  DeliveryTime,
  AddAddress,
  Summary,
}

enum Delivery { StandardDelivery, NextDayDelivery, NominatedDelivery }

enum SlidableActions { Delete, AddToFavorite }
