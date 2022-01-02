import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_firebase/constants/controllers.dart';
import 'package:getx_firebase/models/adres_model.dart';
import 'package:getx_firebase/models/credit_card_model.dart';
import 'package:getx_firebase/models/product_model.dart';
import 'package:uuid/uuid.dart';

class OrderController extends GetxController {
  static OrderController instance = Get.find();

  void orderProductAdd(ProductModel productModel) {
    try {
      String itemId = const Uuid().v1().toString();
      print(itemId);
      userController.updateUserData({
        "orders": FieldValue.arrayUnion([
          {
            'id': itemId,
            'productId': productModel.id,
            'image': productModel.images[0],
            'productName': productModel.name,
            'timeStamp': Timestamp.now(),
          }
        ]),
      });

      Get.snackbar("Sipariş", "Siparişin alındı");
    } catch (e) {
      debugPrint(e.toString());
    }
    void orderAdressAdd(AdressModel adressModel) {
      try {
        userController.updateUserData({
          "orders": FieldValue.arrayUnion([
            {
              'adressId': adressModel.id,
              'adresName': adressModel.adresName,
            }
          ]),
        });

        Get.snackbar("Sipariş", "Adres eklendi.");
      } catch (e) {
        debugPrint(e.toString());
      }
      void orderCardAdd(CardModel cardModel) {
        try {
          String itemId = const Uuid().v1().toString();
          print(itemId);
          userController.updateUserData({
            "orders": FieldValue.arrayUnion([
              {
                'paymentId': cardModel.id,
                'paymentName': cardModel.cardHolderName,
              }
            ]),
          });

          Get.snackbar("Sipariş", "Siparişin alındı");
        } catch (e) {
          debugPrint(e.toString());
        }
      }
    }
  }
}
