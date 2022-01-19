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

//const kPrimaryColor = Color.fromRGBO(0, 197, 105, 1.0);
const MaterialColor kPrimaryColor = const MaterialColor(
  0xFF00C569,
  const <int, Color>{
    50: const Color(0xFF00C569),
    100: const Color(0xFF00C569),
    200: const Color(0xFF00C569),
    300: const Color(0xFF00C569),
    400: const Color(0xFF00C569),
    500: const Color(0xFF00C569),
    600: const Color(0xFF00C569),
    700: const Color(0xFF00C569),
    800: const Color(0xFF00C569),
    900: const Color(0xFF00C569),
  },
);

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
