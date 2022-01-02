import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_firebase/constants/controllers.dart';
import 'package:getx_firebase/models/cart_model.dart';

import 'package:getx_firebase/models/product_model.dart';
import 'package:getx_firebase/models/user_model.dart';
import 'package:uuid/uuid.dart';

class CartController extends GetxController {
  static CartController instance = Get.find();
  Rx<double> totalPrice = 0.0.obs;

  String colleciton = "cart";

  int quantity = 1;

  @override
  void onReady() {
    super.onReady();
    ever(userController.userModel, changeCartTotalPrice);
  }

  void addProductToCart(ProductModel productModel) {
    try {
      if (_isItemAlreadyAdded(productModel)) {
        Get.snackbar("Ürün", "${productModel.name} Zaten var");
        print("En Baştan Geliyorum");
        kontrolET();
      } else {
        /* var uuid = const Uuid();
        var itemId = uuid.v1(); */
        String itemId = const Uuid().v1().toString();
        print(itemId);
        userController.updateUserData({
          "cart": FieldValue.arrayUnion([
            {
              "id": itemId,
              "productId": productModel.id,
              "name": productModel.name,
              "quantity": 1,
              "image": productModel.images[0],
              "price": productModel.price,
              "cost": productModel.price,
            }
          ]),
        });
        kontrolET();
        Get.snackbar(
            "Ürün Eklendi", "${productModel.name} Ürün sepete yeni eklendi");
      
      }
    } catch (e) {
      Get.snackbar("Hata", "Ürün eklenmedi. ${e.toString()}");
      debugPrint(e.toString());
      kontrolET();
    }
  }



  void removeCartItem(CartModel cartModel) {
    try {
      userController.updateUserData({
        "cart": FieldValue.arrayRemove([
          cartModel.toJson(),
        ])
      });
    } catch (e) {
      Get.snackbar("Hata", "Ürün silinemedi");
      debugPrint(e.toString());
    }
  }

  changeCartTotalPrice(UserModel userModel) {
    totalPrice.value = 0.0;
    if (userModel.cart.isNotEmpty) {
      for (var element in userModel.cart) {
        totalPrice += element.cost;
      }
    }
  }

  bool _isItemAlreadyAdded(ProductModel productModel) =>
      userController.userModel.value.cart
          .where((item) => item.productId == productModel.id)
          .isNotEmpty;

  void decreaseQuantity(CartModel item) {
    if (item.quantity == 1) {
      removeCartItem(item);
    } else {
      removeCartItem(item);
      item.quantity--;
      userController.updateUserData({
        "cart": FieldValue.arrayUnion([item.toJson()])
      });
    }
  }

  void increaseQuantity(CartModel item) {
    removeCartItem(item);
    item.quantity++;
    ({"quantity": item.quantity});
    userController.updateUserData({
      "cart": FieldValue.arrayUnion([item.toJson()])
    });
  }

 void kontrolET() {
    print(userController.userModel.value.cart.length);
  }

 
}
