class CartProductModel {
  String name, image, price;
  int quantity;

  CartProductModel({this.name, this.image, this.price, this.quantity});

  CartProductModel.fromJson(Map<dynamic, dynamic> data) {
    if (data == null) {
      return;
    }
    name = data['name'];
    image = data['image'];
    price = data['price'];
    quantity = data['quantity'];
  }
  toJson() {
    return {
      'name': name,
      'image': image,
      'price': price,
      'quantity': quantity,
    };
  }
}
