
import 'package:flutter/material.dart';

final String tableName = 'allCartProducts';
final String productName = 'name';
final String productImage = 'image';
final String  productQuantity= 'quantity';
final String  productPrice = 'price';
final String  productId = 'productId';

const kPrimaryColor = Color.fromRGBO(0, 197, 105, 1);

const kTileHeight = 50.0;
const inProgressColor = Colors.black87;
const todoColor = Color(0xffd1d2d7);

enum Pages {
  DeliveryTime,
  AddAddress,
  Summary,
}

enum Delivery{
  StandardDelivery,
  NextDayDelivery,
  NominatedDelivery
}