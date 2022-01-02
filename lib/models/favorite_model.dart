

import 'package:cloud_firestore/cloud_firestore.dart';

class FavoriteModel {
  late String id;
  late String productId;
  late String name;
  late String image;
  late double price;
   bool isFavorite = false;
  late Timestamp timeStamp;

  FavoriteModel({
    required this.id,
    required this.productId,
    required this.name,
    required this.image,
    required this.price,
    required this.isFavorite,
    required this.timeStamp,
  });

  FavoriteModel.fromMap(Map<String, dynamic> data) {
    id = data["id"];
    productId = data["productId"];
    name = data["name"];
    image = data["image"];
    price = double.parse(data["price"].toString());
    isFavorite = data["isFavorite"];
    timeStamp = data["timeStamp"];
  }

  Map toJson() => {
        "id": id,
        "productId": productId,
        "name": name,
        "image": image,
        "price": price,
        "isFavorite": isFavorite,
        "timeStamp": timeStamp,
      };
}
