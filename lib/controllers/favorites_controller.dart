import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_firebase/constants/controllers.dart';
import 'package:getx_firebase/models/favorite_model.dart';
import 'package:getx_firebase/models/product_model.dart';
import 'package:getx_firebase/models/user_model.dart';
import 'package:uuid/uuid.dart';

class FavoritesController extends GetxController {
  static FavoritesController instance = Get.find();
  var isFavorite = false.obs;

 /*  @override
  void onReady() {
    super.onReady();
    ever(userController.userModel, changeIsFavorite);
  }
 */
  void addFovorite(ProductModel productModel) {
    try {
      if (isItemAlreadyAdded(productModel)) {
      // removeFavoriteItem(favoriteModel!);
      } else {
        String itemId = const Uuid().v1().toString();
        userController.updateUserData({
          "favorite": FieldValue.arrayUnion([
            {
              "id": itemId,
              "productId": productModel.id,
              "name": productModel.name,
              "image": productModel.images[0],
              "price": productModel.price,
              "isFavorite": true,
              "timeStamp": Timestamp.now(),
            }
          ])
        });
        Get.snackbar("Favori", "${productModel.name} Ürün favorilere  eklendi");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  bool isItemAlreadyAdded(ProductModel productModel)=>
    userController.userModel.value.favorite
        .where((item) => item.productId == productModel.id)
        .isNotEmpty;
    
  void removeFavoriteItem(ProductModel productModel){
    try {
      if (isItemAlreadyAdded(productModel)) {
        
        
      }
      
    } catch (e) {
    }
  }

  /* changeIsFavorite(UserModel userModel) {
    isFavorite.value = false;
    if (userModel.favorite.isNotEmpty) {
      for (var element in userModel.favorite) {
        isFavorite = element.isFavorite as RxBool;
      }
    }
  } */
  void favoriteControl(ProductModel productModel){
    isItemAlreadyAdded(productModel);
  }

  void removeFavoriteItems(FavoriteModel favoriteModel) {
    try {
      userController.updateUserData({
        "favorite": FieldValue.arrayRemove([
          favoriteModel.toJson(),
        ])
      });
    } catch (e) {
      Get.snackbar("Hata", "Ürün favorilerden çıkmadı");
      debugPrint(e.toString());
    }
  }
}
