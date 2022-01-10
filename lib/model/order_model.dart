import 'package:e_commerce/model/cart_product_model.dart';
import 'package:flutter/cupertino.dart';

class OrderModel {
  String userId, orderDate;
  List<CartProductModel> orderProducts;
  UserGivenAddress address;
  String status;
  String totalPrice;
  OrderModel({
    @required this.userId,
    @required this.orderDate,
    @required this.orderProducts,
    @required this.address,
    @required this.status,
    @required this.totalPrice,
  });

  OrderModel.fromJson(Map<String, dynamic> orderData) {
    userId = orderData['userId'];
    orderDate = orderData['pickedDate'];
    orderProducts = assignOrderProducts(orderData['orderedProducts']);
    address = UserGivenAddress.fromJson(orderData['address']);
    status = orderData['status'];
    totalPrice = orderData['totalPrice'];
  }
  toJson() {
    return {
      'userId': userId,
      'pickedDate': orderDate,
      'orderedProducts':
          orderProducts.map((product) => product.toJson()).toList(),
      'address': address.toJson(),
      'status': status,
      'totalPrice': totalPrice,
    };
  }

  List<CartProductModel> assignOrderProducts(List data) {
    List<CartProductModel> allOrderProducts = [];
    for (int i = 0; i < data.length; i++) {
      allOrderProducts.add(CartProductModel.fromJson(data[i]));
    }
    return allOrderProducts;
  }
}

class UserGivenAddress {
  String street1, street2, city, state, country;
  UserGivenAddress({
    this.street1,
    this.street2,
    this.city,
    this.state,
    this.country,
  });
  UserGivenAddress.fromJson(Map<String, dynamic> receivedAddress) {
    street1 = receivedAddress['street1'];
    street2 = receivedAddress['street2'];
    city = receivedAddress['city'];
    state = receivedAddress['state'];
    country = receivedAddress['country'];
  }

  toJson() {
    return {
      'street1': street1,
      'street2': street2,
      'city': city,
      'state': state,
      'country': country,
    };
  }
}
