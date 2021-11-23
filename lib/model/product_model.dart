import 'package:e_commerce/helper/extension.dart';
import 'package:flutter/cupertino.dart';

class ProductModel {
  String name, image, description, size, price, brand ,productId;
  Color color;

  ProductModel({
    this.name,
    this.image,
    this.description,
    this.size,
    this.color,
    this.price,
    this.brand,
    this.productId,
  });

  ProductModel.fromJson(Map<dynamic, dynamic> products) {
    if (products == null) {
      return;
    }
    name = products['name'];
    image = products['image'];
    description = products['description'];
    size = products['size'];
    color = HexColor.fromHex(products['color']);
    price = products['price'];
    brand = products['brand'];
    productId = products['productId'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'description': description,
      'size': size,
      'color': color,
      'price': price,
      'brand': brand,
      'productId' :productId
    };
  }
}
