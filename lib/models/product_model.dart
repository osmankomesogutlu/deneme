class ProductModel {
  late String id;
  late String name;
  late String description;
  late String categoryId;
  late List<String> images;
  late double price;
  bool favorite = false;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.images,
    required this.price,
    required this.favorite,
    required this.categoryId,
  });

  ProductModel.fromMap(Map<String, dynamic> data) {
    id = data[ "id"];
    name = data["name"];
    description = data["description"];
    images = data["images"].cast<String>();
    price = data["price"].toDouble();
    favorite = data["favorite"];
    categoryId = data["categoryId"];
  }
}
