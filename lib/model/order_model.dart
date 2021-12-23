import 'package:e_commerce/model/cart_product_model.dart';

class OrderModel {
  String userId, dateTime;
  List<CartProductModel> orderedProducts;
  DeterminedAddress address;

  OrderModel({
    this.userId,
    this.dateTime,
    this.orderedProducts,
    this.address,
  });

  OrderModel.fromJson(Map<String, dynamic> orderData) {
    userId = orderData['userId'];
    dateTime = orderData['dateTime'];
    orderedProducts = orderData['orderedProducts'];
    address = orderData['address'];
  }
  toJson() {
    return {
      'userId': userId,
      'dateTime': dateTime,
      'orderedProducts': orderedProducts,
      'address': address,
    };
  }
}

class DeterminedAddress {
  String street1, street2, city, state, country;
  DeterminedAddress({
    this.street1,
    this.street2,
    this.city,
    this.state,
    this.country,
  });
  DeterminedAddress.fromJson(Map<String, dynamic> receivedAddress) {
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
