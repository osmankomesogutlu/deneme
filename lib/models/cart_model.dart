class CartModel {
  late String id;
  late String name;
  late String productId;
  late double price;
  late double cost;
  late int quantity;
  late String image;

  CartModel({
    required this.id,
    required this.name,
    required this.productId,
    required this.price,
    required this.cost,
    required this.quantity,
    required this.image,
  });

  CartModel.fromMap(Map<String, dynamic> data) {
    id = data["id"];
    name = data["name"];
    productId = data["productId"];
    price = double.parse(data["price"].toString());
    cost = double.parse(data["cost"].toString());
    quantity = data["quantity"];
    image = data["image"];
  }

  Map toJson() => {
        "id": id,
        "name": name,
        "productId": productId,
        "price": price,
        "cost": price * quantity,
        "quantity": quantity,
        "image": image,
      };
}
