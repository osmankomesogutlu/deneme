import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  late String id;
  late String productId;
  late String adressId;
  late String paymentId;
  late String productName;
  late String adresName;
  late String paymentName;
  late String image;
  late Timestamp timeStamp;

  OrderModel({
    required this.id,
    required this.paymentId,
    required this.adressId,
    required this.productId,
    required this.adresName,
    required this.paymentName,
    required this.productName,
    required this.image,
    required this.timeStamp,
  });

  OrderModel.formMap(Map<String, dynamic> data) {
    id = data["id"];
    productId = data["productId"];
    adressId = data["adressId"];
    paymentId = data["paymentId"];
    adresName = data["adresName"];
    paymentName = data["paymentName"];
    image = data["image"];
    productName = data["productName"];
    timeStamp = data["timeStamp"];
  }
}
