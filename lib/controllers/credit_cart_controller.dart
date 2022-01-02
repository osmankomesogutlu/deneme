import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_firebase/constants/controllers.dart';
import 'package:uuid/uuid.dart';

class CreditCardController extends GetxController {
  static CreditCardController instance = CreditCardController();

   TextEditingController cardHolderName = TextEditingController();
   TextEditingController cardNumber = TextEditingController();
   TextEditingController cvvCode = TextEditingController();
   TextEditingController expiryDate = TextEditingController();

  void creditCardAdd() {
    try {
      String itemId = const Uuid().v1().toString();
      print(itemId);
      userController.updateUserData({
        "creditCard": FieldValue.arrayUnion([
          {
            'id': itemId,
            'cardHolderName': cardHolderName.text.trim(),
            'cardNumber': cardNumber.text.trim(),
            'cvvCode': cvvCode.text.trim(),
            'expiryDate': expiryDate.text.trim(),
          }
        ]),
      });
      
      Get.snackbar(
          "Kart Eklendi", " Kart Başarı ile eklendi");
    } catch (e) {
      Get.snackbar("Bilinmeyen hata", e.toString());
      debugPrint(e.toString());
    }
  }
}
