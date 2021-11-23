class CartProductModel {
  String name, image, price, productId;
  int quantity;

  CartProductModel(
      {this.name, this.image, this.price, this.quantity, this.productId});

  CartProductModel.fromJson(Map<dynamic, dynamic> data) {
    if (data == null) {
      return;
    }
    name = data['name'];
    image = data['image'];
    price = data['price'];
    quantity = data['quantity'];
    productId = data['productId'];
  }
  toJson() {
    return {
      'name': name,
      'image': image,
      'price': price,
      'quantity': quantity,
      'productId' : productId
    };
  }
}
